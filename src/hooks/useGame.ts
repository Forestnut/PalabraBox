import { useEffect, useState, useCallback } from 'react'
import { useNavigate } from 'react-router-dom'
import { isSupabaseConfigured, supabase, SUPABASE_CONFIG_ERROR } from '../lib/supabase'
import type { Question } from '../types'
import { useGameStore } from '../store/gameStore'
import { saveScenarioStars } from '../utils/progress'
import { useProgressStore } from '../store/progressStore'
import { analyticsService } from '../services/analyticsService'
import { mapQuestionRow, selectQuestions } from '../utils/question'
import { shuffleArray } from '../utils/shuffle'

/** Questions served per game session. */
const QUESTIONS_PER_GAME = 10
/** TTS language for question audio — the learning target (English). */
const TARGET_LANGUAGE = 'en'

/**
 * Loads a scenario's questions and drives a game session.
 *
 * Questions arrive already normalized (content migration E5): the prompt is
 * the Spanish question_text, the answer lives in data.correct, distractors in
 * data.options / data.words. All row→UI mapping and session selection is pure
 * logic in src/utils/question.ts — no runtime rescue heuristics here.
 */
export function useGame(scenarioId: string | undefined) {
  const [questions, setQuestions] = useState<Question[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

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
    const id = scenarioId

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
          .eq('scenario_id', id)
          .order('sort_order', { ascending: true })

        if (err) throw err
        if (ignore) return

        const mapped = (data ?? []).map(mapQuestionRow).filter((q): q is Question => q !== null)

        const selected = selectQuestions(mapped, QUESTIONS_PER_GAME, sessionBlacklist, shuffleArray)
        selected.forEach((q) => addToBlacklist(q.id))

        setQuestions(selected)
        startGame(selected.length) // Reset store state for new game
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
    scenarioLanguage: TARGET_LANGUAGE,
  }
}
