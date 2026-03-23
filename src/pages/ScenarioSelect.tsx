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
        
        {loading && (
          <div className="grid grid-cols-2 gap-4 sm:gap-5 mt-2">
            {[...Array(6)].map((_, i) => (
              <div key={i} className="animate-pulse flex flex-col items-center p-4 rounded-3xl bg-white shadow-sm border-b-4 border-gray-200">
                <div className="w-16 h-16 bg-gray-200 rounded-full mb-3"></div>
                <div className="h-4 bg-gray-200 rounded-md w-3/4 mb-2"></div>
                <div className="h-3 bg-gray-200 rounded-md w-1/2"></div>
                <div className="w-full mt-4 flex justify-between px-2">
                  <div className="w-5 h-5 bg-gray-200 rounded-full"></div>
                  <div className="w-5 h-5 bg-gray-200 rounded-full"></div>
                </div>
              </div>
            ))}
          </div>
        )}
        
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
