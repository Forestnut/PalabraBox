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

  // Intermission State
  const [showIntermission, setShowIntermission] = useState(false)
  const prevQuestionIndex = useRef<number>(-1)

  useEffect(() => {
    // Show intermission when question changes and game is playing
    if (status === 'playing' && currentQuestion && currentQuestionIndex !== prevQuestionIndex.current) {
      prevQuestionIndex.current = currentQuestionIndex
      setShowIntermission(true)
      
      const t = setTimeout(() => {
        setShowIntermission(false)
      }, 2500)
      return () => clearTimeout(t)
    }
  }, [currentQuestion, currentQuestionIndex, status])

  const handlePlaySound = useCallback((type: 'click' | 'correct' | 'wrong') => {
    playSound(type)
    if (type === 'correct') {
      setBoxiMood('happy')
      setBoxiMessage('¡Genial!')
      if (boxiTimeoutRef.current) window.clearTimeout(boxiTimeoutRef.current)
      boxiTimeoutRef.current = window.setTimeout(() => {
        setBoxiMood('idle')
        setBoxiMessage(null)
      }, 1500)
    } else if (type === 'wrong') {
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

  const intermissionPhrases: Record<string, string> = {
    'listening': 'Teraz pora sprawdzić twój słuch!',
    'multiple_choice': 'Wybierz poprawną odpowiedź!',
    'image_match': 'Dopasuj odpowiedni obrazek!',
    'word_order': 'Ułóż słowa w poprawnej kolejności!'
  }

  if (showIntermission) {
    const text = intermissionPhrases[currentQuestion.type] || 'Przygotuj się na kolejne zadanie!'
    return (
      <PageTransition>
        <ScreenWrapper className="flex flex-col items-center justify-center min-h-[80vh]">
          <Mascot mood="happy" size="xl" />
          <h2 className="text-3xl font-black text-center text-pb-dark mb-4 mt-8 px-4" style={{ WebkitTextStroke: '1px white' }}>
            {text}
          </h2>
          <div className="w-16 h-2 bg-pb-amber rounded-full animate-pulse mt-4"></div>
        </ScreenWrapper>
      </PageTransition>
    )
  }

  return (
    <PageTransition>
      <ScreenWrapper>
        <div className="flex items-center justify-between mb-4 mt-4 px-2">
          <BackButton fallbackUrl="/scenarios" label="←" />
          <div className="flex-1 flex justify-center items-end px-2 pt-4 min-h-20">
            <Mascot mood={boxiMood} size="sm" message={boxiMessage} className="origin-bottom transform hover:scale-110 transition-transform md:hidden" />
            <Mascot mood={boxiMood} size="md" message={boxiMessage} className="origin-bottom transform hover:scale-110 transition-transform hidden md:flex" />
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
