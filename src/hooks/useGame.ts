import { useEffect, useState, useCallback } from 'react'
import { useNavigate } from 'react-router-dom'
import { supabase } from '../lib/supabase'
import type { Question } from '../types'
import { useGameStore } from '../store/gameStore'
import { saveScenarioStars } from '../utils/progress'
import { useProgressStore } from '../store/progressStore'
import { analyticsService } from '../services/analyticsService'

import { shuffleArray } from '../utils/shuffle'

function normalizeAnswer(value: unknown): string {
  if (typeof value === 'string') return value
  if (typeof value === 'number' || typeof value === 'boolean') return String(value)
  return ''
}

function normalizeWrongAnswers(value: unknown, correct: string): string[] {
  if (!Array.isArray(value)) return []

  const normalizedCorrect = correct.trim().toLowerCase()
  return value
    .map(normalizeAnswer)
    .map(answer => answer.trim())
    .filter(answer => answer.length > 0)
    .filter(answer => answer.toLowerCase() !== normalizedCorrect)
}

function toRecord(value: unknown): Record<string, unknown> {
  if (!value) return {}
  if (typeof value === 'string') {
    try {
      const parsed = JSON.parse(value)
      return typeof parsed === 'object' && parsed !== null ? (parsed as Record<string, unknown>) : {}
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

        const allQuestions = (data as Array<Question & { data?: unknown }>).map(q => {
          // Fallback legacy structure compatibility with new `data` jsonb
          const qData = toRecord(q.data);
          let correct = normalizeAnswer(qData.correct ?? q.correct_answer).trim();
          let wrongs = normalizeWrongAnswers(q.wrong_answers, correct);
          const imageEmojiCandidate = normalizeAnswer(qData.image_emoji ?? q.image_emoji).trim();
          const image_emoji = imageEmojiCandidate.length > 0 ? imageEmojiCandidate : null;
          if (qData.options && Array.isArray(qData.options)) {
            wrongs = normalizeWrongAnswers(qData.options, correct);
          }

          // Convert words with translation structures if present
          if (!correct) {
            correct = normalizeAnswer(qData.translation_es ?? qData.translation_en).trim();
          }

          return {
            ...q,
            correct_answer: correct,
            wrong_answers: wrongs,
            image_emoji,
          };
        });

        // Second pass: fill empty wrong_answers dynamically just in case database is missing them
        const allCorrectAnswersPool = Array.from(
          new Set(allQuestions.map(q => normalizeAnswer(q.correct_answer).trim()).filter(Boolean))
        );
        allQuestions.forEach(q => {
          const needsWrongAnswers = ['multiple_choice', 'image_match', 'listening'].includes(q.type);
          if (needsWrongAnswers && (!q.wrong_answers || q.wrong_answers.length === 0)) {
            const possibleWrongs = allCorrectAnswersPool.filter(ans => ans !== q.correct_answer);
            q.wrong_answers = shuffleArray([...possibleWrongs, 'option 1', 'option 2', 'option 3']).slice(0, 3);
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
            const pickedAnswer = normalizeAnswer(picked.correct_answer).toLowerCase()
            if (pickedAnswer) usedAnswers.add(pickedAnswer)
          }
        })

        // Fill remaining up to 10 with other random questions
        // Prioritize questions with unique correct answers to avoid repeating words
        const remaining = shuffleArray(Object.values(questionsByType).flat())
        const nonUniqueRemaining: Question[] = []
        
        // First pass: dynamically check if the question's answer is already used
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

