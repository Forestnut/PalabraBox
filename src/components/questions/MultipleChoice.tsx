import { useState, useMemo } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import type { Question } from '../../types'
import { cn } from '../../utils/cn'
import { shuffleArray } from '../../utils/shuffle'
import { Button } from '../ui/Button'

interface Props {
  question: Question
  onAnswer: (isCorrect: boolean) => void
  onPlaySound?: (type: 'click' | 'correct' | 'wrong') => void
  disabled?: boolean
}

export function MultipleChoice({ question, onAnswer, onPlaySound, disabled }: Props) {
  const options = useMemo(() => {
    return shuffleArray([question.correct_answer, ...question.wrong_answers])
  }, [question.correct_answer, question.wrong_answers])

  const [selectedAnswer, setSelectedAnswer] = useState<string | null>(null)
  const [answered, setAnswered] = useState(false)

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
    if (option === selectedAnswer && option !== question.correct_answer) {
      return 'bg-[#ffdfe0] border-2 border-b-4 border-[#ea2b2b] text-[#ea2b2b]'
    }
    return 'bg-slate-100 border-2 border-slate-200 text-slate-400 opacity-60'
  }

  return (
    <div className="flex flex-col gap-4 w-full text-center flex-1">
      <div className="flex items-center justify-center min-h-24 py-4">
        <h2 className="text-xl sm:text-2xl font-black text-pb-dark leading-tight px-2 tracking-tight">
          {question.question_text}
        </h2>
      </div>

      <div className="grid grid-cols-1 gap-2.5 w-full">
        <AnimatePresence>
          {options.map((option: string, index: number) => (
            <motion.button
              key={option}
              initial={{ opacity: 0, y: 8 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: index * 0.06, duration: 0.25 }}
              onClick={() => handleSelect(option)}
              disabled={answered || disabled}
              className={cn(
                'w-full py-4 px-5 rounded-2xl text-base font-bold transition-all duration-200 text-left leading-snug',
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
        </AnimatePresence>
      </div>

      <div className="mt-6 w-full max-w-sm mx-auto">
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
