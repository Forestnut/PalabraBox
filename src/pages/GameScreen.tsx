import { useParams } from 'react-router-dom'
import { useState, useCallback, useRef, useEffect } from 'react'
import { motion } from 'framer-motion'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faHeart, faBolt } from '@fortawesome/free-solid-svg-icons'

import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { BackButton } from '../components/layout/BackButton'
import { Mascot, type MascotMood } from '../components/ui/Mascot'
import { useGame } from '../hooks/useGame'
import { useAudio } from '../hooks/useAudio'
import { useGameStore } from '../store/gameStore'
import { QuestionRenderer } from '../components/questions/QuestionRenderer'

/**
 * Main gameplay screen that renders one question at a time and controls intermission prompts.
 */
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
    scenarioLanguage,
  } = useGame(scenarioId)
  const { status } = useGameStore()
  const { playSound } = useAudio()

  const [boxiMood, setBoxiMood] = useState<MascotMood>('idle')
  const [boxiMessage, setBoxiMessage] = useState<string | null>(null)
  const boxiTimeoutRef = useRef<number | null>(null)
  const sleepTimeoutRef = useRef<number | null>(null)

  // Intermission State
  const [showIntermission, setShowIntermission] = useState(false)
  const streakRef = useRef<number>(0)
  const [intermissionText, setIntermissionText] = useState('')
  const [intermissionMood, setIntermissionMood] = useState<MascotMood>('idle')

  const typePhrases: Record<string, string> = {
    listening: '¡Ahora vamos a comprobar tu oído!',
    multiple_choice: '¡Elige la respuesta correcta!',
    image_match: '¡Relaciona la respuesta correcta!',
    word_order: '¡Ordena las palabras correctamente!',
    fill_blank: '¡Completa la palabra que falta!',
  }

  // Sleep timer logic
  useEffect(() => {
    if (status !== 'playing' || showIntermission) return

    const resetSleepTimer = () => {
      if (sleepTimeoutRef.current) window.clearTimeout(sleepTimeoutRef.current)
      setBoxiMood(current => current === 'sleeping' ? 'idle' : current)
      
      sleepTimeoutRef.current = window.setTimeout(() => {
        setBoxiMood('sleeping')
      }, 15000)
    }

    window.addEventListener('mousemove', resetSleepTimer)
    window.addEventListener('touchstart', resetSleepTimer)
    window.addEventListener('keydown', resetSleepTimer)

    resetSleepTimer()

    return () => {
      window.removeEventListener('mousemove', resetSleepTimer)
      window.removeEventListener('touchstart', resetSleepTimer)
      window.removeEventListener('keydown', resetSleepTimer)
      if (sleepTimeoutRef.current) window.clearTimeout(sleepTimeoutRef.current)
    }
  }, [status, showIntermission, currentQuestionIndex])

  // Intermission logic is now handled in onAnswered to ensure it batches with goToNext() and prevents the next question from briefly mounting
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
      <ScreenWrapper className="flex flex-col items-center justify-center min-h-[80vh]">
        <Mascot mood="idle" size="lg" />
        <h2 className="text-xl font-bold mt-6 text-pb-dark animate-pulse">Cargando partida...</h2>
      </ScreenWrapper>
    )
  }

  if (error) {
    return (
      <ScreenWrapper>
        <BackButton fallbackUrl="/scenarios" />
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
        <BackButton fallbackUrl="/scenarios" />
        <p className="text-center py-8 font-bold text-pb-text-light">No se encontraron preguntas.</p>
      </ScreenWrapper>
    )
  }

  if (showIntermission) {
    return (
      <PageTransition>
        <ScreenWrapper className="flex flex-col items-center justify-center min-h-[80vh]">
          <Mascot mood={intermissionMood} size="xl" />
          <h2 className="text-2xl sm:text-3xl font-black text-center text-pb-dark mb-4 mt-8 px-4 leading-tight">
            {intermissionText}
          </h2>
          <div className="w-12 h-1.5 bg-pb-amber rounded-full animate-pulse mt-3" />
          
          <button 
            onClick={() => setShowIntermission(false)}
            className="mt-8 px-8 py-3 bg-linear-to-b from-[#FFB347] to-pb-amber text-white font-bold rounded-2xl shadow-[0_4px_0_#c97a1a] active:translate-y-1 active:shadow-none transition-all cursor-pointer"
          >
            Continuar
          </button>
        </ScreenWrapper>
      </PageTransition>
    )
  }

  const progressPercent = questions.length > 0 ? (currentQuestionIndex / questions.length) * 100 : 0

  return (
    <PageTransition>
      <ScreenWrapper>
        <div className="flex items-center justify-between mb-3 mt-3 px-1 gap-3">
          <BackButton fallbackUrl="/scenarios" />

          <div className="flex-1 flex justify-center items-end min-h-16 relative z-20 pointer-events-none">
            <div className="md:hidden pointer-events-auto origin-bottom transform hover:scale-110 transition-transform">
              <Mascot mood={boxiMood} size="sm" message={boxiMessage} />
            </div>
            <div className="hidden md:flex pointer-events-auto origin-bottom transform hover:scale-110 transition-transform">
              <Mascot mood={boxiMood} size="md" message={boxiMessage} />
            </div>
          </div>

          {/* Stats */}
          <div className="flex items-center gap-3 font-bold text-base relative z-10">
            <span className="text-pb-amber flex items-center gap-1">
              <FontAwesomeIcon icon={faBolt} className="text-sm" />
              {score}
            </span>
            <span className="flex gap-0.5">
              {Array.from({ length: maxLives || 3 }).map((_, i) => (
                <motion.span
                  key={i}
                  initial={false}
                  animate={i < lives ? { scale: 1, opacity: 1 } : { scale: 0.75, opacity: 0.2 }}
                  transition={{ type: 'spring', stiffness: 500, damping: 15 }}
                >
                  <FontAwesomeIcon
                    icon={faHeart}
                    className={i < lives ? 'text-pb-error text-sm' : 'text-pb-text-light/30 text-sm'}
                  />
                </motion.span>
              ))}
            </span>
          </div>
        </div>

        {/* Progress Bar */}
        <div className="w-full bg-black/4 h-2.5 rounded-full mb-5 overflow-hidden">
          <motion.div
            className="bg-linear-to-r from-pb-amber to-[#FFD166] h-full rounded-full relative"
            initial={false}
            animate={{ width: `${progressPercent}%` }}
            transition={{ duration: 0.5, ease: 'easeOut' }}
          >
            <div className="absolute inset-0 bg-white/25 h-1/2 rounded-t-full" />
          </motion.div>
        </div>

        <div className="flex-1 flex flex-col min-h-0 w-full">
          <QuestionRenderer
            key={currentQuestion.id}
            question={currentQuestion}
            scenarioLanguage={scenarioLanguage}
            onAnswered={(isCorrect) => {
              handleAnswer(isCorrect)
              
              const nextLives = isCorrect ? lives : lives - 1
              if (currentQuestionIndex + 1 < questions.length && nextLives > 0) {
                let text = '¡Prepárate para el siguiente reto!'
                let moodToSet: MascotMood = 'idle'
                
                const currentStreak = streakRef.current
                const nextQ = questions[currentQuestionIndex + 1]
                const currQ = questions[currentQuestionIndex]
                
                if (isCorrect) {
                  moodToSet = 'happy'
                  if (currentStreak > 0 && currentStreak % 3 === 0) {
                    text = '¡Vas con todo! ¡Sigue así!'
                    moodToSet = 'celebrate'
                  } else if (nextQ?.type === 'listening') {
                    text = '¡Excelente! Ahora afina tu oído para el siguiente.'
                  } else if (currQ.type === 'listening') {
                    text = '¡Tienes muy buen oído! Sigamos.'
                  } else if (nextQ && typePhrases[nextQ.type]) {
                    text = typePhrases[nextQ.type]
                  } else {
                    const praises = ['¡Muy bien!', '¡Perfecto!', '¡Sigue así!', '¡Excelente!']
                    text = praises[Math.floor(Math.random() * praises.length)] + (nextQ && typePhrases[nextQ.type] ? ' ' + typePhrases[nextQ.type] : '')
                  }
                } else {
                  moodToSet = 'sad'
                  if (currQ.type === 'listening') {
                    text = 'Tranquilo, la escucha puede ser difícil. ¡Inténtalo de nuevo!'
                  } else if (nextQ?.type === 'listening') {
                    text = 'No te desanimes. Vamos a probar con un reto de escuchar.'
                  } else if (nextQ && typePhrases[nextQ.type]) {
                    text = '¡No pasa nada! ' + typePhrases[nextQ.type]
                  } else {
                    text = '¡Ups! Sigue intentándolo.'
                  }
                }
                
                setIntermissionText(text)
                setIntermissionMood(moodToSet)
                setShowIntermission(true)
              }
              
              goToNext()
            }}
            onPlaySound={handlePlaySound}
          />
        </div>
      </ScreenWrapper>
    </PageTransition>
  )
}
