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
            'inline-flex items-center justify-center min-w-32 py-1.5 px-3 rounded-xl border-2 border-dashed transition-all duration-300 text-lg sm:text-xl mx-1',
            selectedWord ? 'border-pb-amber/50' : 'border-pb-text-light/20',
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
                <span className="text-pb-text-light/30">___</span>
              )}
            </AnimatePresence>
          </span>
          {parts[1] && parts[1]}
        </h2>
      </div>

      <div className="flex flex-wrap justify-center gap-2 w-full">
        {wordOptions.map((word: string, index: number) => (
          <motion.button
            key={word}
            initial={{ opacity: 0, y: 8 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: index * 0.06, duration: 0.25 }}
            onClick={() => handleWordClick(word)}
            disabled={answered || disabled}
            className={cn(
              'px-5 py-3 rounded-xl font-bold text-sm sm:text-base transition-all duration-200',
              selectedWord === word
                ? 'bg-linear-to-b from-[#FFB347] to-pb-amber text-white shadow-[0_3px_0_0_#c97a1a] scale-105'
                : answered
                  ? 'bg-white/40 opacity-40'
                  : 'bg-white/75 backdrop-blur-xl ring-1 ring-black/4 shadow-glass hover:shadow-elevated hover:-translate-y-0.5 active:translate-y-0.5 cursor-pointer',
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
