import { useMemo } from 'react'
import { useNavigate } from 'react-router-dom'
import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { useQuickProgress } from '../hooks/useQuickProgress'

export default function MainMenu() {
  const navigate = useNavigate()
  const { progress, percentage } = useQuickProgress()

  const progressText = useMemo(
    () => `${progress.completed} / ${progress.total}`,
    [progress.completed, progress.total],
  )

  return (
    <PageTransition className="bg-pb-bg text-pb-dark">
      <ScreenWrapper className="flex flex-col items-center gap-6">
        <div className="flex flex-col items-center gap-4">
          <div className="w-36 h-36 rounded-xl bg-pb-amber/20 shadow-box flex items-center justify-center">
            <img src="/BoxLogo.svg" alt="PalabraBox Logo" className="w-24 h-24 object-contain drop-shadow-md" />
          </div>
          <h1 className="text-4xl font-extrabold">PalabraBox</h1>
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
                <span className="text-2xl">⭐</span>
                <span className="text-xl font-black text-pb-dark">{progress.points}</span>
              </div>
            </div>
          </div>
        </Card>
      </ScreenWrapper>
    </PageTransition>
  )
}
