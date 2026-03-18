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

  return (
    <PageTransition>
      <ScreenWrapper>
        <BackButton />
        <h1 className="text-2xl font-bold mt-4 mb-2 text-pb-dark">Elige un escenario</h1>
        
        {loading && <p className="text-pb-text-light text-center py-8">Cargando...</p>}
        
        {error && (
          <div className="bg-pb-error/10 text-pb-error p-4 rounded-box mb-4">
            Error al cargar: {error}
          </div>
        )}

        {!loading && !error && (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mt-6">
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
