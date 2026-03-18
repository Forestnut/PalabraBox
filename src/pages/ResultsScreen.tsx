import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import confetti from 'canvas-confetti'
import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { useGameStore } from '../store/gameStore'
import { useQuickProgress } from '../hooks/useQuickProgress'

export default function ResultsScreen() {
  const navigate = useNavigate()
  
  // Capture the game state strictly ON MOUNT so it never flashes or mutates during unmount
  const store = useGameStore()
  const [results] = useState({
    score: store.score,
    lives: store.lives,
    maxLives: store.maxLives || 3
  })
  
  const { score, lives, maxLives } = results
  const { progress } = useQuickProgress()
  const [stars, setStars] = useState(0)

  const earnedStars = Math.max(0, lives)
  const isWin = earnedStars > 0

  useEffect(() => {
    // Animate stars popping in with a slight delay
    const timer = setTimeout(() => {
      setStars(earnedStars)
      
      if (isWin) {
        const end = Date.now() + 2 * 1000
        const colors = ['#56876D', '#FFA42C', '#10B981']

        ;(function frame() {
          confetti({
            particleCount: 4,
            angle: 60,
            spread: 55,
            origin: { x: 0 },
            colors: colors
          })
          confetti({
            particleCount: 4,
            angle: 120,
            spread: 55,
            origin: { x: 1 },
            colors: colors
          })

          if (Date.now() < end) {
            requestAnimationFrame(frame)
          }
        })()
      }
    }, 400)

    return () => clearTimeout(timer)
  }, [earnedStars, isWin])

  const handleReturn = () => {
    // Only navigate. Game resets happen securely upon ENTERING a new level.
    navigate('/scenarios')
  }

  return (
    <PageTransition className="bg-pb-bg">
      <ScreenWrapper className="flex flex-col items-center justify-center gap-6 min-h-[80vh]">
        
        <div className="flex gap-2 mb-4">
          {[1, 2, 3].map((starIdx) => (
            <span 
              key={starIdx} 
              className={`text-6xl transition-all duration-700 ease-out
                ${starIdx <= stars ? 'text-pb-amber scale-110 drop-shadow-md' : 'text-gray-300 scale-90 grayscale opacity-50'}
              `}
              style={{ transitionDelay: `${starIdx * 150}ms` }}
            >
              ★
            </span>
          ))}
        </div>

        <h1 className={`text-4xl font-black uppercase tracking-widest text-center ${isWin ? 'text-pb-success' : 'text-pb-error'}`}>
          {isWin ? '¡Excelente!' : '¡Inténtalo de nuevo!'}
        </h1>

        <Card className="w-full max-w-sm text-center flex flex-col gap-4 mt-4">
          <div className="flex justify-between items-center border-b-2 border-gray-100 pb-4">
            <span className="text-pb-text-light font-bold">Puntuación</span>
            <span className="text-2xl font-black text-pb-dark">{score}</span>
          </div>
          <div className="flex justify-between items-center border-b-2 border-gray-100 pb-4">
            <span className="text-pb-text-light font-bold">Vidas restantes</span>
            <span className="text-2xl font-black text-pb-error">
              {lives} <span className="text-lg">/ {maxLives || 3}</span>
            </span>
          </div>
          <div className="flex justify-between items-center pt-2">
            <span className="text-pb-text-light font-bold">Total Puntos</span>
            <span className="text-2xl font-black text-pb-amber flex items-center gap-2">
              ⭐ {progress.points}
            </span>
          </div>
        </Card>

        <Button size="lg" className="w-full max-w-sm mt-8" onClick={handleReturn}>
          Aceptar
        </Button>
      </ScreenWrapper>
    </PageTransition>
  )
}
