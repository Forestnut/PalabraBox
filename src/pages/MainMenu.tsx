import { useMemo } from 'react'
import { useNavigate } from 'react-router-dom'
import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { Mascot } from '../components/ui/Mascot'
import { useQuickProgress } from '../hooks/useQuickProgress'
import { useScenarios } from '../hooks/useScenarios'

export default function MainMenu() {
  const navigate = useNavigate()
  const { progress } = useQuickProgress()
  const { scenarios, loading } = useScenarios()

  const { completed, total, percentage } = useMemo(() => {
    if (!scenarios || scenarios.length === 0) {
      return { completed: 0, total: 0, percentage: 0 }
    }
    const comp = scenarios.filter(s => s.stars > 0).length
    const tot = scenarios.length
    return {
      completed: comp,
      total: tot,
      percentage: Math.round((comp / tot) * 100)
    }
  }, [scenarios])

  const progressText = loading ? '...' : `${completed} / ${total}`

  return (
    <PageTransition className="bg-pb-bg text-pb-dark relative">
      <ScreenWrapper className="flex flex-col items-center gap-6 pt-12">
        <button
          onClick={() => navigate('/settings')}
          className="absolute top-6 right-6 text-2xl bg-white w-12 h-12 flex items-center justify-center rounded-full shadow-box hover:scale-105 hover:text-pb-amber active:scale-95 transition-all text-pb-text-light z-10"
          aria-label="Configuración"
        >
          ⚙️
        </button>

        <div className="flex flex-col items-center gap-6 mt-8 mb-4">
          <div className="relative w-48 h-48 flex items-end justify-center pb-4">
            <div className="absolute inset-x-8 bottom-0 h-16 bg-pb-amber/30 blur-2xl rounded-[100%]"></div>
            <div className="absolute inset-0 bg-linear-to-t from-pb-amber/20 to-transparent rounded-full blur-xl opacity-60"></div>
            <Mascot mood="happy" size="xl" className="drop-shadow-2xl relative z-10" />
          </div>
          <h1 className="text-4xl sm:text-5xl font-extrabold pb-title drop-shadow-sm text-pb-dark">PalabraBox</h1>
        </div>

        <div className="w-full flex flex-col gap-4">
          <Button size="lg" onClick={() => navigate('/language')}>
            <span className="text-2xl">▶</span>
            JUGAR
          </Button>
          <Button variant="secondary" size="lg" onClick={() => navigate('/cards')}>
            <span className="text-2xl">🃏</span>
            TARJETAS
          </Button>
        </div>

        <Card className="w-full">
          <div className="flex items-center justify-between">
            <h2 className="text-lg font-bold text-pb-dark">Progreso rápido</h2>
            <div className="flex items-center gap-1 bg-pb-amber/20 px-3 py-1 rounded-full">
              <span className="text-lg">🔥</span>
              <span className="font-bold text-pb-amber text-sm">{progress.streakDays} días</span>
            </div>
          </div>

          <div className="grid grid-cols-2 gap-4 mt-4">
            <div className="flex flex-col">
              <span className="text-xs font-bold text-pb-text-light uppercase tracking-wider">
                Completado
              </span>
              <span className="text-xl font-black text-pb-dark">{progressText}</span>
              <div className="w-full h-2 bg-pb-bg rounded-full mt-2">
                <div
                  className="h-full bg-pb-amber rounded-full"
                  style={{ width: `${percentage}%` }}
                />
              </div>
            </div>
            <div className="flex flex-col items-end">
              <span className="text-xs font-bold text-pb-text-light uppercase tracking-wider text-right">
                Puntos
              </span>
              <div className="flex items-center gap-1">
                <span className="text-2xl text-pb-primary">⚡</span>
                <span className="text-xl font-black text-pb-dark">{progress.points}</span>
              </div>
            </div>
          </div>
        </Card>
      </ScreenWrapper>
    </PageTransition>
  )
}
