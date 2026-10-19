import { describe, expect, it } from 'vitest'
import { mapQuestionRow, selectQuestions } from './question'
import type { Question, QuestionRow } from '../types'

const identity = <T>(items: T[]): T[] => [...items]

function makeRow(partial: Partial<QuestionRow> & { data: QuestionRow['data'] }): QuestionRow {
  return {
    created_at: null,
    hint: null,
    id: 'q1',
    question_text: '¿Cómo se dice hola en inglés?',
    question_text_tts: null,
    scenario_id: 'sc1',
    sort_order: 1,
    source_language: 'es',
    target_language: 'en',
    type: 'multiple_choice',
    word_id: null,
    ...partial,
  }
}

function makeQuestion(partial: Partial<Question> & { id: string }): Question {
  return {
    scenario_id: 'sc1',
    type: 'multiple_choice',
    question_text: `prompt ${partial.id}`,
    question_text_tts: null,
    hint: null,
    correct_answer: `answer ${partial.id}`,
    wrong_answers: ['wrong a', 'wrong b'],
    image_emoji: null,
    ...partial,
  }
}

describe('mapQuestionRow', () => {
  it('maps a multiple_choice row: options minus the correct answer', () => {
    const row = makeRow({
      data: {
        correct: 'hello',
        options: ['hello', 'yes', 'goodbye', 'thanks'],
        tts: [{ text: 'hello', lang: 'en' }],
      },
    })
    const question = mapQuestionRow(row)
    expect(question).not.toBeNull()
    expect(question!.correct_answer).toBe('hello')
    expect(question!.wrong_answers).toEqual(['yes', 'goodbye', 'thanks'])
    expect(question!.question_text).toBe('¿Cómo se dice hola en inglés?')
    expect(question!.type).toBe('multiple_choice')
  })

  it('maps a listening row and keeps the Spanish answer with English audio', () => {
    const row = makeRow({
      type: 'listening',
      question_text: 'Escucha y selecciona el significado en español.',
      question_text_tts: 'sorry',
      data: {
        correct: 'lo siento',
        options: ['lo siento', 'hola', 'gracias', 'adiós'],
        audio_text: 'sorry',
        tts: [{ text: 'sorry', lang: 'en' }],
      },
    })
    const question = mapQuestionRow(row)
    expect(question!.correct_answer).toBe('lo siento')
    expect(question!.question_text_tts).toBe('sorry')
    expect(question!.wrong_answers).toEqual(['hola', 'gracias', 'adiós'])
  })

  it('maps a word_order row: joined tokens as the answer, pool minus correct as distractors', () => {
    const row = makeRow({
      type: 'word_order',
      question_text_tts: 'Hello, yes please.',
      data: {
        correct: ['Hello,', 'yes', 'please.'],
        words: ['Hello,', 'yes', 'please.', 'sorry', 'thanks'],
        tts: [{ text: 'Hello, yes please.', lang: 'en' }],
      },
    })
    const question = mapQuestionRow(row)
    expect(question!.correct_answer).toBe('Hello, yes please.')
    expect(question!.wrong_answers).toEqual(['sorry', 'thanks'])
  })

  it('maps image_match and extracts the emoji from data', () => {
    const row = makeRow({
      type: 'image_match',
      data: {
        correct: 'cat',
        options: ['cat', 'dog', 'bird', 'fish'],
        image_emoji: '🐱',
        tts: [{ text: 'cat', lang: 'en' }],
      },
    })
    const question = mapQuestionRow(row)
    expect(question!.image_emoji).toBe('🐱')
    expect(question!.wrong_answers).toEqual(['dog', 'bird', 'fish'])
  })

  it('returns null when the prompt or the answer is missing', () => {
    expect(mapQuestionRow(makeRow({ data: { correct: '', options: ['a'] } }))).toBeNull()
    expect(
      mapQuestionRow(makeRow({ question_text: '', data: { correct: 'x', options: ['x', 'y'] } })),
    ).toBeNull()
  })

  it('returns null for a choice question without distractors', () => {
    const row = makeRow({ data: { correct: 'hello', options: ['hello'] } })
    expect(mapQuestionRow(row)).toBeNull()
  })

  it('returns null for an unknown question type', () => {
    const row = makeRow({ type: 'mystery', data: { correct: 'x', options: ['x', 'y'] } })
    expect(mapQuestionRow(row)).toBeNull()
  })
})

describe('selectQuestions', () => {
  it('returns an empty array for non-positive counts', () => {
    expect(selectQuestions([makeQuestion({ id: 'a' })], 0)).toEqual([])
  })

  it('picks one question of each available type first', () => {
    const questions = [
      makeQuestion({ id: 'mc1', type: 'multiple_choice' }),
      makeQuestion({ id: 'mc2', type: 'multiple_choice', correct_answer: 'other' }),
      makeQuestion({ id: 'li1', type: 'listening', correct_answer: 'escucha' }),
      makeQuestion({ id: 'wo1', type: 'word_order', correct_answer: 'I go home' }),
    ]
    const selected = selectQuestions(questions, 3, [], identity)
    expect(selected).toHaveLength(3)
    expect(new Set(selected.map((q) => q.type))).toEqual(
      new Set(['multiple_choice', 'listening', 'word_order']),
    )
  })

  it('fills up to the requested count and never exceeds it', () => {
    const questions = Array.from({ length: 20 }, (_, i) =>
      makeQuestion({ id: `q${i}`, correct_answer: `answer ${i}` }),
    )
    expect(selectQuestions(questions, 10, [], identity)).toHaveLength(10)
    expect(selectQuestions(questions, 25, [], identity)).toHaveLength(20)
  })

  it('deduplicates identical questions', () => {
    const twin = makeQuestion({ id: 'a', correct_answer: 'same' })
    const questions = [
      twin,
      { ...twin, id: 'b' },
      makeQuestion({ id: 'c', correct_answer: 'diff' }),
    ]
    const selected = selectQuestions(questions, 10, [], identity)
    expect(selected).toHaveLength(2)
  })

  it('excludes blacklisted questions', () => {
    const questions = Array.from({ length: 10 }, (_, i) =>
      makeQuestion({ id: `q${i}`, correct_answer: `answer ${i}` }),
    )
    const selected = selectQuestions(questions, 10, ['q0', 'q1', 'q2'], identity)
    expect(selected).toHaveLength(7)
    expect(selected.every((q) => !['q0', 'q1', 'q2'].includes(q.id))).toBe(true)
  })

  it('ignores the blacklist when too few questions remain', () => {
    const questions = [makeQuestion({ id: 'q0' }), makeQuestion({ id: 'q1', correct_answer: 'x' })]
    const selected = selectQuestions(questions, 2, ['q0', 'q1'], identity)
    expect(selected).toHaveLength(2)
  })

  it('prefers answers not used by earlier picks', () => {
    const questions = [
      makeQuestion({ id: 'a', correct_answer: 'one' }),
      makeQuestion({ id: 'b', correct_answer: 'one', type: 'listening' }),
      makeQuestion({ id: 'c', correct_answer: 'two', type: 'listening' }),
    ]
    // one per type first: 'a' (mc) + one listening; then fill prefers 'two'
    const selected = selectQuestions(questions, 3, [], identity)
    const answers = selected.map((q) => q.correct_answer)
    expect(answers).toContain('two')
  })
})
