import { useEffect, useMemo, useRef, useState } from 'react'

import type { Question } from '../../types'
import { Card } from '../ui/Card'
import { cn } from '../../utils/cn'
import { shuffleArray } from '../../utils/shuffle'

export type ClickSoundType = 'click' | 'correct' | 'wrong'

interface MultipleChoiceProps {
  question: Question
  /** Called when user selects an answer and the feedback delay ends */
  onAnswer: (isCorrect: boolean) => void
  /** Optional handler to play click/correct/wrong sounds */
  onPlaySound?: (type: ClickSoundType) => void
  /** Disable interaction (useful for pausing or before question loads) */
  disabled?: boolean
}

const FEEDBACK_DELAY_MS = {
  correct: 1200,
  wrong: 1500,
}

export function MultipleChoice({
  question,
  onAnswer,
  onPlaySound,
  disabled,
}: MultipleChoiceProps) {
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

  const getOptionClass = (option: string) => {
    const base = 'w-full text-left font-bold text-lg'
    if (!selected) {
      return cn(
        base,
        'bg-white border-2 border-slate-200 border-b-4 hover:bg-slate-50',
        'transition-all duration-150 active:translate-y-[2px] active:border-b-2',
      )
    }

    const isSelected = option === selected
    const isCorrect = option === question.correct_answer

    if (isSelected && feedback === 'correct') {
      return cn(base, 'bg-green-100 border-2 border-green-500 border-b-4 text-green-900')
    }

    if (isSelected && feedback === 'wrong') {
      return cn(base, 'bg-red-100 border-2 border-red-500 border-b-4 text-red-900')
    }

    if (!isSelected && feedback) {
      // If wrong, still highlight correct answer
      if (isCorrect) {
        return cn(base, 'bg-green-100 border-2 border-green-500 border-b-4 text-green-900')
      }
      return cn(base, 'bg-white border-2 border-slate-200 border-b-4 opacity-50')
    }

    return cn(base, 'bg-white border-2 border-slate-200 border-b-4')
  }

  return (
    <div className="flex flex-col gap-3">
      <Card className="p-5">
        <p className="text-lg font-bold">{question.question_text}</p>
        {question.hint && (
          <p className="mt-2 text-sm text-pb-text-light">Pista: {question.hint}</p>
        )}
      </Card>

      <div className="grid grid-cols-1 gap-3">
        {options.map((option) => (
          <button
            key={option}
            type="button"
            onClick={() => handleSelect(option)}
            disabled={!!selected || disabled}
            className={cn(
              'rounded-box-lg px-4 py-4 text-left',
              getOptionClass(option),
              selected ? 'cursor-default' : 'cursor-pointer',
            )}
          >
            {option}
          </button>
        ))}
      </div>
    </div>
  )
}
