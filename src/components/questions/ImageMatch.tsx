import { useEffect, useMemo, useRef, useState } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import type { Question } from '../../types'
import { cn } from '../../utils/cn'
import { shuffleArray } from '../../utils/shuffle'

interface Props {
  question: Question
  onAnswer: (isCorrect: boolean) => void
  onPlaySound?: (type: 'click' | 'correct' | 'wrong') => void
  disabled?: boolean
}

const FEEDBACK_DELAY_MS = {
  correct: 1200,
  wrong: 1500,
}

export function ImageMatch({ question, onAnswer, onPlaySound, disabled }: Props) {
  const [selected, setSelected] = useState<string | null>(null)
  const [feedback, setFeedback] = useState<'correct' | 'wrong' | null>(null)
  const timeoutRef = useRef<number | null>(null)

  const options = useMemo(() => {
    return shuffleArray([question.correct_answer, ...question.wrong_answers])
  }, [question.correct_answer, question.wrong_answers])

  useEffect(() => {
    return () => {
      if (timeoutRef.current) {
        window.clearTimeout(timeoutRef.current)
      }
    }
  }, [])

  const handleSelect = (option: string) => {
    if (disabled || selected) return

    const isCorrect = option === question.correct_answer
    setSelected(option)
    setFeedback(isCorrect ? 'correct' : 'wrong')

    onPlaySound?.('click')
    onPlaySound?.(isCorrect ? 'correct' : 'wrong')

    timeoutRef.current = window.setTimeout(() => {
      onAnswer(isCorrect)
      setSelected(null)
      setFeedback(null)
      timeoutRef.current = null
    }, FEEDBACK_DELAY_MS[isCorrect ? 'correct' : 'wrong'])
  }

  const getOptionStyle = (option: string) => {
    const base = 'py-5 px-3 rounded-2xl text-sm sm:text-base font-bold transition-all duration-200'
    if (!selected) {
      return cn(base, 'bg-white border-2 border-b-4 border-slate-200 text-pb-dark hover:bg-slate-50 active:border-b-2 active:translate-y-[2px] cursor-pointer')
    }
    
    const isSelected = option === selected
    const isCorrect = option === question.correct_answer

    if (isSelected && feedback === 'correct') {
      return cn(base, 'bg-[#d7ffb8] border-2 border-b-4 border-[#58cc02] text-[#58cc02]')
    }

    if (isSelected && feedback === 'wrong') {
      return cn(base, 'bg-[#ffdfe0] border-2 border-b-4 border-[#ea2b2b] text-[#ea2b2b]')
    }

    if (!isSelected && feedback && isCorrect) {
      return cn(base, 'bg-[#d7ffb8] border-2 border-b-4 border-[#58cc02] text-[#58cc02]')
    }

    return cn(base, 'bg-slate-100 border-2 border-slate-200 text-slate-400 opacity-60')
  }

  const renderImage = () => {
    const target = question.image_emoji || question.question_text || '❓'
    
    if (target.includes('/') || target.includes('.')) {
      return <img src={target} alt="question image" className="w-40 h-40 object-contain drop-shadow-md" />
    }
    
    return (
      <motion.span
        className="text-7xl sm:text-8xl drop-shadow-md"
        initial={{ scale: 0.8 }}
        animate={{ scale: 1 }}
        transition={{ type: 'spring', stiffness: 300, damping: 15 }}
      >
        {target}
      </motion.span>
    )
  }

  return (
    <div className="flex flex-col gap-6 w-full max-w-sm mx-auto flex-1 justify-center">
      {question.question_text && question.image_emoji && (
        <div className="w-full text-center mb-2">
          <h2 className="text-xl sm:text-2xl font-black text-pb-dark leading-tight">
            {question.question_text}
          </h2>
        </div>
      )}

      <div className="flex items-center justify-center min-h-[140px] relative z-10 w-full mb-4">
        {renderImage()}
      </div>

      {question.hint && (
        <div className="w-full text-center mb-6">
           <p className="text-sm font-bold text-pb-amber uppercase tracking-widest">{question.hint}</p>
        </div>
      )}

      <div className="grid grid-cols-2 gap-3 w-full">
        <AnimatePresence>
          {options.map((option: string, index: number) => (
            <motion.button
              key={option}
              initial={{ opacity: 0, scale: 0.9 }}
              animate={{ opacity: 1, scale: 1 }}
              transition={{ delay: index * 0.06, duration: 0.25 }}
              onClick={() => handleSelect(option)}
              disabled={!!selected || disabled}
              className={getOptionStyle(option)}
            >
              {option}
            </motion.button>
          ))}
        </AnimatePresence>
      </div>
    </div>
  )
}
