import { useEffect, useState, useCallback } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabase'
import type { Question } from '../types'
import { useGameStore } from '../store/gameStore'
import { saveScenarioStars } from '../utils/progress'

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
    status,
    currentQuestionIndex,
    lives,
    maxLives,
    score
  } = useGameStore()

  useEffect(() => {
    if (!scenarioId) return

    async function fetchQuestions() {
      try {
        setLoading(true)
        const { data, error: err } = await supabase
          .from('questions')
          .select('*')
          .eq('scenario_id', scenarioId)
          .limit(10)

        if (err) throw err

        // Shuffle questions
        const shuffled = [...(data as Question[])].sort(() => Math.random() - 0.5)
        setQuestions(shuffled)
        
        startGame() // Reset store state for new game
      } catch (err) {
        setError(err instanceof Error ? err.message : String(err))
      } finally {
        setLoading(false)
      }
    }

    fetchQuestions()
  }, [scenarioId, startGame])

  const currentQuestion = questions[currentQuestionIndex]

  // Monitor game over conditions
  useEffect(() => {
    if (status !== 'playing') return

    const isWin = currentQuestionIndex >= questions.length && questions.length > 0
    const isLoss = lives <= 0

    if (isWin || isLoss) {
      endGame()
      
      // Calculate stars if won (3 lives = 3 stars, less lives = less stars)
      if (isWin && scenarioId) {
        const stars = Math.max(1, lives)
        saveScenarioStars(scenarioId, stars)
      }

      // Small delay out of courtesy before navigating to results
      setTimeout(() => {
        navigate('/results')
      }, 500)
    }
  }, [status, currentQuestionIndex, lives, questions.length, navigate, endGame, scenarioId])

  const handleAnswer = useCallback((isCorrect: boolean) => {
    if (status !== 'playing') return

    if (isCorrect) {
       answerCorrect()
    } else {
       answerWrong()
    }
  }, [status, answerCorrect, answerWrong])

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
    score
  }
}
