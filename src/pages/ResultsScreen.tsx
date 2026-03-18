import { useEffect, useMemo, useRef } from 'react'
import { useNavigate } from 'react-router-dom'
import confetti from 'canvas-confetti'

import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { Button } from '../components/ui/Button'
import { Card } from '../components/ui/Card'
import { useGameStore } from '../store/gameStore'

const STORAGE_KEY = 'palabrabox.quickProgress'

export default function ResultsScreen() {
  const navigate = useNavigate()
  const { score, lives, totalQuestions, resetGame } = useGameStore()
  const hasSavedRef = useRef(false)

  const maxScore = totalQuestions * 10
  const percentage = maxScore > 0 ? score / maxScore : 0
  const isSuccess = percentage >= 0.7 && lives > 0

  const stars = useMemo(() => {
    if (lives === 0 || percentage < 0.5) return 0
    if (percentage < 0.7) return 1
    if (percentage < 1) return 2
    return 3
  }, [percentage, lives])

  // Confetti effect
  useEffect(() => {
    if (isSuccess) {
      const duration = 2500
      const animationEnd = Date.now() + duration
      const defaults = { startVelocity: 30, spread: 360, ticks: 60, zIndex: 0 }

      const interval: number = window.setInterval(function () {
        const timeLeft = animationEnd - Date.now()

        if (timeLeft <= 0) {
          return clearInterval(interval)
        }

        const particleCount = 50 * (timeLeft / duration)
        // since particles fall down, start a bit higher than random
        confetti(
          Object.assign({}, defaults, {
            particleCount,
            origin: { x: Math.random(), y: Math.random() - 0.2 },
            colors: ['#FBBF24', '#34D399', '#F87171', '#60A5FA'],
          }),
        )
      }, 250)

      return () => clearInterval(interval)
    }
  }, [isSuccess])

  // Save progress safely on mount
  useEffect(() => {
    if (!hasSavedRef.current && isSuccess) {
      hasSavedRef.current = true
      try {
        const raw = window.localStorage.getItem(STORAGE_KEY)
        const parsed = raw ? JSON.parse(raw) : null
        const currentData =
          parsed && typeof parsed.completed === 'number'
            ? parsed
            : { streakDays: 3, completed: 2, total: 12, points: 450 } // fallback to DEFAULT_PROGRESS from hook

        const newData = {
          ...currentData,
          completed: currentData.completed + 1,
          points: currentData.points + score,
        }
        window.localStorage.setItem(STORAGE_KEY, JSON.stringify(newData))
      } catch (err) {
        console.error('Failed to save quick progress', err)
      }
    }
  }, [isSuccess, score])

  const handleMenu = () => {
    resetGame()
    navigate('/menu')
  }

  const handlePlayAgain = () => {
    resetGame()
    navigate('/scenarios')
  }

  return (
    <PageTransition className="bg-pb-bg">
      <ScreenWrapper className="flex flex-col items-center justify-center gap-8 py-10">
        <div className="flex flex-col items-center gap-2 text-center mt-6">
          <div className="text-6xl mb-4">{isSuccess ? '🎉' : '💔'}</div>
          <h1 className="text-4xl font-black text-pb-dark">
            {isSuccess ? '¡Excelente!' : '¡Sigue intentando!'}
          </h1>
          <p className="text-pb-text-light text-lg">
            {isSuccess ? 'You completed the scenario successfully.' : 'You lost all your lives or scored low.'}
          </p>
        </div>

        <Card className="w-full flex flex-col items-center gap-6 p-8 relative overflow-hidden">
          {/* Stars display */}
          <div className="flex gap-2">
            {[1, 2, 3].map((starIndex) => (
              <div
                key={starIndex}
                className={`text-5xl transition-all duration-500 delay-${starIndex * 150} ${
                  starIndex <= stars
                    ? 'scale-110 drop-shadow-[0_4px_8px_rgba(251,191,36,0.6)]'
                    : 'opacity-30 grayscale'
                }`}
              >
                ⭐
              </div>
            ))}
          </div>

          <div className="flex flex-col items-center gap-1">
            <span className="text-sm font-bold text-pb-text-light uppercase tracking-widest">
              Score
            </span>
            <span className="text-5xl font-black text-pb-amber">{score}</span>
          </div>

          <div className="w-full grid grid-cols-2 gap-4 mt-2">
            <div className="flex flex-col items-center p-3 bg-pb-bg rounded-xl">
              <span className="text-xs font-bold text-pb-text-light uppercase">Accuracy</span>
              <span className="text-xl font-bold text-pb-dark">
                {Math.round(percentage * 100)}%
              </span>
            </div>
            <div className="flex flex-col items-center p-3 bg-pb-bg rounded-xl">
              <span className="text-xs font-bold text-pb-text-light uppercase">Lives Left</span>
              <span className="text-xl font-bold text-pb-emerald">
                {lives} <span className="text-sm">/ 3</span>
              </span>
            </div>
          </div>
        </Card>

        <div className="w-full flex flex-col gap-4 mt-auto mb-6">
          <Button size="lg" onClick={handlePlayAgain}>
            Jugar de nuevo
          </Button>
          <Button variant="ghost" size="lg" onClick={handleMenu}>
            Volver al inicio
          </Button>
        </div>
      </ScreenWrapper>
    </PageTransition>
  )
}
