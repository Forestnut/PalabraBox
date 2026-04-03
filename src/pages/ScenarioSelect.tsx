import { useNavigate } from 'react-router-dom'
import { motion } from 'framer-motion'
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
    startGame()
    navigate(`/game/${scenario.id}`)
  }

  const unlockedCount = scenarios.filter(s => !s.isLocked).length
  const totalCount = scenarios.length

  return (
    <PageTransition className="bg-pb-bg">
      <ScreenWrapper className="flex flex-col py-6 pb-12">
        <div className="flex items-center gap-4 mb-6">
          <BackButton fallbackUrl="/level" />
          <h1 className="text-2xl font-black text-pb-dark tracking-tight">Niveles</h1>
        </div>

        {!loading && !error && (
          <div className="w-full flex justify-between items-end mb-4 px-1">
            <p className="font-bold text-pb-text-light text-xs uppercase tracking-widest">Elige una aventura</p>
            <div className="bg-white/70 backdrop-blur-sm px-3 py-1 rounded-full shadow-soft ring-1 ring-black/4 font-bold text-pb-amber text-sm flex items-center gap-1">
              <span>{unlockedCount}</span> / <span>{totalCount}</span>
            </div>
          </div>
        )}
        
        {loading && (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-3 sm:gap-4 mt-2 w-full">
            {[...Array(6)].map((_, i) => (
              <div key={i} className="animate-pulse flex flex-col items-center p-4 rounded-2xl bg-white/50 backdrop-blur-sm">
                <div className="w-14 h-14 bg-black/4 rounded-full mb-3" />
                <div className="h-3.5 bg-black/4 rounded-md w-3/4 mb-2" />
                <div className="h-2.5 bg-black/4 rounded-md w-1/2" />
              </div>
            ))}
          </div>
        )}
        
        {error && (
          <div className="bg-pb-error/10 text-pb-error p-4 rounded-2xl mb-4 font-bold ring-1 ring-pb-error/20 text-center text-sm">
            Error al cargar: {error}
          </div>
        )}

        {!loading && !error && (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-3 sm:gap-4 mt-2 w-full">
            {scenarios.map((scenario, index) => (
              <motion.div
                key={scenario.id}
                className="flex"
                initial={{ opacity: 0, y: 12 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: index * 0.04, duration: 0.3, ease: 'easeOut' }}
              >
                <ScenarioCard
                  scenario={scenario}
                  onClick={handleScenarioClick}
                />
              </motion.div>
            ))}
          </div>
        )}
      </ScreenWrapper>
    </PageTransition>
  )
}
