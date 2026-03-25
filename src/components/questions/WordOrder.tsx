import { useState, useCallback, useRef, useEffect, useMemo } from 'react'
import { motion } from 'framer-motion'
import {
  DndContext,
  closestCenter,
  KeyboardSensor,
  PointerSensor,
  TouchSensor,
  useSensor,
  useSensors,
  DragOverlay,
  type DragEndEvent,
  type DragStartEvent,
} from '@dnd-kit/core'
import {
  arrayMove,
  SortableContext,
  sortableKeyboardCoordinates,
  verticalListSortingStrategy,
} from '@dnd-kit/sortable'

import type { Question } from '../../types'
import { Button } from '../ui/Button'
import { SortableItemUI } from './SortableItemUI'
import { cn } from '../../utils/cn'

interface Props {
  question: Question
  onAnswer: (isCorrect: boolean) => void
  onPlaySound?: (type: 'click' | 'correct' | 'wrong') => void
  disabled?: boolean
  scenarioLanguage?: string | null
}

export function WordOrder({ question, onAnswer, onPlaySound, disabled }: Props) {
  const [answered, setAnswered] = useState(false)

  const wordList = useMemo(() => {
    // correct_answer is the sentence in correct order
    // wrong_answers contains the shuffled words as individual entries,
    // or we can split correct_answer into words and shuffle
    if (question.wrong_answers && question.wrong_answers.length > 0) {
      return question.wrong_answers
    }
    return question.correct_answer.split(' ')
  }, [question.correct_answer, question.wrong_answers])

  const shuffledRef = useRef<string[]>([])
  if (shuffledRef.current.length === 0) {
    shuffledRef.current = [...wordList].sort(() => Math.random() - 0.5)
  }

  const [items, setItems] = useState<string[]>(shuffledRef.current)
  const [activeId, setActiveId] = useState<string | null>(null)

  const sensors = useSensors(
    useSensor(PointerSensor, { activationConstraint: { distance: 5 } }),
    useSensor(TouchSensor, { activationConstraint: { delay: 150, tolerance: 5 } }),
    useSensor(KeyboardSensor, { coordinateGetter: sortableKeyboardCoordinates }),
  )

  useEffect(() => {
    shuffledRef.current = [...wordList].sort(() => Math.random() - 0.5)
    setItems(shuffledRef.current)
    setAnswered(false)
    setActiveId(null)
  }, [question.id, wordList])

  const handleDragStart = useCallback((event: DragStartEvent) => {
    setActiveId(event.active.id as string)
  }, [])

  const handleDragEnd = useCallback((event: DragEndEvent) => {
    const { active, over } = event
    setActiveId(null)
    if (over && active.id !== over.id) {
      setItems((prev) => {
        const oldIdx = prev.indexOf(active.id as string)
        const newIdx = prev.indexOf(over.id as string)
        return arrayMove(prev, oldIdx, newIdx)
      })
    }
  }, [])

  const handleSubmit = () => {
    if (answered || disabled) return
    setAnswered(true)
    const correct = items.join(' ') === question.correct_answer
    onPlaySound?.(correct ? 'correct' : 'wrong')
    setTimeout(() => onAnswer(correct), 900)
  }

  return (
    <div className="flex flex-col gap-4 w-full text-center flex-1">
      <div className="flex items-center justify-center min-h-16 py-2">
        <h2 className="text-xl sm:text-2xl font-black text-pb-dark leading-tight px-2 tracking-tight">
          {question.question_text || 'Ordena las palabras:'}
        </h2>
      </div>

      <div className={cn(
        "rounded-2xl p-3 transition-all duration-300 min-h-24",
        "bg-white/50 backdrop-blur-lg border-2 border-dashed",
        activeId ? "border-pb-amber/50 bg-amber-50/30" : "border-black/8"
      )}>
        <DndContext
          sensors={sensors}
          collisionDetection={closestCenter}
          onDragStart={handleDragStart}
          onDragEnd={handleDragEnd}
        >
          <SortableContext items={items} strategy={verticalListSortingStrategy}>
            <div className="flex flex-col gap-2">
              {items.map((word, index) => (
                <motion.div
                  key={word}
                  initial={{ opacity: 0, y: 8 }}
                  animate={{ opacity: 1, y: 0 }}
                  transition={{ delay: index * 0.04 }}
                >
                  <SortableItemUI id={word} disabled={answered || disabled}>
                    {word}
                  </SortableItemUI>
                </motion.div>
              ))}
            </div>
          </SortableContext>

          <DragOverlay>
            {activeId ? (
              <div className="bg-white backdrop-blur-xl rounded-xl px-5 py-3 font-bold text-base shadow-elevated ring-1 ring-pb-amber/30 scale-105 opacity-95">
                {activeId}
              </div>
            ) : null}
          </DragOverlay>
        </DndContext>
      </div>

      {answered && (
        <motion.div
          initial={{ opacity: 0, y: 8 }}
          animate={{ opacity: 1, y: 0 }}
          className={cn(
            "py-3 px-4 rounded-xl text-sm font-bold",
            items.join(' ') === question.correct_answer
              ? "bg-emerald-50 text-pb-success ring-1 ring-pb-success/20"
              : "bg-red-50 text-pb-error ring-1 ring-pb-error/20"
          )}
        >
          {items.join(' ') === question.correct_answer
            ? '¡Correcto!'
            : `Respuesta: ${question.correct_answer}`}
        </motion.div>
      )}

      <div className="mt-auto pt-2">
        <Button
          onClick={handleSubmit}
          disabled={answered || disabled}
          className="w-full"
        >
          COMPROBAR
        </Button>
      </div>
    </div>
  )
}
