// Database Types based on Supabase Schema

export type Language = 'english' | 'spanish'
export type Level = 'beginner' | 'intermediate'
export type QuestionType = 'multiple_choice' | 'image_match' | 'listening' | 'fill_blank' | 'word_order'

export interface Scenario {
  id: string
  title: string
  title_display: string
  language: Language
  level: Level
  description: string | null
  emoji: string | null
  category: string
  sort_order: number
  created_at: string
}

export interface Question {
  id: string
  scenario_id: string
  type: QuestionType
  question_text: string
  question_text_tts: string | null
  correct_answer: string
  wrong_answers: string[]
  hint: string | null
  image_emoji: string | null
  sort_order: number
  created_at: string
}

export interface Word {
  id: string
  word: string
  language: Language
  level: Level
  category: string
  translation_es: string | null
  translation_en: string | null
  image_emoji: string | null
  audio_text: string | null
}
