// UI-facing types for PalabraBox components.
//
// Database row shapes come from the generated src/types/db.ts
// (regenerate with `npm run db:types`). The data hooks map DB rows onto
// the UI types below — components never talk to the raw schema.

import type { Tables } from './db'

export type Level = 'beginner' | 'intermediate'

export type QuestionType =
  'multiple_choice' | 'image_match' | 'listening' | 'fill_blank' | 'word_order'

/** Component contract for a quiz question (mapped from a questions row in useGame). */
export interface Question {
  id: string
  scenario_id: string
  type: QuestionType
  /** Prompt in the UI language (Spanish). */
  question_text: string
  /** Audio for listening / assembled sentence for word_order (target language). */
  question_text_tts: string | null
  hint: string | null
  /** The answer: English word/phrase, Spanish meaning (listening), or joined tokens (word_order). */
  correct_answer: string
  /** Distractors: options without the correct answer, or extra word_order tokens. */
  wrong_answers: string[]
  image_emoji: string | null
}

export interface Scenario {
  id: string
  /** Title in the UI language (Spanish). */
  title: string
  description: string | null
  category: string
  level: Level
  /** From the database (scenarios.emoji). */
  emoji: string
  sort_order: number
}

export interface ScenarioWithProgress extends Scenario {
  stars: number
  isLocked: boolean
}

export interface WordTranslation {
  text: string
  audioText: string | null
}

/** Flashcard word: English front, Spanish back (product direction es→en). */
export interface Word {
  id: string
  baseKey: string
  category: string
  level: Level
  emoji: string | null
  en: WordTranslation
  es: WordTranslation
}

/** Raw questions table row (generated). */
export type QuestionRow = Tables<'questions'>
