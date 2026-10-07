import { useNavigate } from 'react-router-dom'
import { motion } from 'motion/react'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import {
  faPlay,
  faLayerGroup,
  faGear,
  faFire,
  faStar,
  faTrophy,
  faBolt,
} from '@fortawesome/free-solid-svg-icons'
import { PageTransition } from '../components/layout/PageTransition'
import { Button } from '../components/ui/Button'
import { Mascot } from '../components/ui/Mascot'
import { useQuickProgress } from '../hooks/useQuickProgress'

export default function MainMenu() {
  const navigate = useNavigate()
  const { progress, ownedStars, possibleStars, level, levelProgressPercentage } = useQuickProgress()

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

        {/* Progress Dashboard */}
        <div className="w-full mt-2 bg-linear-to-b from-white to-slate-50 rounded-2xl shadow-sm ring-1 ring-slate-200/60 p-4 pb-5 flex flex-col gap-3">
          <div className="flex items-center justify-between px-1">
            <h2 className="text-lg font-black text-pb-dark tracking-tight">Tu Progreso</h2>
          </div>

          <div className="grid grid-cols-2 gap-3">
            {/* Streak */}
            <div className="bg-amber-50 rounded-2xl p-3 border-2 border-b-4 border-amber-200/50 flex flex-col items-center justify-center relative overflow-hidden group transition-transform active:scale-95">
              <div className="absolute -right-2 -top-2 text-amber-500/10 group-hover:scale-110 transition-transform">
                <FontAwesomeIcon icon={faFire} className="text-5xl" />
              </div>
              <div className="flex items-center gap-1.5 mb-0.5">
                <FontAwesomeIcon
                  icon={faFire}
                  className="text-pb-amber text-xl drop-shadow-sm relative z-10"
                />
                <span className="font-bold text-pb-amber text-sm relative z-10">Racha</span>
              </div>
              <span className="font-black text-pb-dark text-xl relative z-10">
                {progress.streakDays}{' '}
                <span className="text-xs font-bold text-pb-text-light/70 uppercase tracking-widest">
                  {progress.streakDays === 1 ? 'día' : 'días'}
                </span>
              </span>
            </div>

            {/* Stars */}
            <div className="bg-indigo-50 rounded-2xl p-3 border-2 border-b-4 border-indigo-200/50 flex flex-col items-center justify-center relative overflow-hidden group transition-transform active:scale-95">
              <div className="absolute -right-2 -top-2 text-indigo-500/10 group-hover:scale-110 transition-transform">
                <FontAwesomeIcon icon={faStar} className="text-5xl" />
              </div>
              <div className="flex items-center gap-1.5 mb-0.5">
                <FontAwesomeIcon
                  icon={faStar}
                  className="text-amber-400 text-xl drop-shadow-sm relative z-10"
                />
                <span className="font-bold text-indigo-500 text-sm relative z-10">Estrellas</span>
              </div>
              <span className="font-black text-pb-dark text-xl relative z-10">
                {ownedStars}{' '}
                <span className="text-xs font-bold text-indigo-300 ml-0.5">
                  / {possibleStars || 150}
                </span>
              </span>
            </div>
          </div>

          {/* Level & XP */}
          <div className="bg-white rounded-2xl p-4 border-2 border-b-4 border-slate-200 shadow-sm relative overflow-hidden mt-1">
            <div className="flex items-end justify-between mb-3">
              <div>
                <div className="flex items-center gap-1.5 mb-1 text-indigo-600">
                  <FontAwesomeIcon icon={faTrophy} className="text-sm" />
                  <span className="text-xs font-bold uppercase tracking-wider">Nivel {level}</span>
                </div>
                <div className="font-black text-pb-dark text-xl leading-none">
                  {progress.points} <span className="text-sm font-bold text-pb-text-light">XP</span>
                </div>
              </div>
              <div className="text-right">
                <span className="text-[10px] font-bold text-pb-text-light uppercase tracking-widest block mb-1">
                  Próximo Nivel
                </span>
                <div className="font-black text-indigo-400 text-sm leading-none flex items-center justify-end gap-1">
                  <FontAwesomeIcon icon={faBolt} className="text-xs" />
                  {100 - levelProgressPercentage} XP
                </div>
              </div>
            </div>

            <div className="w-full h-3 bg-slate-100 rounded-full overflow-hidden shadow-inner">
              <motion.div
                className="h-full bg-linear-to-r from-indigo-400 via-indigo-500 to-purple-500 rounded-full relative"
                initial={{ width: 0 }}
                animate={{ width: `${levelProgressPercentage}%` }}
                transition={{ duration: 1, ease: 'easeOut', delay: 0.2 }}
              >
                <div className="absolute inset-0 bg-white/20 h-1/2 rounded-t-full" />
              </motion.div>
            </div>
          </div>
        </div>
      </div>
    </PageTransition>
  )
}
