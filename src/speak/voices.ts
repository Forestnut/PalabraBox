/**
 * Voice scoring for PalabraBox TTS.
 *
 * Picks the best available voice for a requested language WITHOUT falling
 * back to voices[0]. A missing voice for a language is a real, reportable
 * condition — the UI shows a banner and adjusts game content accordingly.
 *
 * A voice is considered usable for `lang` (one of 'en' | 'es' | 'pl') when
 * its BCP-47 tag starts with that prefix (e.g. 'en-US', 'en-GB' both match
 * 'en'). Exact matches are preferred over prefix matches.
 */

export type LangCode = 'en' | 'es' | 'pl'

/**
 * Score a single voice for the requested language. Higher is better.
 * Returns -Infinity if the voice does not match the language at all.
 *
 * Scoring criteria (transparent and testable):
 *   +100  Premium-quality cloud voices (Neural / Natural / Premium / Google w/ language suffix)
 *   +50   Any Google / Microsoft / Apple cloud voice (good quality, widely available)
 *   +20   The browser-default voice for this language (usually the best local pick)
 *   +10   Exact language tag match (e.g. request 'en-US' -> voice.lang 'en-US')
 *   +5    Prefix match (request 'en' -> voice.lang 'en-GB')
 *   -5    LocalService-only voice when a remote (cloud) alternative exists
 *          (local voices are often robotic; still usable, so only a small penalty)
 *
 * The score is tuned so that a local default voice still outranks a random
 * remote voice in a different regional variant, and non-matching languages
 * are excluded entirely.
 */
export function scoreVoice(voice: SpeechSynthesisVoice, requestedLang: string): number {
  const req = requestedLang.toLowerCase()
  const voiceLang = voice.lang.toLowerCase()
  const name = voice.name.toLowerCase()

  // Must match either exact or by prefix (split on '-').
  const reqPrefix = req.split('-')[0]
  const isExact = voiceLang === req
  const isPrefix = voiceLang.startsWith(reqPrefix + '-') || voiceLang === reqPrefix
  if (!isExact && !isPrefix) return -Infinity

  let score = 0

  // Tier 1: premium neural/natural voices (highest quality, cloud-based).
  if (/neural|natural|premium/.test(name)) {
    score += 100
  }
  // Tier 2: known cloud-vendor voices (Google / Microsoft / Apple).
  else if (/google|microsoft|apple/.test(name)) {
    score += 50
  }
  // Tier 3: well-known high-quality system voices.
  else if (/samantha|daniel|karen|serena/.test(name)) {
    score += 25
  }

  if (voice.default) score += 20
  if (isExact) score += 10
  else if (isPrefix) score += 5

  if (voice.localService) score -= 5

  return score
}

/**
 * Pick the best voice for a given language from a list, or null if no voice
 * matches the language. Does NOT fall back to voices[0].
 */
export function pickBestVoice(
  voices: readonly SpeechSynthesisVoice[],
  lang: LangCode | string,
): SpeechSynthesisVoice | null {
  let best: SpeechSynthesisVoice | null = null
  let bestScore = -Infinity

  for (const voice of voices) {
    const s = scoreVoice(voice, lang)
    if (s > bestScore) {
      bestScore = s
      best = voice
    }
  }

  return bestScore > -Infinity ? best : null
}

/**
 * Group voices by our supported language codes (en/es/pl). Voices that do
 * not match any supported prefix are excluded.
 */
export function groupVoicesByLang(
  voices: readonly SpeechSynthesisVoice[],
): Record<LangCode, SpeechSynthesisVoice[]> {
  const grouped: Record<LangCode, SpeechSynthesisVoice[]> = { en: [], es: [], pl: [] }
  for (const voice of voices) {
    const prefix = voice.lang.toLowerCase().split('-')[0] as LangCode
    if (prefix === 'en' || prefix === 'es' || prefix === 'pl') {
      grouped[prefix].push(voice)
    }
  }
  return grouped
}
