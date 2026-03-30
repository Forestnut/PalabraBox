import { useEffect, useState, useCallback } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabase'
import type { Question } from '../types'
import { useGameStore } from '../store/gameStore'
import { saveScenarioStars } from '../utils/progress'
import { useProgressStore } from '../store/progressStore'
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

        const { error: scenarioError } = await supabase
          .from('scenarios')
          .select('id') // Just checking existence safely, ignoring language column
          .eq('id', scenarioId)
          .single()

        if (err) throw err
        
        if (scenarioError) {
          console.warn("Scenario not found or error:", scenarioError);
        }

        if (ignore) return;

        // Fallback to a default if language isn't explicitly resolved by schema anymore
        setScenarioLanguage('english')

        const allQuestions = (data as Question[]).map(q => {
          // Fallback legacy structure compatibility with new `data` jsonb
          const qData = (q as any).data || {};
          let correct = qData.correct || q.correct_answer || '';
          let wrongs = q.wrong_answers || [];
          let image_emoji = qData.image_emoji || q.image_emoji || null;

          if (qData.options && Array.isArray(qData.options)) {
            wrongs = qData.options.filter((o: string) => o !== correct);
          }

          // Convert words with translation structures if present
          if (!correct && qData.translation_es) correct = qData.translation_es;

          return {
            ...q,
            correct_answer: correct,
            wrong_answers: wrongs,
            image_emoji,
          };
        });

        // Second pass: fill empty wrong_answers dynamically just in case database is missing them
        const allCorrectAnswersPool = Array.from(new Set(allQuestions.map(q => q.correct_answer).filter(Boolean)));
        allQuestions.forEach(q => {
          if (!q.wrong_answers || q.wrong_answers.length === 0) {
            const possibleWrongs = allCorrectAnswersPool.filter(ans => ans !== q.correct_answer);
            q.wrong_answers = shuffleArray([...possibleWrongs, 'opción 1', 'opción 2', 'opción 3']).slice(0, 3);
          }
        });
        
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
        // Let useScenarios accurately recount the actual database completion state next screen
      }

      useProgressStore.getState().addPoints(score)

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

