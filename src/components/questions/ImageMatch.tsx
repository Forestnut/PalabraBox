import { useState, useMemo } from 'react'
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

export function ImageMatch({ question, onAnswer, onPlaySound, disabled }: Props) {
  const options = useMemo(() => {
    return shuffleArray([question.correct_answer, ...question.wrong_answers])
  }, [question.correct_answer, question.wrong_answers])

  const [selectedAnswer, setSelectedAnswer] = useState<string | null>(null)
  const [answered, setAnswered] = useState(false)

  const handleSelect = (answer: string) => {
    if (answered || disabled) return
    setSelectedAnswer(answer)
    setAnswered(true)

    const correct = answer === question.correct_answer
    onPlaySound?.(correct ? 'correct' : 'wrong')

    setTimeout(() => {
      onAnswer(correct)
    }, 900)
  }

  const getOptionStyle = (option: string) => {
    if (!answered) {
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
    <div className="flex flex-col gap-5 w-full text-center flex-1 items-center">
      <div className="flex items-center justify-center min-h-28">
        <motion.span
          className="text-7xl sm:text-8xl"
          initial={{ scale: 0.8 }}
          animate={{ scale: 1 }}
          transition={{ type: 'spring', stiffness: 300, damping: 15 }}
        >
          {question.image_emoji || question.question_text}
        </motion.span>
      </div>

      <div className="grid grid-cols-2 gap-3 w-full max-w-sm">
        <AnimatePresence>
          {options.map((option: string, index: number) => (
            <motion.button
              key={option}
              initial={{ opacity: 0, scale: 0.9 }}
              animate={{ opacity: 1, scale: 1 }}
              transition={{ delay: index * 0.06, duration: 0.25 }}
              onClick={() => handleSelect(option)}
              disabled={answered || disabled}
              className={cn(
                'py-5 px-3 rounded-2xl text-sm sm:text-base font-bold transition-all duration-200',
                getOptionStyle(option),
              )}
            >
              {option}
            </motion.button>
          ))}
        </AnimatePresence>
      </div>
    </div>
  )
}
