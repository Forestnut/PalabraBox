import { useParams } from 'react-router-dom'
import { useState, useCallback, useRef, useEffect } from 'react'

import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { BackButton } from '../components/layout/BackButton'
import { Mascot, type MascotMood } from '../components/ui/Mascot'
import { useGame } from '../hooks/useGame'
import { useAudio } from '../hooks/useAudio'
import { useGameStore } from '../store/gameStore'
import { QuestionRenderer } from '../components/questions/QuestionRenderer'

export default function GameScreen() {
  const { scenarioId } = useParams<{ scenarioId: string }>()
  const {
    currentQuestion,
    currentQuestionIndex,
    questions,
    loading,
    error,
    handleAnswer,
    goToNext,
    lives,
    maxLives,
    score,
  } = useGame(scenarioId)
  const { status } = useGameStore()
  const { playSound } = useAudio()

  const [boxiMood, setBoxiMood] = useState<MascotMood>('idle')
  const [boxiMessage, setBoxiMessage] = useState<string | null>(null)
  const boxiTimeoutRef = useRef<number | null>(null)
  const sleepTimeoutRef = useRef<number | null>(null)

  // Intermission State
  const [showIntermission, setShowIntermission] = useState(false)
  const prevQuestionIndex = useRef<number>(-1)
  const streakRef = useRef<number>(0)
  const [intermissionText, setIntermissionText] = useState('')

  // Sleep timer logic
  useEffect(() => {
    if (status !== 'playing' || showIntermission) return

    const resetSleepTimer = () => {
      if (sleepTimeoutRef.current) window.clearTimeout(sleepTimeoutRef.current)
      // Only set idle if it was sleeping. Don't overwrite 'happy' or 'wrong' animations
      setBoxiMood(current => current === 'sleeping' ? 'idle' : current)
      
      sleepTimeoutRef.current = window.setTimeout(() => {
        setBoxiMood('sleeping')
        setBoxiMessage('Zzz...')
      }, 15000) // 15 seconds of inactivity
    }

    // Reset timer on any mouse movement or touch
    window.addEventListener('mousemove', resetSleepTimer)
    window.addEventListener('touchstart', resetSleepTimer)
    window.addEventListener('keydown', resetSleepTimer)

    // Initial start
    resetSleepTimer()

    return () => {
      window.removeEventListener('mousemove', resetSleepTimer)
      window.removeEventListener('touchstart', resetSleepTimer)
      window.removeEventListener('keydown', resetSleepTimer)
      if (sleepTimeoutRef.current) window.clearTimeout(sleepTimeoutRef.current)
    }
  }, [status, showIntermission, currentQuestionIndex])

  useEffect(() => {
    // Show intermission ONLY after returning to playing state (i.e. next question)
    // but not on the very first question
    if (status === 'playing' && currentQuestionIndex !== prevQuestionIndex.current) {
      if (currentQuestionIndex > 0 && currentQuestion) {
        
        let text = 'Przygotuj się na kolejne zadanie!'
        
        // 1. Sprawdź streak
        if (streakRef.current > 0 && streakRef.current % 3 === 0) {
          text = 'Idziesz jak burza! Tak trzymaj!'
        } else {
          // 2. Jeśli nie streak, daj powiązane zadanie
          const typePhrases: Record<string, string> = {
            'listening': 'Teraz pora sprawdzić twój słuch!',
            'multiple_choice': 'Wybierz poprawną odpowiedź!',
            'image_match': 'Dopasuj odpowiedź!',
            'word_order': 'Ułóż słowa w poprawnej kolejności!',
            'fill_blank': 'Uzupełnij brakujące słowo!'
          }
          if (typePhrases[currentQuestion.type]) {
            text = typePhrases[currentQuestion.type]
          }
        }

        setIntermissionText(text)
        setShowIntermission(true)
        
        prevQuestionIndex.current = currentQuestionIndex
      } else {
        // Pierwsze pytanie - pomijamy intermission
        prevQuestionIndex.current = currentQuestionIndex
      }
    }
  }, [currentQuestionIndex, status, currentQuestion?.type])

  const handlePlaySound = useCallback((type: 'click' | 'correct' | 'wrong') => {
    playSound(type)
    if (type === 'correct') {
      streakRef.current += 1
      setBoxiMood('happy')
      setBoxiMessage('¡Genial!')
      if (boxiTimeoutRef.current) window.clearTimeout(boxiTimeoutRef.current)
      boxiTimeoutRef.current = window.setTimeout(() => {
        setBoxiMood('idle')
        setBoxiMessage(null)
      }, 1500)
    } else if (type === 'wrong') {
      streakRef.current = 0
      setBoxiMood('wrong')
      setBoxiMessage('¡Ups!')
      if (boxiTimeoutRef.current) window.clearTimeout(boxiTimeoutRef.current)
      boxiTimeoutRef.current = window.setTimeout(() => {
        setBoxiMood('idle')
        setBoxiMessage(null)
      }, 1200)
    }
  }, [playSound])

  if (loading) {
    return (
      <ScreenWrapper>
        <p className="text-center py-8 font-bold text-pb-text-light">Cargando partida...</p>
      </ScreenWrapper>
    )
  }

  if (error) {
    return (
      <ScreenWrapper>
        <BackButton fallbackUrl="/scenarios" label="←" />
        <p className="text-center text-pb-error py-8 font-bold">Error: {error}</p>
      </ScreenWrapper>
    )
  }

  if (status === 'finished') {
    return (
      <ScreenWrapper>
        <p className="text-center py-8 font-bold text-pb-text-light text-xl">
          ¡Juego Terminado! Preparando resultados...
        </p>
      </ScreenWrapper>
    )
  }

  if (!currentQuestion) {
    return (
      <ScreenWrapper>
        <BackButton fallbackUrl="/scenarios" label="←" />
        <p className="text-center py-8 font-bold text-pb-text-light">No se encontraron preguntas.</p>
      </ScreenWrapper>
    )
  }

  if (showIntermission) {
    return (
      <PageTransition>
        <ScreenWrapper className="flex flex-col items-center justify-center min-h-[80vh]">
          <Mascot mood={streakRef.current > 0 && streakRef.current % 3 === 0 ? "celebrate" : "idle"} size="xl" />
          <h2 className="text-3xl font-black text-center text-pb-dark mb-4 mt-8 px-4" style={{ WebkitTextStroke: '1px white' }}>
            {intermissionText}
          </h2>
          <div className="w-16 h-2 bg-pb-amber rounded-full animate-pulse mt-4"></div>
          
          <button 
            onClick={() => setShowIntermission(false)}
            className="mt-8 px-8 py-3 bg-pb-amber hover:bg-yellow-500 text-white font-bold rounded-xl shadow-[0_4px_0_#b45309] active:translate-y-1 active:shadow-none transition-all"
          >
            Kontynuuj
          </button>
        </ScreenWrapper>
      </PageTransition>
    )
  }

  return (
    <PageTransition>
      <ScreenWrapper>
        <div className="flex items-center justify-between mb-4 mt-4 px-2">
          <BackButton fallbackUrl="/scenarios" label="←" />
          <div className="flex-1 flex justify-center items-end px-2 pt-4 min-h-20 relative z-20 mascot-container pointer-events-none">
            <div className="md:hidden pointer-events-auto origin-bottom transform hover:scale-110 transition-transform">
              <Mascot mood={boxiMood} size="sm" message={boxiMessage} />
            </div>
            <div className="hidden md:flex pointer-events-auto origin-bottom transform hover:scale-110 transition-transform">
              <Mascot mood={boxiMood} size="md" message={boxiMessage} />
            </div>
          </div>
          <div className="flex flex-col items-end sm:flex-row sm:items-center gap-1 sm:gap-4 font-bold text-base sm:text-xl relative z-10">
            <span className="text-pb-amber drop-shadow-sm flex items-center gap-1">⚡ {score}</span>
            <span className="text-pb-error drop-shadow-sm tracking-widest text-sm sm:text-xl flex">
              {Array.from({ length: maxLives || 3 }).map((_, i) => (
                <span key={i} className={i < lives ? 'opacity-100' : 'opacity-30'}>
                  ❤️
                </span>
              ))}
            </span>
          </div>
        </div>

        <div className="w-full bg-pb-amber/20 h-4 rounded-full mb-6 shadow-inner overflow-hidden border-2 border-pb-amber/30">
          <div
            className="bg-pb-amber h-full rounded-full transition-all duration-500 ease-out relative"
            style={{ width: `${(currentQuestionIndex / questions.length) * 100}%` }}
          >
            <div className="absolute inset-0 bg-white/20 w-full h-1/2 rounded-t-full"></div>
          </div>
        </div>

        <div className="flex-1 flex flex-col min-h-0 w-full">
          <QuestionRenderer
            key={currentQuestion.id}
            question={currentQuestion}
            onAnswered={(isCorrect) => {
              handleAnswer(isCorrect)
              goToNext()
            }}
            onPlaySound={handlePlaySound}
          />
        </div>
      </ScreenWrapper>
    </PageTransition>
  )
}
