import { useNavigate } from 'react-router-dom'
import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { BackButton } from '../components/layout/BackButton'
import { useScenarios } from '../hooks/useScenarios'
import type { ScenarioWithProgress } from '../hooks/useScenarios'
import { ScenarioCard } from '../components/ScenarioCard'
import { useGameStore } from '../store/gameStore'

export default function ScenarioSelect() {
  const { scenarios, loading, error } = useScenarios()
  const navigate = useNavigate()
  const startGame = useGameStore(state => state.startGame)

  const handleScenarioClick = (scenario: ScenarioWithProgress) => {
    // Reset/Start game store for this scenario
    startGame()
    navigate(`/game/${scenario.id}`)
  }

  const unlockedCount = scenarios.filter(s => !s.isLocked).length
  const totalCount = scenarios.length

  return (
    <PageTransition className="bg-pb-bg">
      <ScreenWrapper className="flex flex-col py-6 pb-12">
        <div className="flex items-center gap-4 mb-8">
          <BackButton fallbackUrl="/level" />
          <h1 className="text-3xl font-black text-pb-dark tracking-wide uppercase">Niveles</h1>
        </div>

        {!loading && !error && (
          <div className="w-full flex justify-between items-end mb-4 px-1">
            <p className="font-bold text-pb-text-light text-sm uppercase tracking-widest">Elige una aventura</p>
            <div className="bg-white px-3 py-1 rounded-full shadow-sm font-bold text-pb-amber text-sm flex items-center gap-1">
              <span>{unlockedCount}</span> / <span>{totalCount}</span>
            </div>
          </div>
        )}
        
        {loading && <p className="text-pb-text-light text-center py-8 font-bold">Cargando niveles...</p>}
        
        {error && (
          <div className="bg-pb-error/10 text-pb-error p-4 rounded-box mb-4 font-bold border-2 border-pb-error text-center">
            Error al cargar: {error}
          </div>
        )}

        {!loading && !error && (
          <div className="grid grid-cols-2 gap-4 sm:gap-5 mt-2">
            {scenarios.map((scenario) => (
              <ScenarioCard
                key={scenario.id}
                scenario={scenario}
                onClick={handleScenarioClick}
              />
            ))}
          </div>
        )}
      </ScreenWrapper>
    </PageTransition>
  )
}
