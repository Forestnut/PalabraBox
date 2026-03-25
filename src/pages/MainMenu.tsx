import { useMemo } from 'react'
import { useNavigate } from 'react-router-dom'
import { motion } from 'framer-motion'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faPlay, faLayerGroup, faGear, faFire, faBolt } from '@fortawesome/free-solid-svg-icons'
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
      <ScreenWrapper className="flex flex-col items-center gap-5 pt-10">

        {/* Settings button */}
        <motion.button
          onClick={() => navigate('/settings')}
          className="absolute top-5 right-5 w-11 h-11 flex items-center justify-center rounded-full bg-white/60 backdrop-blur-lg shadow-soft ring-1 ring-black/4 text-pb-text-light z-10 cursor-pointer"
          whileHover={{ scale: 1.08, rotate: 45 }}
          whileTap={{ scale: 0.92 }}
          transition={{ type: 'spring', stiffness: 400, damping: 17 }}
          aria-label="Configuración"
        >
          <FontAwesomeIcon icon={faGear} className="text-base" />
        </motion.button>

        {/* Hero: Mascot + Title */}
        <div className="flex flex-col items-center gap-4 mt-6 mb-2">
          <div className="relative w-40 h-40 flex items-end justify-center pb-2">
            <Mascot mood="happy" size="xl" className="relative z-10" />
          </div>
          <div className="text-center">
            <h1 className="text-4xl sm:text-5xl font-black tracking-tight text-pb-dark">
              Palabra<span className="text-pb-amber">Box</span>
            </h1>
            <p className="text-sm text-pb-text-light font-semibold mt-1.5 tracking-wide">
              Aprende idiomas jugando
            </p>
          </div>
        </div>

        {/* Action Buttons */}
        <div className="w-full flex flex-col gap-3">
          <Button size="lg" onClick={() => navigate('/language')}>
            <FontAwesomeIcon icon={faPlay} className="text-base" />
            JUGAR
          </Button>
          <Button variant="secondary" size="lg" onClick={() => navigate('/cards')}>
            <FontAwesomeIcon icon={faLayerGroup} className="text-base" />
            TARJETAS
          </Button>
        </div>

        {/* Progress Card */}
        <Card className="w-full mt-1">
          <div className="flex items-center justify-between">
            <h2 className="text-base font-bold text-pb-dark">Progreso rápido</h2>
            <div className="flex items-center gap-1.5 bg-linear-to-r from-amber-50 to-orange-50 px-3 py-1 rounded-full ring-1 ring-pb-amber/20">
              <FontAwesomeIcon icon={faFire} className="text-pb-amber text-sm" />
              <span className="font-bold text-pb-amber text-sm">{progress.streakDays} días</span>
            </div>
          </div>

          <div className="grid grid-cols-2 gap-4 mt-4">
            <div className="flex flex-col">
              <span className="text-[11px] font-bold text-pb-text-light uppercase tracking-wider">
                Completado
              </span>
              <span className="text-xl font-black text-pb-dark">{progressText}</span>
              <div className="w-full h-2 bg-pb-bg rounded-full mt-2 overflow-hidden">
                <motion.div
                  className="h-full bg-linear-to-r from-pb-amber to-[#FFD166] rounded-full"
                  initial={{ width: 0 }}
                  animate={{ width: `${percentage}%` }}
                  transition={{ duration: 0.8, ease: 'easeOut', delay: 0.3 }}
                />
              </div>
            </div>
            <div className="flex flex-col items-end">
              <span className="text-[11px] font-bold text-pb-text-light uppercase tracking-wider text-right">
                Puntos
              </span>
              <div className="flex items-center gap-1.5 mt-0.5">
                <FontAwesomeIcon icon={faBolt} className="text-pb-amber text-lg" />
                <span className="text-xl font-black text-pb-dark">{progress.points}</span>
              </div>
            </div>
          </div>
        </Card>
      </ScreenWrapper>
    </PageTransition>
  )
}
