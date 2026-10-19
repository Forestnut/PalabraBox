// Zod schemas for PalabraBox content blocks (scripts/content_blocks/*.json).
//
// Product direction (fixed): a Spanish speaker learns English.
//   question.es  -> prompt shown to the user (UI language, stored as questions.question_text)
//   data.correct -> the answer (English for multiple_choice/fill_blank/image_match,
//                   Spanish meaning for listening, English tokens for word_order)
// The generator (scripts/generate-sql.mjs) writes source_language='es',
// target_language='en' for every question.

import { z } from 'zod'

export const LANGUAGE_CODES = ['en', 'es', 'pl']
export const QUESTION_TYPES = [
  'multiple_choice',
  'image_match',
  'listening',
  'fill_blank',
  'word_order',
]
export const LEVELS = ['beginner', 'intermediate']

/** Bilingual text (both languages required) — scenario titles/descriptions. */
export const langTextSchema = z.object({
  en: z.string().min(1),
  es: z.string().min(1),
})

/** Prompt text: Spanish is required (it is what gets stored), English is the reference. */
export const questionTextSchema = z.object({
  es: z.string().min(1),
  en: z.string().min(1).optional(),
})

export const ttsSegmentSchema = z.object({
  text: z.string().min(1),
  lang: z.enum(LANGUAGE_CODES),
})

/** Answer options, correct included. 2–6 options (we generate 4). */
const optionsSchema = z
  .array(z.string().min(1))
  .min(2, 'at least 2 options (correct + 1 distractor)')
  .max(6)

const ttsSchema = z.array(ttsSegmentSchema).min(1)

const multipleChoiceDataSchema = z.object({
  correct: z.string().min(1),
  options: optionsSchema,
  tts: ttsSchema,
})

const listeningDataSchema = z.object({
  correct: z.string().min(1),
  options: optionsSchema,
  audio_text: z.string().min(1),
  tts: ttsSchema,
})

const fillBlankDataSchema = z.object({
  correct: z.string().min(1),
  options: optionsSchema,
  tts: ttsSchema,
})

const imageMatchDataSchema = z.object({
  correct: z.string().min(1),
  options: optionsSchema,
  image_emoji: z.string().min(1),
  tts: ttsSchema,
})

const wordOrderDataSchema = z.object({
  correct: z.array(z.string().min(1)).min(2),
  words: z.array(z.string().min(1)).min(3),
  tts: ttsSchema,
})

export const questionSchema = z.discriminatedUnion('type', [
  z.object({
    type: z.literal('multiple_choice'),
    question: questionTextSchema,
    data: multipleChoiceDataSchema,
  }),
  z.object({
    type: z.literal('listening'),
    question: questionTextSchema,
    data: listeningDataSchema,
  }),
  z.object({
    type: z.literal('fill_blank'),
    question: questionTextSchema,
    data: fillBlankDataSchema,
  }),
  z.object({
    type: z.literal('image_match'),
    question: questionTextSchema,
    data: imageMatchDataSchema,
  }),
  z.object({
    type: z.literal('word_order'),
    question: questionTextSchema,
    data: wordOrderDataSchema,
  }),
])

export const wordSchema = z.object({
  base_key: z.string().min(1),
  en: z.string().min(1),
  es: z.string().min(1),
  emoji: z.string().min(1).optional(),
})

export const scenarioSchema = z.object({
  title: langTextSchema,
  description: langTextSchema,
  category: z.string().min(1),
  level: z.enum(LEVELS),
  emoji: z.string().min(1),
  words: z.array(wordSchema).min(1),
  questions: z.array(questionSchema).min(1),
})

/** One content block file = a list of scenarios. */
export const blockSchema = z.array(scenarioSchema).min(1)

/**
 * Parse and validate one block (array of scenarios).
 * Throws a ZodError with readable issues on invalid content.
 */
export function parseBlock(raw, sourceName = 'block') {
  const result = blockSchema.safeParse(raw)
  if (!result.success) {
    const details = result.error.issues
      .map((issue) => `  - [${issue.path.join('.') || sourceName}] ${issue.message}`)
      .join('\n')
    throw new Error(`Invalid content block ${sourceName}:\n${details}`)
  }
  return result.data
}
