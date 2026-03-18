import { useParams } from 'react-router-dom'

import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { BackButton } from '../components/layout/BackButton'
import { useGame } from '../hooks/useGame'
import { useGameStore } from '../store/gameStore'
import { QuestionRenderer } from '../components/questions/QuestionRenderer'

export default function GameScreen() {
  const { scenarioId } = useParams<{ scenarioId: string }>()
  const {
    currentQuestion,
    currentQuestionIndex,
    questions,
    loading,
    error,
    handleAnswer,
    goToNext,
    lives,
    maxLives,
    score,
  } = useGame(scenarioId)
  const { status } = useGameStore()

  if (loading) {
    return (
      <ScreenWrapper>
        <p className="text-center py-8 font-bold text-pb-text-light">Cargando partida...</p>
      </ScreenWrapper>
    )
  }

  if (error) {
    return (
      <ScreenWrapper>
        <BackButton />
        <p className="text-center text-pb-error py-8 font-bold">Error: {error}</p>
      </ScreenWrapper>
    )
  }

  if (status === 'finished') {
    return (
      <ScreenWrapper>
        <p className="text-center py-8 font-bold text-pb-text-light text-xl">
          ¡Juego Terminado! Preparando resultados...
        </p>
      </ScreenWrapper>
    )
  }

  if (!currentQuestion) {
    return (
      <ScreenWrapper>
        <BackButton />
        <p className="text-center py-8 font-bold text-pb-text-light">No se encontraron preguntas.</p>
      </ScreenWrapper>
    )
  }

  return (
    <PageTransition>
      <ScreenWrapper>
        <div className="flex items-center justify-between mb-6">
          <BackButton />
          <div className="flex items-center gap-4 font-bold text-xl">
            <span className="text-pb-amber drop-shadow-sm">🏆 {score}</span>
            <span className="text-pb-error drop-shadow-sm tracking-widest">
              {Array.from({ length: maxLives || 3 }).map((_, i) => (
                <span key={i} className={i < lives ? 'opacity-100' : 'opacity-30'}>
                  ❤️
                </span>
              ))}
            </span>
          </div>
        </div>

        <div className="w-full bg-pb-amber/20 h-4 rounded-full mb-8 shadow-inner overflow-hidden border-2 border-pb-amber/30">
          <div
            className="bg-pb-amber h-full rounded-full transition-all duration-500 ease-out relative"
            style={{ width: `${(currentQuestionIndex / questions.length) * 100}%` }}
          >
            <div className="absolute inset-0 bg-white/20 w-full h-1/2 rounded-t-full"></div>
          </div>
        </div>

        <QuestionRenderer
          key={currentQuestion.id}
          question={currentQuestion}
          onAnswered={(isCorrect) => {
            handleAnswer(isCorrect)
            goToNext()
          }}
        />
      </ScreenWrapper>
    </PageTransition>
  )
}
