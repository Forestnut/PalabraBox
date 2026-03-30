import { useMemo } from 'react'
import { useNavigate } from 'react-router-dom'
import { motion } from 'framer-motion'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faPlay, faLayerGroup, faGear, faFire, faBolt } from '@fortawesome/free-solid-svg-icons'
import { PageTransition } from '../components/layout/PageTransition'
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
    <PageTransition className="bg-pb-bg text-pb-dark relative overflow-y-auto h-dvh">
      <div
        className="max-w-lg mx-auto sm:px-6 px-5 w-full flex flex-col items-center gap-5 pt-10 no-scrollbar pb-[max(1.5rem,env(safe-area-inset-bottom))]"
        style={{ minHeight: '100%' }}
      >

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

        {/* Arrabal Sponsor Badge */}
        <a
          href="https://www.asociacionarrabal.org"
          target="_blank"
          rel="noopener noreferrer"
          className="flex flex-col items-center gap-1.5 mt-1 opacity-75 hover:opacity-100 transition-opacity duration-200"
          aria-label="Asociación Arrabal"
        >
          <span className="text-[10px] font-bold text-pb-text-light uppercase tracking-widest">
            Con el apoyo de
          </span>
          <img
            src="/ArrabalLogo.png"
            alt="Asociación Arrabal"
            className="h-9 sm:h-10 w-auto object-contain"
            loading="lazy"
          />
        </a>

        {/* Progress Card */}
        <Card className="w-full mt-1 border-2 border-b-4 border-slate-200/60 bg-white p-5">
          <div className="flex items-center justify-between mb-4">
            <h2 className="text-base sm:text-lg font-black text-pb-dark tracking-wide">Progreso rápido</h2>
            <div className="flex items-center gap-1.5 bg-amber-50 px-3 py-1 rounded-full ring-1 ring-amber-200">
              <FontAwesomeIcon icon={faFire} className="text-pb-amber text-sm" />
              <span className="font-bold text-pb-amber text-sm">{progress.streakDays} días</span>
            </div>
          </div>

          <div className="grid grid-cols-2 gap-3 mt-2">
            <div className="flex flex-col items-center justify-center p-3 bg-indigo-50 border-2 border-b-4 border-indigo-200 rounded-2xl">
              <span className="text-[10px] sm:text-xs font-black text-indigo-600/60 uppercase tracking-widest text-center mb-1">
                Completado
              </span>
              <span className="text-xl sm:text-2xl font-black text-indigo-500 drop-shadow-sm">{progressText}</span>
              <div className="w-full h-2.5 bg-indigo-200/50 rounded-full mt-3 overflow-hidden">
                <motion.div
                  className="h-full bg-linear-to-r from-indigo-400 to-indigo-500 rounded-full"
                  initial={{ width: 0 }}
                  animate={{ width: `${percentage}%` }}
                  transition={{ duration: 0.8, ease: 'easeOut', delay: 0.3 }}
                />
              </div>
            </div>
            <div className="flex flex-col items-center justify-center p-3 bg-amber-50 border-2 border-b-4 border-amber-200 rounded-2xl">
              <span className="text-[10px] sm:text-xs font-black text-amber-600/60 uppercase tracking-widest text-center mb-1">
                Puntos
              </span>
              <div className="flex items-center gap-1.5 mt-0.5">
                <FontAwesomeIcon icon={faBolt} className="text-amber-500 text-lg sm:text-xl drop-shadow-sm" />
                <span className="text-xl sm:text-2xl font-black text-amber-500 drop-shadow-sm">{progress.points}</span>
              </div>
            </div>
          </div>
        </Card>
      </div>
    </PageTransition>
  )
}
