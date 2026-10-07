import { useEffect, useState } from 'react'
import { Navigate, useNavigate } from 'react-router-dom'
import { motion } from 'motion/react'
import confetti from 'canvas-confetti'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faStar, faBolt, faHeart, faRotateRight, faHouse } from '@fortawesome/free-solid-svg-icons'

import { PageTransition } from '../components/layout/PageTransition'
import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { Mascot } from '../components/ui/Mascot'
import { useGameStore } from '../store/gameStore'
import { useQuickProgress } from '../hooks/useQuickProgress'
import { useAudio } from '../hooks/useAudio'

export default function ResultsScreen() {
  const navigate = useNavigate()

  const resetGame = useGameStore((state) => state.resetGame)
  const lastResult = useGameStore((state) => state.lastResult)

  const { progress } = useQuickProgress()
  const { playSound } = useAudio()
  const [stars, setStars] = useState(0)

  // Derived from the single source of truth (gameStore.lastResult)
  const score = lastResult?.score ?? 0
  const lives = lastResult?.lives ?? 0
  const maxLives = lastResult?.maxLives ?? 3
  const isSuccess = lives > 0
  const mistakes = maxLives - lives
  const earnedStars = lastResult?.stars ?? 0

  useEffect(() => {
    if (!lastResult) return

    let intervalId: number | null = null

    const timer = setTimeout(() => {
      setStars(earnedStars)

      // Play result sound effect
      playSound(isSuccess ? 'celebration' : 'wrong')

      if (isSuccess) {
        const duration = 2500
        const animationEnd = Date.now() + duration
        const defaults = { startVelocity: 30, spread: 360, ticks: 60, zIndex: 0 }

        intervalId = window.setInterval(function () {
          const timeLeft = animationEnd - Date.now()

          if (timeLeft <= 0) {
            if (intervalId !== null) {
              clearInterval(intervalId)
              intervalId = null
            }
            return
          }

          const particleCount = 50 * (timeLeft / duration)
          confetti(
            Object.assign({}, defaults, {
              particleCount,
              origin: { x: Math.random(), y: Math.random() - 0.2 },
              colors: ['#FBBF24', '#34D399', '#F87171', '#60A5FA'],
            }),
          )
        }, 250)
      }
    }, 400)

    return () => {
      clearTimeout(timer)
      if (intervalId !== null) {
        clearInterval(intervalId)
      }
    }
  }, [lastResult, earnedStars, isSuccess, playSound])

  // No finished game in this session → nothing to show here
  if (!lastResult) {
    return <Navigate to="/menu" replace />
  }

  const handleMenu = () => {
    resetGame()
    navigate('/menu')
  }

  const handlePlayAgain = () => {
    resetGame()
    navigate('/scenarios')
  }

  return (
    <PageTransition className="bg-pb-bg h-dvh flex flex-col overflow-hidden">
      <div className="max-w-lg mx-auto sm:px-6 px-5 w-full flex flex-col items-center justify-between py-4 sm:py-8 flex-1">
        {/* Hero section */}
        <div className="flex flex-col items-center gap-1 sm:gap-2 text-center mt-2 justify-center">
          <div className="mb-1 sm:mb-4 w-full flex justify-center scale-[0.6] sm:scale-90 origin-bottom">
            <Mascot mood={isSuccess ? 'celebrate' : 'sad'} size="xl" />
          </div>
          <h1
            className={`text-2xl sm:text-3xl font-black uppercase tracking-wide text-center ${isSuccess ? 'text-pb-success' : 'text-pb-error'}`}
          >
            {isSuccess ? '¡Excelente!' : '¡Sigue intentando!'}
          </h1>
          <p className="text-pb-text-light text-sm sm:text-base px-2">
            {isSuccess ? 'Completaste el escenario con éxito.' : 'Perdiste todas tus vidas.'}
          </p>
        </div>

        {/* Results Card */}
        <Card className="w-full flex flex-col items-center gap-2 sm:gap-4 p-5 sm:p-8 relative overflow-hidden max-w-sm mt-2 mb-4 shrink-0 border-2 border-b-4 border-slate-200/60 bg-white">
          {/* Stars */}
          <div className="flex flex-col gap-1 sm:gap-2 items-center w-full mb-1 sm:mb-2">
            <div className="flex gap-2 sm:gap-3">
              {[1, 2, 3].map((starIdx) => (
                <motion.div
                  key={starIdx}
                  initial={{ scale: 0, rotate: -30 }}
                  animate={
                    starIdx <= stars
                      ? { scale: 1, rotate: 0, opacity: 1 }
                      : { scale: 0.8, rotate: 0, opacity: 0.15 }
                  }
                  transition={{
                    delay: starIdx * 0.2,
                    duration: 0.5,
                    type: 'spring',
                    stiffness: 300,
                    damping: 12,
                  }}
                >
                  <FontAwesomeIcon
                    icon={faStar}
                    className={`text-3xl sm:text-4xl ${starIdx <= stars ? 'text-pb-amber' : 'text-black/6'}`}
                  />
                </motion.div>
              ))}
            </div>
            {isSuccess && (
              <span className="text-[10px] sm:text-xs font-bold text-pb-text-light mt-1 text-center">
                {mistakes === 0
                  ? '¡Perfecto! Sin errores = 3 estrellas'
                  : mistakes <= 2
                    ? `Solo ${mistakes} ${mistakes === 1 ? 'error' : 'errores'} = 2 estrellas`
                    : `Sobreviviente (${mistakes} errores) = 1 estrella`}
              </span>
            )}
          </div>

          {/* Score */}
          <div className="flex flex-col items-center gap-0 w-full mb-2">
            <span className="text-xs sm:text-sm font-bold text-pb-text-light uppercase tracking-widest">
              Puntuación
            </span>
            <motion.span
              className="text-4xl sm:text-5xl font-black text-pb-amber leading-none"
              initial={{ scale: 0.5, opacity: 0 }}
              animate={{ scale: 1, opacity: 1 }}
              transition={{ delay: 0.7, type: 'spring', stiffness: 200 }}
            >
              {score}
            </motion.span>
          </div>

          {/* Stats grid */}
          <div className="w-full grid grid-cols-2 gap-3 mt-4">
            <div className="flex flex-col items-center p-3 bg-amber-50 border-2 border-b-4 border-amber-200 rounded-2xl">
              <span className="text-[10px] sm:text-xs font-black text-amber-600/60 uppercase tracking-widest text-center mb-1">
                Total Puntos
              </span>
              <span className="text-xl sm:text-2xl font-black text-amber-500 flex items-center gap-1.5 drop-shadow-sm">
                <FontAwesomeIcon icon={faBolt} className="text-amber-500 text-lg" />
                {progress.points}
              </span>
            </div>
            <div className="flex flex-col items-center p-3 bg-rose-50 border-2 border-b-4 border-rose-200 rounded-2xl">
              <span className="text-[10px] sm:text-xs font-black text-rose-600/60 uppercase tracking-widest text-center mb-1">
                Vidas
              </span>
              <span className="text-xl sm:text-2xl font-black text-rose-500 flex items-center gap-1.5 drop-shadow-sm">
                <FontAwesomeIcon icon={faHeart} className="text-rose-500 text-lg" />
                {lives} <span className="text-sm text-rose-400 opacity-70">/ {maxLives}</span>
              </span>
            </div>
          </div>
        </Card>

        {/* Action Buttons */}
        <div className="w-full max-w-sm flex flex-col gap-2 sm:gap-3 mt-auto mb-2 shrink-0">
          <Button size="lg" onClick={handlePlayAgain} className="py-3">
            <FontAwesomeIcon icon={faRotateRight} className="text-base" />
            Jugar de nuevo
          </Button>
          <Button variant="ghost" size="lg" onClick={handleMenu} className="py-2">
            <FontAwesomeIcon icon={faHouse} className="text-sm" />
            Volver al inicio
          </Button>
        </div>
      </div>
    </PageTransition>
  )
}
