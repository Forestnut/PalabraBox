import { useEffect, useState, useCallback } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabase'
import type { Question } from '../types'
import { useGameStore } from '../store/gameStore'
import { saveScenarioStars } from '../utils/progress'
import { progressService } from '../services/progressService'
import { analyticsService } from '../services/analyticsService'

import { shuffleArray } from '../utils/shuffle'

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
    status,
    currentQuestionIndex,
    lives,
    maxLives,
    score
  } = useGameStore()

  useEffect(() => {
    let ignore = false;
    if (!scenarioId) return

    async function fetchQuestions() {
      try {
        setLoading(true)
        const { data, error: err } = await supabase
          .from('questions')
          .select('*')
          .eq('scenario_id', scenarioId)

        const { data: scenarioData, error: scenarioError } = await supabase
          .from('scenarios')
          .select('language')
          .eq('id', scenarioId)
          .single()

        if (err) throw err
        if (scenarioError) throw scenarioError

        if (ignore) return;

        setScenarioLanguage(scenarioData.language)

        const allQuestions = data as Question[]
        
        // Group by type to ensure variety
        const questionsByType: Record<string, Question[]> = {}
        allQuestions.forEach(q => {
          if (!questionsByType[q.type]) questionsByType[q.type] = []
          questionsByType[q.type].push(q)
        })

        const selected: Question[] = []
        const usedAnswers = new Set<string>()
        
        // Pick one of each type first to ensure variety
        Object.keys(questionsByType).forEach(type => {
          const group = questionsByType[type]
          if (group.length > 0) {
            const rIdx = Math.floor(Math.random() * group.length)
            const picked = group.splice(rIdx, 1)[0]
            selected.push(picked)
            if (picked.correct_answer) usedAnswers.add(picked.correct_answer.toLowerCase())
          }
        })

        // Fill remaining up to 10 with other random questions
        // Prioritize questions with unique correct answers to avoid repeating words
        const remaining = shuffleArray(Object.values(questionsByType).flat())
        const nonUniqueRemaining: Question[] = []
        
        // First pass: dynamically check if the question's answer is already used
        while (selected.length < 10 && remaining.length > 0) {
          const picked = remaining.pop()!
          const ans = picked.correct_answer?.toLowerCase() || ''
          
          if (!ans || !usedAnswers.has(ans)) {
            selected.push(picked)
            if (ans) usedAnswers.add(ans)
          } else {
            nonUniqueRemaining.push(picked)
          }
        }

        // If we still need more to reach 10, fallback to reusing words
        while (selected.length < 10 && nonUniqueRemaining.length > 0) {
          selected.push(nonUniqueRemaining.pop()!)
        }
        
        // Final shuffle before serving
        const shuffled = shuffleArray(selected)
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
      ignore = true;
    }
  }, [scenarioId, startGame])

  const currentQuestion = questions[currentQuestionIndex]

  // Monitor game over conditions
  useEffect(() => {
    if (status !== 'playing') return

    const isLoss = lives <= 0
    const isWin = currentQuestionIndex >= questions.length && questions.length > 0 && !isLoss

    if (isWin || isLoss) {
      endGame()
      
      // Calculate stars if won (3 lives = 3 stars, less lives = less stars)
      if (isWin && scenarioId) {
        const stars = Math.max(1, lives)
        saveScenarioStars(scenarioId, stars)
        progressService.markScenarioCompleted()
      }

      progressService.addPoints(score)

      // Small delay out of courtesy before navigating to results
      setTimeout(() => {
        navigate('/results')
      }, 500)
    }
  }, [status, currentQuestionIndex, lives, questions.length, navigate, endGame, scenarioId, score])

  const handleAnswer = useCallback((isCorrect: boolean) => {
    if (status !== 'playing') return

    if (currentQuestion?.correct_answer) {
      analyticsService.logAnswer(currentQuestion.correct_answer, isCorrect)
    }

    if (isCorrect) {
       answerCorrect()
    } else {
       answerWrong()
    }
  }, [status, answerCorrect, answerWrong, currentQuestion])

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
    scenarioLanguage
  }
}
