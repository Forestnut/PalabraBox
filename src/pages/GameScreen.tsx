import { useParams } from 'react-router-dom'
import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { BackButton } from '../components/layout/BackButton'
import { useGame } from '../hooks/useGame'
import { useGameStore } from '../store/gameStore'

export default function GameScreen() {
  const { scenarioId } = useParams<{ scenarioId: string }>()
  const { currentQuestion, loading, error, handleAnswer, goToNext, lives, maxLives, score } = useGame(scenarioId)
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
                <span key={i} className={i < lives ? 'opacity-100' : 'opacity-30'}>❤️</span>
              ))}
            </span>
          </div>
        </div>
        
        <h2 className="text-3xl font-bold mb-10 text-center text-pb-dark">
          {currentQuestion.question_text}
        </h2>
        
        {/* Placeholder for Task 10 Question Renderer */}
        <div className="p-8 bg-white rounded-box shadow-box hover:shadow-box-hover transition-shadow text-center">
          <p className="mb-6 text-pb-text-light font-bold uppercase tracking-wider text-sm">Componente de Pregunta (Plantilla)</p>
          <div className="flex justify-center gap-4">
            <button 
              className="px-6 py-3 bg-pb-success text-white rounded-box font-bold shadow-box hover:shadow-box-hover active:shadow-box-pressed transition-all active:translate-y-0.5 hover:-translate-y-0.5 cursor-pointer"
              onClick={() => {
                handleAnswer(true)
                goToNext()
              }}
            >
              Simular Acierto
            </button>
            <button 
              className="px-6 py-3 bg-pb-error text-white rounded-box font-bold shadow-box hover:shadow-box-hover active:shadow-box-pressed transition-all active:translate-y-0.5 hover:-translate-y-0.5 cursor-pointer"
              onClick={() => {
                handleAnswer(false)
                goToNext()
              }}
            >
              Simular Error
            </button>
          </div>
        </div>
      </ScreenWrapper>
    </PageTransition>
  )
}
