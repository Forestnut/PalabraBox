import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import confetti from 'canvas-confetti'

import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { Mascot } from '../components/ui/Mascot'
import { useGameStore } from '../store/gameStore'
import { useQuickProgress } from '../hooks/useQuickProgress'

export default function ResultsScreen() {
  const navigate = useNavigate()
  
  // Capture game state strictly ON MOUNT so it never flashes or mutates during unmount
  const store = useGameStore()
  const [results] = useState({
    score: store.score,
    lives: store.lives,
    maxLives: store.maxLives || 3
  })
  
  const { score, lives, maxLives } = results
  const { progress } = useQuickProgress()
  const [stars, setStars] = useState(0)

  const isSuccess = lives > 0
  const mistakes = maxLives - lives
  
  // New star logic based on mistakes (0 mistakes = 3 stars, 1-2 mistakes = 2 stars, otherwise 1 or 0)
  let earnedStars = 0
  if (isSuccess) {
    if (mistakes === 0) earnedStars = 3
    else if (mistakes <= 2) earnedStars = 2
    else earnedStars = 1
  }

  useEffect(() => {
    // Animate stars popping in with a slight delay
    let intervalId: number | null = null

    const timer = setTimeout(() => {
      setStars(earnedStars)
      
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
          // since particles fall down, start a bit higher than random
          confetti(
            Object.assign({}, defaults, {
              particleCount,
              origin: { x: Math.random(), y: Math.random() - 0.2 },
              colors: ['#FBBF24', '#34D399', '#F87171', '#60A5FA'],
            })
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
  }, [earnedStars, isSuccess])

  const handleMenu = () => {
    store.resetGame()
    navigate('/menu')
  }

  const handlePlayAgain = () => {
    store.resetGame()
    navigate('/scenarios')
  }

  return (
    <PageTransition className="bg-pb-bg overflow-x-hidden">
      <ScreenWrapper className="flex flex-col items-center justify-between py-4 sm:py-10 min-h-[100dvh] max-h-[100dvh]">
        <div className="flex flex-col items-center gap-1 sm:gap-2 text-center mt-2 flex-grow justify-center">
          <div className="mb-2 sm:mb-4 w-full flex justify-center scale-75 sm:scale-100 origin-bottom">
            <Mascot 
              mood={isSuccess ? 'celebrate' : 'sad'} 
              size="xl" 
              className="drop-shadow-lg" 
            />
          </div>
          <h1 className={`text-2xl sm:text-4xl font-black uppercase tracking-widest text-center ${isSuccess ? 'text-pb-success' : 'text-pb-error'}`}>
            {isSuccess ? '¡Excelente!' : '¡Sigue intentando!'}
          </h1>
          <p className="text-pb-text-light text-sm sm:text-lg px-2">
            {isSuccess ? 'Completaste el escenario con éxito.' : 'Perdiste todas tus vidas.'}
          </p>
        </div>

        <Card className="w-full flex flex-col items-center gap-2 sm:gap-4 p-4 sm:p-8 relative overflow-hidden max-w-sm mt-2 mb-4 shrink-0 shadow-sm border-2">
          <div className="flex flex-col gap-1 sm:gap-2 items-center w-full mb-1 sm:mb-2">
            <div className="flex gap-1 sm:gap-2">
              {[1, 2, 3].map((starIdx) => (
                <div
                  key={starIdx}
                  className={`text-3xl sm:text-5xl transition-all duration-700 ease-out
                    ${starIdx <= stars ? 'text-pb-amber scale-110 drop-shadow-md' : 'text-gray-300 scale-90 grayscale opacity-50'}
                  `}
                  style={{ transitionDelay: `${starIdx * 150}ms` }}
                >
                  ⭐
                </div>
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

          <div className="flex flex-col items-center gap-0 w-full mb-2">
            <span className="text-xs sm:text-sm font-bold text-pb-text-light uppercase tracking-widest">
              Puntuación
            </span>
            <span className="text-4xl sm:text-5xl font-black text-pb-amber leading-none">{score}</span>
          </div>

          <div className="w-full grid grid-cols-2 gap-2 mt-auto">
            <div className="flex flex-col items-center p-2 bg-pb-bg rounded-xl">
              <span className="text-[10px] font-bold text-pb-text-light uppercase tracking-wider text-center">Total Puntos</span>
              <span className="text-xl font-bold text-pb-dark">
                 ⚡ {progress.points}
              </span>
            </div>
            <div className="flex flex-col items-center p-2 bg-pb-bg rounded-xl">
              <span className="text-[10px] font-bold text-pb-text-light uppercase tracking-wider text-center">Vidas</span>
              <span className="text-lg font-bold text-pb-emerald">
                {lives} <span className="text-sm">/ {maxLives}</span>
              </span>
            </div>
          </div>
        </Card>

        <div className="w-full max-w-sm flex flex-col gap-2 sm:gap-4 mt-auto mb-2 shrink-0">
          <Button size="lg" onClick={handlePlayAgain} className="py-3">
            Jugar de nuevo
          </Button>
          <Button variant="ghost" size="lg" onClick={handleMenu} className="py-2">
            Volver al inicio
          </Button>
        </div>
      </ScreenWrapper>
    </PageTransition>
  )
}
