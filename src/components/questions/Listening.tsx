import { useState, useMemo, useCallback } from 'react'
import { motion } from 'framer-motion'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faVolumeHigh, faPlay } from '@fortawesome/free-solid-svg-icons'
import type { Question } from '../../types'
import { cn } from '../../utils/cn'
import { shuffleArray } from '../../utils/shuffle'
import { speechService } from '../../services/speechService'
import { useSettingsStore } from '../../store/settingsStore'
import { Button } from '../ui/Button'

interface Props {
  question: Question
  onAnswer: (isCorrect: boolean) => void
  onPlaySound?: (type: 'click' | 'correct' | 'wrong') => void
  disabled?: boolean
  scenarioLanguage?: string | null
}

export function Listening({ question, onAnswer, onPlaySound, disabled, scenarioLanguage }: Props) {
  const options = useMemo(() => {
    return shuffleArray([question.correct_answer, ...question.wrong_answers])
  }, [question.correct_answer, question.wrong_answers])

  const [selectedAnswer, setSelectedAnswer] = useState<string | null>(null)
  const [answered, setAnswered] = useState(false)
  const [isPlaying, setIsPlaying] = useState(false)
  const speechSpeed = useSettingsStore((s) => s.speechSpeed)

  const play = useCallback(() => {
    if (isPlaying) return
    setIsPlaying(true)
    const text = question.question_text_tts || question.correct_answer
    const lang = scenarioLanguage === 'english' ? 'en-US' : 'es-ES'
    speechService.speak(text, lang, speechSpeed)
    // Approximate speech duration
    setTimeout(() => setIsPlaying(false), Math.max(1500, text.length * 80))
  }, [isPlaying, question, scenarioLanguage, speechSpeed])

  const handleSelect = (answer: string) => {
    if (answered || disabled) return
    setSelectedAnswer(answer)
    onPlaySound?.('click')
  }

  const handleComprobar = () => {
    if (!selectedAnswer || answered || disabled) return
    setAnswered(true)

    const correct = selectedAnswer === question.correct_answer
    onPlaySound?.(correct ? 'correct' : 'wrong')

    setTimeout(() => {
      onAnswer(correct)
    }, 1500)
  }

  const getOptionStyle = (option: string) => {
    if (!answered) {
      if (option === selectedAnswer) {
        return 'bg-pb-amber/10 border-2 border-b-4 border-pb-amber text-pb-amber'
      }
      return 'bg-white border-2 border-b-4 border-slate-200 text-pb-dark hover:bg-slate-50 active:border-b-2 active:translate-y-[2px] cursor-pointer'
    }
    if (option === question.correct_answer) {
      return 'bg-[#d7ffb8] border-2 border-b-4 border-[#58cc02] text-[#58cc02]'
    }
    if (option === selectedAnswer) {
      return 'bg-[#ffdfe0] border-2 border-b-4 border-[#ea2b2b] text-[#ea2b2b]'
    }
    return 'bg-slate-100 border-2 border-slate-200 text-slate-400 opacity-60'
  }

  return (
    <div className="flex flex-col gap-4 w-full text-center flex-1 items-center">
      <div className="flex items-center justify-center py-2">
        <h2 className="text-xl sm:text-2xl font-black text-pb-dark leading-tight px-2 tracking-tight">
          {question.question_text || '¿Qué escuchas?'}
        </h2>
      </div>

      <div className="flex flex-col items-center justify-center min-h-28 gap-3">
        <motion.button
          onClick={play}
          disabled={isPlaying}
          className="w-24 h-24 rounded-full bg-linear-to-b from-[#0a8a5e] to-pb-emerald text-white flex items-center justify-center shadow-[0_6px_0_0_#035c3a,0_8px_24px_-4px_rgba(4,114,77,0.35)] hover:shadow-[0_7px_0_0_#035c3a,0_10px_28px_-4px_rgba(4,114,77,0.4)] active:shadow-[0_2px_0_0_#035c3a] active:translate-y-1 transition-all duration-200 cursor-pointer relative"
          whileHover={{ scale: 1.05 }}
          whileTap={{ scale: 0.95 }}
        >
          <FontAwesomeIcon
            icon={isPlaying ? faVolumeHigh : faPlay}
            className="text-3xl"
          />
          {isPlaying && (
            <>
              <motion.div
                className="absolute inset-0 rounded-full border-2 border-pb-emerald/40"
                animate={{ scale: [1, 1.6], opacity: [0.6, 0] }}
                transition={{ repeat: Infinity, duration: 1.2, ease: 'easeOut' }}
              />
              <motion.div
                className="absolute inset-0 rounded-full border-2 border-pb-emerald/30"
                animate={{ scale: [1, 1.8], opacity: [0.4, 0] }}
                transition={{ repeat: Infinity, duration: 1.2, ease: 'easeOut', delay: 0.3 }}
              />
            </>
          )}
        </motion.button>
        <p className="text-xs text-pb-text-light font-semibold">
          {isPlaying ? 'Reproduciendo...' : 'Toca para escuchar'}
        </p>
      </div>

      <div className="grid grid-cols-1 gap-2.5 w-full">
        {options.map((option: string, index: number) => (
          <motion.button
            key={option}
            initial={{ opacity: 0, y: 8 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: index * 0.06, duration: 0.25 }}
            onClick={() => handleSelect(option)}
            disabled={answered || disabled}
            className={cn(
              'w-full py-4 px-5 rounded-2xl text-base font-bold transition-all duration-200 text-left',
              getOptionStyle(option),
            )}
          >
            <span className="inline-flex items-center gap-3 w-full">
              <span className="w-7 h-7 rounded-lg bg-black/4 flex items-center justify-center text-sm font-black text-pb-text-light/60 shrink-0">
                {String.fromCharCode(65 + index)}
              </span>
              <span>{option}</span>
            </span>
          </motion.button>
        ))}
      </div>

      <div className="mt-4 w-full max-w-sm mx-auto">
        <Button
          onClick={handleComprobar}
          disabled={!selectedAnswer || answered || disabled}
          className="w-full text-lg shadow-soft"
        >
          COMPROBAR
        </Button>
      </div>
    </div>
  )
}
