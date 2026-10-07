import { useEffect, useState, useCallback } from 'react'
import { useNavigate } from 'react-router-dom'
import { isSupabaseConfigured, supabase, SUPABASE_CONFIG_ERROR } from '../lib/supabase'
import type { Question } from '../types'
import { useGameStore } from '../store/gameStore'
import { saveScenarioStars } from '../utils/progress'
import { useProgressStore } from '../store/progressStore'
import { analyticsService } from '../services/analyticsService'

import { shuffleArray } from '../utils/shuffle'

function normalizeAnswer(value: unknown): string {
  if (Array.isArray(value))
    return value.filter((v) => typeof v === 'string' || typeof v === 'number').join(' ')
  if (typeof value === 'string') return value
  if (typeof value === 'number' || typeof value === 'boolean') return String(value)
  return ''
}

function normalizeWrongAnswers(value: unknown, correct: string): string[] {
  if (!Array.isArray(value)) return []

  const normalizedCorrect = correct.trim().toLowerCase()
  return value
    .map((ans) => {
      if (typeof ans === 'string') return ans
      if (typeof ans === 'number' || typeof ans === 'boolean') return String(ans)
      return ''
    })
    .map((answer) => answer.trim())
    .filter((answer) => answer.length > 0)
    .filter((answer) => answer.toLowerCase() !== normalizedCorrect)
}

function isSpanishText(text: string): boolean {
  if (!text) return false
  const spanishChars = /[¿¡áéíóúñÁÉÍÓÚÑ]/
  if (spanishChars.test(text)) return true
  const words = text
    .toLowerCase()
    .replace(/[.,!?]/g, '')
    .split(/\s+/)
  const spanishWords = [
    'el',
    'la',
    'los',
    'las',
    'un',
    'una',
    'es',
    'está',
    'son',
    'soy',
    'eres',
    'yo',
    'tú',
    'él',
    'ella',
    'nosotros',
    'ellos',
    'mi',
    'tu',
    'su',
    'qué',
    'como',
    'con',
    'por',
    'para',
    'gracias',
    'hola',
    'adiós',
    'bien',
    'mal',
    'muy',
    'siento',
    'perdon',
    'ropa',
    'comida',
    'agua',
    'libro',
    'casa',
    'perro',
    'gato',
    'blanco',
    'negro',
    'rojo',
    'azul',
    'verde',
    'amarillo',
    'grande',
    'pequeño',
    'bueno',
    'malo',
    'nuevo',
    'viejo',
    'hombre',
    'mujer',
    'niño',
    'niña',
    'hoy',
    'ayer',
    'mañana',
    'siempre',
    'nunca',
    'dinero',
    'precio',
    'tienda',
    'comprar',
    'pagar',
    'restaurante',
    'hotel',
    'aeropuerto',
    'tren',
    'boleto',
  ]
  let matchCount = 0
  for (const w of words) {
    if (spanishWords.includes(w)) matchCount++
  }
  return matchCount > 0 && matchCount >= words.length / 2
}

function toRecord(value: unknown): Record<string, unknown> {
  if (!value) return {}
  if (typeof value === 'string') {
    try {
      const parsed = JSON.parse(value)
      return typeof parsed === 'object' && parsed !== null
        ? (parsed as Record<string, unknown>)
        : {}
    } catch {
      return {}
    }
  }
  return typeof value === 'object' ? (value as Record<string, unknown>) : {}
}

export function useGame(scenarioId: string | undefined) {
  const [questions, setQuestions] = useState<Question[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [scenarioLanguage, setScenarioLanguage] = useState<string | null>(null)

  const navigate = useNavigate()

  const {
    startGame,
    answerCorrect,
    answerWrong,
    nextQuestion,
    endGame,
    setLastResult,
    status,
    currentQuestionIndex,
    lives,
    maxLives,
    score,
    sessionBlacklist,
    addToBlacklist,
  } = useGameStore()

  useEffect(() => {
    let ignore = false
    if (!scenarioId) return

    async function fetchQuestions() {
      if (!isSupabaseConfigured) {
        setError(SUPABASE_CONFIG_ERROR)
        setLoading(false)
        return
      }

      try {
        setLoading(true)
        const { data, error: err } = await supabase
          .from('questions')
          .select('*')
          .eq('scenario_id', scenarioId)

        const { error: scenarioError } = await supabase
          .from('scenarios')
          .select('id') // Just checking existence safely, ignoring language column
          .eq('id', scenarioId)
          .single()

        if (err) throw err

        if (scenarioError) {
          console.warn('Scenario not found or error:', scenarioError)
        }

        if (ignore) return

        // Fallback to a default if language isn't explicitly resolved by schema anymore
        setScenarioLanguage('english')

        const allQuestions = (data as Array<Question & { data?: unknown }>)
          .map((q) => {
            // Parse JSONB data
            const qData = toRecord(q.data)

            // --- 1. Extract Correct Answer ---
            let correct = normalizeAnswer(qData.correct).trim()

            // translation fallbacks if correct wasn't immediately found
            if (!correct && (qData.translation_es || qData.translation_en)) {
              correct = normalizeAnswer(qData.translation_es ?? qData.translation_en).trim()
            }
            if (!correct && q.correct_answer) {
              correct = normalizeAnswer(q.correct_answer).trim() // legacy fallback
            }

            // --- 2. Extract Wrong Answers ---
            let wrongs: string[] = []

            if (qData.options && Array.isArray(qData.options)) {
              wrongs = normalizeWrongAnswers(qData.options, correct)
            } else if (qData.distractors && Array.isArray(qData.distractors)) {
              wrongs = normalizeWrongAnswers(qData.distractors, correct)
            } else if (q.wrong_answers) {
              wrongs = normalizeWrongAnswers(q.wrong_answers, correct) // legacy fallback
            } else if (qData.words && Array.isArray(qData.words)) {
              // legacy fallback for word_order
              const correctWords = Array.isArray(qData.correct)
                ? qData.correct.map(String)
                : correct.split(/\s+/)

              const distractors = [...qData.words.map(String)]

              for (const cw of correctWords) {
                const idx = distractors.findIndex((d) => d.toLowerCase() === cw.toLowerCase())
                if (idx >= 0) distractors.splice(idx, 1)
              }
              wrongs = normalizeWrongAnswers(distractors, correct)
            }

            // --- 3. Extract Image Emoji ---
            let image_emoji: string | null = null
            const emojiCandidate = normalizeAnswer(qData.image_emoji).trim()
            if (emojiCandidate) image_emoji = emojiCandidate
            else if (q.image_emoji) image_emoji = q.image_emoji

            // --- 4. Final Formatting ---
            let finalQuestionText = q.question_text

            const sourceText =
              qData.sentence ||
              qData.phrase ||
              qData.word ||
              qData.translation_es ||
              qData.translation_en

            let rawFinalQuestionText = finalQuestionText
            // Fix previous encoding corruption just in case
            if (typeof rawFinalQuestionText === 'string') {
              rawFinalQuestionText = rawFinalQuestionText
                .replace(/Âż/g, '¿')
                .replace(/CĂłmo/g, 'Cómo')
                .replace(/Ăˇ/g, 'á')
                .replace(/Ăł/g, 'ó')
                .replace(/Ă±/g, 'ñ')
            }
            let sourceTextStr =
              typeof sourceText === 'string' ? sourceText : String(sourceText || '')
            sourceTextStr = sourceTextStr
              .replace(/Âż/g, '¿')
              .replace(/CĂłmo/g, 'Cómo')
              .replace(/Ăˇ/g, 'á')
              .replace(/Ăł/g, 'ó')
              .replace(/Ă±/g, 'ñ')

            if (!rawFinalQuestionText || rawFinalQuestionText === 'undefined') {
              if (sourceTextStr) {
                finalQuestionText = sourceTextStr
                  .replace(/['"]/g, '')
                  .replace(/in english/gi, '')
                  .trim()
              } else {
                if (q.type === 'multiple_choice')
                  finalQuestionText = '¿Cuál es la respuesta correcta?'
                else if (q.type === 'image_match') finalQuestionText = '¿Qué ves en la imagen?'
                else if (q.type === 'listening') finalQuestionText = '¿Qué escuchas?'
                else finalQuestionText = 'Elige la respuesta correcta'
              }
            } else {
              // Helper for matched words
              const cleanMatch = (str: string) =>
                str
                  .replace(/['"]/g, '')
                  .replace(/in english/gi, '')
                  .trim()
              let targetWord = ''

              if (rawFinalQuestionText.includes('How do you say')) {
                const match =
                  rawFinalQuestionText.match(/'([^']+)'/) ||
                  rawFinalQuestionText.match(/"([^"]+)"/) ||
                  rawFinalQuestionText.match(/say\s+(.*?)(?:\s+in English)?\??$/i)
                if (match) targetWord = cleanMatch(match[1])
              } else if (
                rawFinalQuestionText.includes('What is the') &&
                rawFinalQuestionText.includes('word for')
              ) {
                const match =
                  rawFinalQuestionText.match(/'([^']+)'/) ||
                  rawFinalQuestionText.match(/"([^"]+)"/) ||
                  rawFinalQuestionText.match(/word for\s+(.*?)(?:\s+in English)?\??$/i)
                if (match) targetWord = cleanMatch(match[1])
              } else if (rawFinalQuestionText.includes('Translate')) {
                const match =
                  rawFinalQuestionText.match(/'([^']+)'/) ||
                  rawFinalQuestionText.match(/"([^"]+)"/) ||
                  rawFinalQuestionText.match(/Translate\s+(.*?)(?:\s+in English)?\??$/i)
                if (match) targetWord = cleanMatch(match[1])
              } else if (rawFinalQuestionText.includes('Which word is')) {
                const match =
                  rawFinalQuestionText.match(/'([^']+)'/) ||
                  rawFinalQuestionText.match(/"([^"]+)"/) ||
                  rawFinalQuestionText.match(/word is\s+(.*?)(?:\s+in English)?\??$/i)
                if (match) targetWord = cleanMatch(match[1])
              } else if (rawFinalQuestionText.includes('Which word represents')) {
                const emojiMatch = rawFinalQuestionText.match(/represents\s*(.+)\s*\??$/)
                if (emojiMatch) {
                  const extractedEmoji = emojiMatch[1].replace('?', '').trim()
                  if (extractedEmoji && !image_emoji) {
                    image_emoji = extractedEmoji
                  }
                }
                finalQuestionText = '¿Qué palabra representa la imagen?'
              }

              if (targetWord) {
                finalQuestionText = `¿Cómo se dice '${targetWord}'?`
              } else if (!rawFinalQuestionText.includes('Which word represents')) {
                if (sourceTextStr) {
                  finalQuestionText = `¿Cómo se dice '${cleanMatch(sourceTextStr)}'?`
                } else {
                  finalQuestionText = rawFinalQuestionText
                    .replace(/['"]/g, '')
                    .replace(/in english/gi, '')
                    .trim()
                  finalQuestionText =
                    finalQuestionText.charAt(0).toUpperCase() + finalQuestionText.slice(1)
                }
              }
            }
            return {
              ...q,
              question_text: finalQuestionText,
              correct_answer: correct,
              wrong_answers: wrongs,
              image_emoji,
            }
          })
          .filter((q) => {
            if (
              !q.correct_answer ||
              !q.question_text ||
              q.question_text === 'undefined' ||
              q.question_text.trim() === ''
            ) {
              console.info(
                `[PalabraBox] Question ${q.id} dropped: missing correct_answer or source question_text. Raw:`,
                q.data,
              )
              return false
            }

            if (q.type === 'listening' && isSpanishText(q.correct_answer)) {
              console.warn(`[PalabraBox] Question ${q.id} dropped: listening target is Spanish.`)
              return false
            }
            return true
          })

        // Ensure we have fallback wrong answers only if absolutely needed for UI to not crash
        const allCorrectAnswersPool = Array.from(
          new Set(allQuestions.map((q) => q.correct_answer.trim()).filter(Boolean)),
        )
        allQuestions.forEach((q) => {
          const needsWrongAnswers = ['multiple_choice', 'image_match', 'listening'].includes(q.type)
          if (needsWrongAnswers && (!q.wrong_answers || q.wrong_answers.length === 0)) {
            console.warn(`[PalabraBox] Fallback distractors injected for ${q.id}`)
            const possibleWrongs = allCorrectAnswersPool.filter(
              (ans) => ans.toLowerCase() !== q.correct_answer.toLowerCase(),
            )
            q.wrong_answers = shuffleArray([
              ...possibleWrongs,
              'option 1',
              'option 2',
              'option 3',
            ]).slice(0, 3)
          }

          if (q.type === 'word_order' && (!q.wrong_answers || q.wrong_answers.length === 0)) {
            console.warn(`[PalabraBox] Fallback word distractors injected for ${q.id}`)
            const currentQ = q as Question & { target_language?: string }
            const sameLangAnswers = allQuestions
              .filter((o) => {
                const other = o as Question & { target_language?: string }
                return (
                  typeof other.target_language === 'string' &&
                  other.target_language === currentQ.target_language
                )
              })
              .map((o) => o.correct_answer)
              .filter(Boolean)

            const allWordsInPool = sameLangAnswers.flatMap((ans) => ans.split(/\s+/))
            const uniqueWords = Array.from(new Set(allWordsInPool))
            const currentWords = q.correct_answer.split(/\s+/).map((w) => w.toLowerCase())
            const possibleDistractors = uniqueWords.filter(
              (w) => !currentWords.includes(w.toLowerCase()),
            )

            const lang = currentQ.target_language
            const defaultMocks =
              lang === 'en' || lang === 'english'
                ? ['the', 'a', 'to', 'is', 'are']
                : ['el', 'la', 'con', 'es', 'un']

            q.wrong_answers = shuffleArray([...possibleDistractors, ...defaultMocks]).slice(0, 3)
          }
        })

        // Deduplicate questions by text and answer to prevent repeats
        const uniqueQuestionsMap = new Map<string, Question>()
        allQuestions.forEach((q) => {
          const key = `${q.type}|${q.question_text}|${q.correct_answer}`
          if (!uniqueQuestionsMap.has(key)) {
            uniqueQuestionsMap.set(key, q)
          }
        })
        const deduplicatedQuestions = Array.from(uniqueQuestionsMap.values())

        // Group by type to ensure variety
        const questionsByType: Record<string, Question[]> = {}
        deduplicatedQuestions.forEach((q) => {
          if (!questionsByType[q.type]) questionsByType[q.type] = []
          questionsByType[q.type].push(q)
        })

        const selected: Question[] = []
        const usedAnswers = new Set<string>()

        // Pick one of each available type first
        Object.keys(questionsByType).forEach((type) => {
          const group = questionsByType[type]
          if (group.length > 0) {
            const rIdx = Math.floor(Math.random() * group.length)
            const picked = group.splice(rIdx, 1)[0]
            selected.push(picked)
            const pickedAnswer = normalizeAnswer(picked.correct_answer).toLowerCase()
            if (pickedAnswer) usedAnswers.add(pickedAnswer)
          }
        })

        // Fill remaining up to 10
        const remaining = shuffleArray(Object.values(questionsByType).flat())
        const nonUniqueRemaining: Question[] = []

        // Prefer questions whose answers haven't been asked yet
        while (selected.length < 10 && remaining.length > 0) {
          const picked = remaining.pop()!
          const ans = normalizeAnswer(picked.correct_answer).toLowerCase()

          if (!ans || !usedAnswers.has(ans)) {
            selected.push(picked)
            if (ans) usedAnswers.add(ans)
          } else {
            nonUniqueRemaining.push(picked)
          }
        }

        // Fill via non-unique if needed
        while (selected.length < 10 && nonUniqueRemaining.length > 0) {
          selected.push(nonUniqueRemaining.pop()!)
        }

        // Final shuffle before serving
        let finalSelected = selected.filter((q) => !sessionBlacklist.includes(q.id))
        if (finalSelected.length < 5) {
          console.info(
            '[PalabraBox] Running low on available questions, ignoring session blacklist.',
          )
          finalSelected = selected
        }
        const shuffled = shuffleArray(finalSelected)
        shuffled.forEach((q) => addToBlacklist(q.id))
        setQuestions(shuffled)

        startGame(shuffled.length) // Reset store state for new game
      } catch (err) {
        setError(err instanceof Error ? err.message : String(err))
      } finally {
        setLoading(false)
      }
    }

    fetchQuestions()

    return () => {
      ignore = true
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [scenarioId, startGame])

  const currentQuestion = questions[currentQuestionIndex]

  // Monitor game over conditions
  useEffect(() => {
    if (status !== 'playing') return

    const isLoss = lives <= 0
    const isWin = currentQuestionIndex >= questions.length && questions.length > 0 && !isLoss

    if (isWin || isLoss) {
      endGame()

      // Stars: 3 lives = 3 stars; a win always grants at least 1; a loss grants 0
      const stars = isWin ? Math.max(1, lives) : 0
      if (isWin && scenarioId) {
        saveScenarioStars(scenarioId, stars)
      }

      // Record the session result once — the results screen reads only this
      setLastResult({ scenarioId: scenarioId ?? null, score, lives, maxLives, stars })

      useProgressStore.getState().addPoints(score)

      // Small delay out of courtesy before navigating to results
      setTimeout(() => {
        navigate('/results')
      }, 500)
    }
  }, [
    status,
    currentQuestionIndex,
    lives,
    maxLives,
    questions.length,
    navigate,
    endGame,
    setLastResult,
    scenarioId,
    score,
  ])

  const handleAnswer = useCallback(
    (isCorrect: boolean) => {
      if (status !== 'playing') return

      if (currentQuestion?.correct_answer) {
        analyticsService.logAnswer(currentQuestion.correct_answer, isCorrect)
      }

      if (isCorrect) {
        answerCorrect()
      } else {
        answerWrong()
      }
    },
    [status, answerCorrect, answerWrong, currentQuestion],
  )

  const goToNext = useCallback(() => {
    nextQuestion()
  }, [nextQuestion])

  return {
    questions,
    currentQuestion,
    loading,
    error,
    handleAnswer,
    goToNext,
    lives,
    maxLives,
    score,
    currentQuestionIndex,
    scenarioLanguage,
  }
}
