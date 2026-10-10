// Semantic checks for PalabraBox content blocks — beyond what the zod schema
// can express (cross-field consistency, learning direction, completeness).
//
// checkBlocks(blocks) is pure: it takes parsed blocks (array of arrays of
// scenarios) and returns { errors: string[], warnings: string[] }.
// scripts/verify-content.mjs is the CLI wrapper; tests import this module.

const SPANISH_DIACRITICS = /[¿¡ñáéíóúüÁÉÍÓÚÜÑ]/

function normalizeText(value) {
  return value
    .toLowerCase()
    .normalize('NFD')
    .replace(/[̀-ͯ]/g, '')
    .replace(/[^a-z0-9 ]/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()
}

function countTokens(tokens) {
  const counts = new Map()
  for (const token of tokens) {
    const key = normalizeText(token)
    counts.set(key, (counts.get(key) ?? 0) + 1)
  }
  return counts
}

function isMultisetSubset(subset, superset) {
  for (const [key, count] of subset) {
    if ((superset.get(key) ?? 0) < count) return false
  }
  return true
}

/**
 * @param {Array<Array<object>>} blocks parsed blocks (blockSchema output)
 * @returns {{ errors: string[], warnings: string[] }}
 */
export function checkBlocks(blocks) {
  const errors = []
  const warnings = []
  const error = (msg) => errors.push(msg)
  const warn = (msg) => warnings.push(msg)

  // Pass 1 — global word registry: base_key -> { en, es } (normalized) and the
  // set of "Spanish-only" expressions (es forms whose en differs). Used to
  // catch wrong-direction answers without a fragile diacritics heuristic.
  const wordRegistry = new Map()
  const spanishOnly = new Set()

  for (const scenarios of blocks) {
    for (const scenario of scenarios) {
      for (const word of scenario.words) {
        const normalized = { en: normalizeText(word.en), es: normalizeText(word.es) }
        const existing = wordRegistry.get(word.base_key)
        if (existing) {
          if (existing.en !== normalized.en || existing.es !== normalized.es) {
            error(
              `scenario "${scenario.title.en}": base_key "${word.base_key}" conflicts with another scenario ` +
                `(en "${word.en}"/es "${word.es}" vs en "${existing.en}"/es "${existing.es}")`,
            )
          }
        } else {
          wordRegistry.set(word.base_key, normalized)
        }
        if (normalized.es && normalized.es !== normalized.en) {
          spanishOnly.add(normalized.es)
        }
      }
    }
  }

  // Pass 2 — per-scenario / per-question checks
  blocks.forEach((scenarios, blockIndex) => {
    const blockName = `block[${blockIndex}]`

    scenarios.forEach((scenario, scenarioIndex) => {
      const where = `${blockName}.scenario[${scenarioIndex}] "${scenario.title.en}"`
      const typeCounts = new Map()

      // --- words ---
      const seenBaseKeys = new Set()
      for (const word of scenario.words) {
        if (seenBaseKeys.has(word.base_key)) {
          error(`${where}: duplicate base_key "${word.base_key}" within scenario`)
        }
        seenBaseKeys.add(word.base_key)
      }

      // --- questions ---
      if (scenario.questions.length < 3) {
        warn(`${where}: only ${scenario.questions.length} questions (recommend at least 3)`)
      }

      for (const [qIndex, question] of scenario.questions.entries()) {
        const qWhere = `${where}.question[${qIndex}] (${question.type})`
        typeCounts.set(question.type, (typeCounts.get(question.type) ?? 0) + 1)

        const { data } = question

        // No literal 'undefined'/'null' garbage anywhere
        const serialized = JSON.stringify(question)
        if (/\bundefined\b/.test(serialized)) {
          error(`${qWhere}: contains literal "undefined"`)
        }

        // Prompt must be present and non-trivial
        if (!question.question.es || question.question.es.trim().length < 3) {
          error(`${qWhere}: question.es is empty or too short`)
        }

        // Options: unique, include correct
        if ('options' in data) {
          const options = data.options
          const normalizedOptions = options.map(normalizeText)
          if (new Set(normalizedOptions).size !== options.length) {
            error(`${qWhere}: duplicate options`)
          }
          if (!normalizedOptions.includes(normalizeText(data.correct))) {
            error(`${qWhere}: options do not include the correct answer "${data.correct}"`)
          }
          if (options.length < 4) {
            warn(`${qWhere}: only ${options.length} options (recommend 4)`)
          }
        }

        // Direction checks: answers/audio in the target language (en) must be English
        switch (question.type) {
          case 'multiple_choice':
          case 'fill_blank':
          case 'image_match': {
            if (SPANISH_DIACRITICS.test(data.correct)) {
              error(`${qWhere}: correct answer "${data.correct}" looks Spanish (expected English)`)
            } else if (spanishOnly.has(normalizeText(data.correct))) {
              error(
                `${qWhere}: correct answer "${data.correct}" is a Spanish vocabulary word (expected English)`,
              )
            }
            break
          }
          case 'listening': {
            if (!data.audio_text) {
              error(`${qWhere}: listening question has no audio_text`)
            } else {
              if (SPANISH_DIACRITICS.test(data.audio_text)) {
                error(
                  `${qWhere}: audio_text "${data.audio_text}" looks Spanish (listening audio must be English)`,
                )
              } else if (spanishOnly.has(normalizeText(data.audio_text))) {
                error(
                  `${qWhere}: audio_text "${data.audio_text}" is a Spanish vocabulary word (listening audio must be English)`,
                )
              }
            }
            if (data.correct === data.audio_text) {
              warn(`${qWhere}: correct equals audio_text (suspicious)`)
            }
            break
          }
          case 'word_order': {
            const sentence = data.correct.join(' ')
            if (SPANISH_DIACRITICS.test(sentence)) {
              error(`${qWhere}: word_order sentence "${sentence}" looks Spanish (expected English)`)
            }
            for (const token of data.correct) {
              if (spanishOnly.has(normalizeText(token))) {
                error(
                  `${qWhere}: word_order token "${token}" is a Spanish vocabulary word (expected English)`,
                )
                break
              }
            }
            const correctCounts = countTokens(data.correct)
            const wordCounts = countTokens(data.words)
            if (!isMultisetSubset(correctCounts, wordCounts)) {
              error(`${qWhere}: words pool does not contain all correct tokens`)
            }
            if (data.words.length <= data.correct.length) {
              error(`${qWhere}: no distractor tokens (words must be longer than correct)`)
            }
            if (data.words.length > 10) {
              warn(`${qWhere}: ${data.words.length} tokens is a lot (recommend <= 8)`)
            }
            break
          }
        }

        // fill_blank: the prompt must contain exactly one blank marker
        if (question.type === 'fill_blank') {
          const blanks = (question.question.es.match(/___/g) ?? []).length
          if (blanks !== 1) {
            error(`${qWhere}: question.es must contain exactly one "___" blank marker`)
          }
        }

        // tts sanity: segments marked en must not look Spanish
        for (const segment of data.tts ?? []) {
          if (segment.lang === 'en' && SPANISH_DIACRITICS.test(segment.text)) {
            error(`${qWhere}: tts segment marked "en" looks Spanish: "${segment.text}"`)
          }
        }
      }

      // Variety: at least 3 distinct question types per scenario
      if (typeCounts.size < 3) {
        warn(`${where}: only ${typeCounts.size} distinct question types (recommend at least 3)`)
      }
    })
  })

  return { errors, warnings }
}
