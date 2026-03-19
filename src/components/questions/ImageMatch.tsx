import { useEffect, useMemo, useRef, useState } from 'react'

import type { Question } from '../../types'
import { Card } from '../ui/Card'
import { cn } from '../../utils/cn'
import { shuffleArray } from '../../utils/shuffle'
import type { ClickSoundType } from './MultipleChoice'

interface ImageMatchProps {
  question: Question
  onAnswer: (isCorrect: boolean) => void
  onPlaySound?: (type: ClickSoundType) => void
  disabled?: boolean
}

const FEEDBACK_DELAY_MS = {
  correct: 1200,
  wrong: 1500,
}

export function ImageMatch({
  question,
  onAnswer,
  onPlaySound,
  disabled,
}: ImageMatchProps) {
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
    const base = 'w-full text-center flex items-center justify-center font-bold text-xl'
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

  // Determine how to render the image_emoji
  const renderImage = () => {
    if (!question.image_emoji) return <span className="text-6xl">❓</span>
    
    // Check if it's an image path or standard emoji
    if (question.image_emoji.includes('/') || question.image_emoji.includes('.')) {
      return <img src={question.image_emoji} alt="question image" className="w-40 h-40 object-contain drop-shadow-md" />
    }
    
    return <span className="text-[120px] leading-tight drop-shadow-md">{question.image_emoji}</span>
  }

  return (
    <div className="flex flex-col gap-6 w-full max-w-sm mx-auto">
      <Card className="p-8 flex flex-col items-center justify-center relative min-h-[260px] bg-white">
        <div className="flex-1 flex items-center justify-center animate-bounce-slight scale-in relative z-10">
            {renderImage()}
        </div>
        {question.hint && (
          <div className="w-full text-center mt-4 border-t border-pb-bg pt-3">
             <p className="text-sm font-bold text-pb-amber uppercase tracking-widest">{question.hint}</p>
          </div>
        )}
      </Card>

      <div className="grid grid-cols-2 gap-4">
        {options.map((option) => (
          <button
            key={option}
            type="button"
            onClick={() => handleSelect(option)}
            disabled={!!selected || disabled}
            className={cn(
              'rounded-box-lg px-2 py-6 min-h-[90px]',
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
