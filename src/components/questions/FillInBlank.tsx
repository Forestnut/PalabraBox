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
  scenarioLanguage?: string | null
}

export function FillInBlank({ question, onAnswer, onPlaySound, disabled }: Props) {
  const wordOptions = useMemo(() => {
    return shuffleArray([question.correct_answer, ...question.wrong_answers])
  }, [question.correct_answer, question.wrong_answers])

  const [selectedWord, setSelectedWord] = useState<string | null>(null)
  const [answered, setAnswered] = useState(false)

  const handleWordClick = (word: string) => {
    if (answered || disabled) return
    setSelectedWord((prev) => (prev === word ? null : word))
  }

  const handleSubmit = () => {
    if (!selectedWord || answered) return
    setAnswered(true)

    const correct = selectedWord === question.correct_answer
    onPlaySound?.(correct ? 'correct' : 'wrong')

    setTimeout(() => {
      onAnswer(correct)
    }, 900)
  }

  const parts = question.question_text?.split('___') ?? [question.question_text]

  const blankFeedback = answered
    ? selectedWord === question.correct_answer
      ? 'ring-2 ring-pb-success/40 bg-emerald-50'
      : 'ring-2 ring-pb-error/40 bg-red-50'
    : selectedWord
      ? 'ring-2 ring-pb-amber/40 bg-amber-50/40'
      : ''

  return (
    <div className="flex flex-col gap-6 w-full text-center flex-1 items-center">
      <div className="flex items-center justify-center min-h-24 py-4">
        <h2 className="text-xl sm:text-2xl font-black text-pb-dark leading-relaxed px-2 tracking-tight flex flex-wrap items-baseline justify-center gap-x-1">
          {parts[0]}
          <span className={cn(
            'inline-flex items-center justify-center min-w-32 py-1.5 px-3 rounded-2xl border-2 border-b-4 transition-all duration-300 text-lg sm:text-xl mx-2 shadow-sm',
            selectedWord ? 'border-pb-amber bg-amber-50' : 'border-slate-300 bg-slate-100 border-dashed',
            blankFeedback
          )}>
            <AnimatePresence mode="wait">
              {selectedWord ? (
                <motion.span
                  key={selectedWord}
                  initial={{ opacity: 0, y: 6 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: -6 }}
                  className="font-black text-pb-dark"
                >
                  {selectedWord}
                </motion.span>
              ) : (
                <span className="text-slate-300 font-bold tracking-widest">___</span>
              )}
            </AnimatePresence>
          </span>
          {parts[1] && parts[1]}
        </h2>
      </div>

      <div className="flex flex-wrap justify-center gap-3 w-full">
        {wordOptions.map((word: string, index: number) => (
          <motion.button
            key={word}
            initial={{ opacity: 0, y: 8 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: index * 0.06, duration: 0.25 }}
            onClick={() => handleWordClick(word)}
            disabled={answered || disabled}
            className={cn(
              'px-5 py-3 rounded-2xl font-bold text-sm sm:text-base transition-all duration-200',
              selectedWord === word
                ? 'bg-[#d7ffb8] border-2 border-b-4 border-[#58cc02] text-[#58cc02] scale-105'
                : answered
                  ? 'bg-slate-100 border-2 border-slate-200 text-slate-400 opacity-50'
                  : 'bg-white border-2 border-b-4 border-slate-200 text-pb-dark hover:bg-slate-50 active:border-b-2 active:translate-y-[2px] cursor-pointer',
            )}
          >
            {word}
          </motion.button>
        ))}
      </div>

      <div className="mt-auto pt-4 w-full">
        <Button
          onClick={handleSubmit}
          disabled={!selectedWord || answered}
          className="w-full"
        >
          COMPROBAR
        </Button>
      </div>
    </div>
  )
}
