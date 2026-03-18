import { useMemo } from 'react'
import { useNavigate, useParams } from 'react-router-dom'

import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { BackButton } from '../components/layout/BackButton'
import { Button } from '../components/ui/Button'
import { QuestionRenderer } from '../components/questions/QuestionRenderer'
import { useGameStore } from '../store/gameStore'
import type { Question } from '../types'

const DEMO_QUESTIONS: Question[] = [
  {
    id: 'q1',
    scenario_id: 'demo',
    type: 'multiple_choice',
    question_text: "What's the Spanish word for 'cat'?",
    question_text_tts: null,
    correct_answer: 'gato',
    wrong_answers: ['perro', 'pájaro', 'pez'],
    hint: 'It starts with G',
    image_emoji: null,
    sort_order: 1,
    created_at: new Date().toISOString(),
  },
  {
    id: 'q2',
    scenario_id: 'demo',
    type: 'multiple_choice',
    question_text: "What's the English word for 'rojo'?",
    question_text_tts: null,
    correct_answer: 'red',
    wrong_answers: ['blue', 'green', 'yellow'],
    hint: 'It is a color',
    image_emoji: null,
    sort_order: 2,
    created_at: new Date().toISOString(),
  },
]

export default function GameScreen() {
  const navigate = useNavigate()
  const { scenarioId } = useParams<{ scenarioId: string }>()

  const {
    status,
    score,
    lives,
    currentQuestionIndex,
    startGame,
    answerCorrect,
    answerWrong,
    nextQuestion,
    resetGame,
    endGame,
  } = useGameStore()

  const question = useMemo(() => {
    return DEMO_QUESTIONS[currentQuestionIndex] ?? null
  }, [currentQuestionIndex])

  const handleAnswer = (isCorrect: boolean) => {
    if (isCorrect) {
      answerCorrect()
    } else {
      answerWrong()
    }

    const nextIndex = currentQuestionIndex + 1
    const hasMore = nextIndex < DEMO_QUESTIONS.length
    if (!isCorrect && lives - 1 <= 0) {
      endGame()
      return
    }

    if (hasMore) {
      nextQuestion()
      return
    }

    endGame()
  }

  const handleStart = () => {
    startGame()
  }

  const handleRestart = () => {
    resetGame()
  }

  return (
    <PageTransition>
      <ScreenWrapper>
        <BackButton />
        <div className="flex flex-col gap-4">
          <div className="flex items-center justify-between">
            <h1 className="text-2xl font-bold">Game</h1>
            <div className="flex items-center gap-3 text-sm">
              <span className="font-bold">Score: {score}</span>
              <span className="font-bold">Lives: {lives}</span>
            </div>
          </div>

          {status === 'idle' && (
            <div className="flex flex-col gap-4">
              <p className="text-pb-text-light">Scenario ID: {scenarioId}</p>
              <Button size="lg" onClick={handleStart}>
                Start Game
              </Button>
            </div>
          )}

          {status === 'playing' && question && (
            <QuestionRenderer
              question={question}
              onAnswered={handleAnswer}
              onPlaySound={(type) => {
                /* TODO: hook sound service */
                console.debug('Play sound', type)
              }}
            />
          )}

          {status === 'finished' && (
            <div className="flex flex-col gap-4">
              <p className="text-lg font-bold">Game over!</p>
              <p className="text-pb-text-light">Final score: {score}</p>
              <div className="flex flex-wrap gap-2">
                <Button onClick={() => navigate('/menu')}>Back to Menu</Button>
                <Button variant="secondary" onClick={handleRestart}>
                  Play Again
                </Button>
              </div>
            </div>
          )}
        </div>
      </ScreenWrapper>
    </PageTransition>
  )
}
