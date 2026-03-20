import { useEffect, useMemo, useRef, useState } from 'react'
import { motion } from 'framer-motion'

import type { Question } from '../../types'
import { Card } from '../ui/Card'
import { cn } from '../../utils/cn'
import { shuffleArray } from '../../utils/shuffle'
import type { ClickSoundType } from './MultipleChoice'
import { speechService } from '../../services/speechService'

interface ListeningProps {
  question: Question
  onAnswer: (isCorrect: boolean) => void
  onPlaySound?: (type: ClickSoundType) => void
  disabled?: boolean
  scenarioLanguage?: string | null
}

const FEEDBACK_DELAY_MS = {
  correct: 1200,
  wrong: 1500,
}

export function Listening({
  question,
  onAnswer,
  onPlaySound,
  disabled,
  scenarioLanguage,
}: ListeningProps) {
  const [selected, setSelected] = useState<string | null>(null)
  const [feedback, setFeedback] = useState<'correct' | 'wrong' | null>(null)
  const [isPlaying, setIsPlaying] = useState(false)
  
  const answerTimeoutRef = useRef<number | null>(null)
  const playTimeoutRef = useRef<number | null>(null)

  const options = useMemo(() => {
    return shuffleArray([question.correct_answer, ...question.wrong_answers])
  }, [question.correct_answer, question.wrong_answers])

  useEffect(() => {
    // Odpalenie dźwięku przy wejściu (dodane jako mock symulujący naturalne odpalenie pytania)
    handlePlayAudio()

    return () => {
      if (answerTimeoutRef.current) window.clearTimeout(answerTimeoutRef.current)
      if (playTimeoutRef.current) window.clearTimeout(playTimeoutRef.current)
      speechService.stop()
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []) // empty deps, only trigger right at mount

  const handlePlayAudio = () => {
    if (isPlaying) return
    setIsPlaying(true)
    
    // Connects with Jakub's SpeechService
    const textToSpeak = question.question_text_tts || question.question_text || 'Error'
    const ttsLang = scenarioLanguage === 'english' ? 'en-US' : 'es-ES'
    
    speechService.speak(textToSpeak, ttsLang)
    
    // Estimate speaking duration: Base 800ms + 100ms per character (Safe upper bound for UI feeling responsive)
    const estimatedDurationMs = Math.max(1200, 800 + (textToSpeak.length * 100))
    
    playTimeoutRef.current = window.setTimeout(() => {
      setIsPlaying(false)
    }, estimatedDurationMs)
  }

  const handleSelect = (option: string) => {
    if (disabled || selected) return

    const isCorrect = option === question.correct_answer
    setSelected(option)
    setFeedback(isCorrect ? 'correct' : 'wrong')

    onPlaySound?.('click')
    onPlaySound?.(isCorrect ? 'correct' : 'wrong')

    answerTimeoutRef.current = window.setTimeout(() => {
      onAnswer(isCorrect)
      setSelected(null)
      setFeedback(null)
      answerTimeoutRef.current = null
    }, FEEDBACK_DELAY_MS[isCorrect ? 'correct' : 'wrong'])
  }

  const getOptionClass = (option: string) => {
    const base = 'w-full text-left font-bold text-lg'
    if (!selected) {
      return cn(
        base,
        'bg-white border border-transparent shadow-box hover:border-pb-amber/60',
        'transition-all duration-150',
      )
    }

    const isSelected = option === selected
    const isCorrect = option === question.correct_answer

    if (isSelected && feedback === 'correct') {
      return cn(base, 'bg-pb-success/20 border border-pb-success text-pb-success')
    }

    if (isSelected && feedback === 'wrong') {
      return cn(base, 'bg-pb-error/20 border border-pb-error text-pb-error')
    }

    if (!isSelected && feedback) {
      if (isCorrect) {
        return cn(base, 'bg-pb-success/20 border border-pb-success text-pb-success')
      }
      return cn(base, 'bg-white border border-transparent')
    }

    return cn(base, 'bg-white border border-transparent')
  }

  return (
    <div className="flex flex-col gap-6 w-full max-w-sm mx-auto">
      <Card className="p-8 flex flex-col items-center justify-center relative min-h-[240px] bg-white">
        
        <p className="text-lg font-bold text-center mb-6 text-pb-dark">
          {question.question_text || 'Escucha y selecciona la palabra correcta:'}
        </p>

        <motion.button
          onClick={handlePlayAudio}
          className={cn(
            "w-24 h-24 rounded-full flex items-center justify-center text-4xl shadow-box transition-colors focus:outline-none",
            isPlaying ? "bg-pb-amber text-white" : "bg-pb-bg text-pb-dark hover:bg-pb-amber/20"
          )}
          animate={{ scale: isPlaying ? [1, 1.15, 1] : 1 }}
          transition={{ repeat: isPlaying ? Infinity : 0, duration: 1, ease: 'easeInOut' }}
          whileTap={{ scale: 0.95 }}
          aria-label="Reproducir audio"
        >
          {isPlaying ? '🔊' : '▶️'}
        </motion.button>
        
        <div className="h-6 mt-4">
          {isPlaying && (
            <span className="text-xs font-bold text-pb-amber uppercase tracking-widest animate-pulse block">
              Reproduciendo...
            </span>
          )}
        </div>

        {question.hint && (
          <div className="w-full text-center mt-4 border-t border-pb-bg pt-3">
             <p className="text-sm font-bold text-pb-text-light">{question.hint}</p>
          </div>
        )}
      </Card>

      {/* Answers List - Single column (flex-col) for longer, wider lines of text compared to grid */}
      <div className="flex flex-col gap-3">
        {options.map((option) => (
          <button
            key={option}
            type="button"
            onClick={() => handleSelect(option)}
            disabled={!!selected || disabled}
            className={cn(
              'rounded-box-lg px-6 py-4 min-h-[64px]',
              getOptionClass(option),
              selected ? 'cursor-default' : 'cursor-pointer active:scale-95',
            )}
          >
            {option}
          </button>
        ))}
      </div>
    </div>
  )
}
