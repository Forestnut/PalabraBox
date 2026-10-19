// Pure question logic for the game: mapping DB rows onto the UI contract
// and selecting a session's questions. No I/O, no store access — unit tested.

import type { Question, QuestionRow, QuestionType } from '../types'
import { shuffleArray } from './shuffle'

const QUESTION_TYPES: readonly QuestionType[] = [
  'multiple_choice',
  'image_match',
  'listening',
  'fill_blank',
  'word_order',
]

function normalizeToken(value: string): string {
  return value.trim().toLowerCase()
}

function asStringArray(value: unknown): string[] {
  if (!Array.isArray(value)) return []
  return value.filter((item): item is string => typeof item === 'string' && item.trim().length > 0)
}

/**
 * Maps a questions table row onto the UI Question contract.
 *
 * Returns null for rows that cannot render (missing prompt/answer, or a
 * choice question without distractors). Content validity is enforced
 * upstream by scripts/verify-content.mjs — this is a guard, not a repair.
 */
export function mapQuestionRow(row: QuestionRow): Question | null {
  if (!QUESTION_TYPES.includes(row.type as QuestionType)) return null
  if (!row.question_text || !row.question_text.trim()) return null

  const data = (row.data ?? {}) as Record<string, unknown>
  const rawCorrect = data.correct
  const correctTokens = Array.isArray(rawCorrect) ? rawCorrect.map(String) : null
  const correct = correctTokens
    ? correctTokens.join(' ')
    : typeof rawCorrect === 'string'
      ? rawCorrect.trim()
      : ''
  if (!correct) return null

  let wrongAnswers: string[]
  if (row.type === 'word_order') {
    // Token pool minus the correct tokens = distractors.
    const pool = asStringArray(data.words)
    wrongAnswers = pool.filter(
      (token) => !correctTokens!.some((t) => normalizeToken(t) === normalizeToken(token)),
    )
  } else {
    // Options include the correct answer; distractors are the rest.
    const options = asStringArray(data.options)
    wrongAnswers = options.filter((option) => normalizeToken(option) !== normalizeToken(correct))
    if (wrongAnswers.length === 0) return null
  }

  return {
    id: row.id,
    scenario_id: row.scenario_id,
    type: row.type as QuestionType,
    question_text: row.question_text,
    question_text_tts: row.question_text_tts,
    hint: row.hint,
    correct_answer: correct,
    wrong_answers: wrongAnswers,
    image_emoji:
      typeof data.image_emoji === 'string' && data.image_emoji.trim() ? data.image_emoji : null,
  }
}

/**
 * Picks up to `count` questions for a game session: one of each available
 * type first (variety), then fills preferring answers not used yet, then
 * repeats. Questions played earlier in the session (blacklist) are excluded
 * unless that would leave fewer than half of the requested count.
 */
export function selectQuestions(
  questions: Question[],
  count: number,
  blacklist: readonly string[] = [],
  shuffle: <T>(items: T[]) => T[] = shuffleArray,
): Question[] {
  if (count <= 0 || questions.length === 0) return []

  // Deduplicate by type + prompt + answer.
  const uniqueByText = new Map<string, Question>()
  for (const question of questions) {
    const key = `${question.type}|${question.question_text}|${question.correct_answer}`
    if (!uniqueByText.has(key)) uniqueByText.set(key, question)
  }
  const unique = Array.from(uniqueByText.values())

  // One of each available type first.
  const byType = new Map<QuestionType, Question[]>()
  for (const question of unique) {
    const group = byType.get(question.type) ?? []
    group.push(question)
    byType.set(question.type, group)
  }

  const selected: Question[] = []
  const selectedIds = new Set<string>()
  const usedAnswers = new Set<string>()

  for (const group of byType.values()) {
    const picked = shuffle([...group])[0]
    selected.push(picked)
    selectedIds.add(picked.id)
    const answer = normalizeToken(picked.correct_answer)
    if (answer) usedAnswers.add(answer)
  }

  // Fill the remaining slots, preferring answers not asked yet.
  const remaining = shuffle(unique.filter((q) => !selectedIds.has(q.id)))
  const deferred: Question[] = []
  while (selected.length < count && remaining.length > 0) {
    const candidate = remaining.pop()!
    const answer = normalizeToken(candidate.correct_answer)
    if (!answer || !usedAnswers.has(answer)) {
      selected.push(candidate)
      selectedIds.add(candidate.id)
      if (answer) usedAnswers.add(answer)
    } else {
      deferred.push(candidate)
    }
  }
  while (selected.length < count && deferred.length > 0) {
    const candidate = deferred.pop()!
    selected.push(candidate)
    selectedIds.add(candidate.id)
  }

  // Exclude questions played earlier in this session, unless too few remain.
  const blacklisted = new Set(blacklist)
  let playable = selected.filter((q) => !blacklisted.has(q.id))
  if (playable.length < Math.ceil(count / 2)) playable = selected

  return shuffle(playable)
}
