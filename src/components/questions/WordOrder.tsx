import { useState, useMemo } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import {
  DndContext,
  closestCenter,
  KeyboardSensor,
  useSensor,
  useSensors,
  DragOverlay,
  defaultDropAnimationSideEffects,
  useDroppable,
  MouseSensor,
  TouchSensor,
} from '@dnd-kit/core'
import {
  arrayMove,
  SortableContext,
  sortableKeyboardCoordinates,
  rectSortingStrategy,
  useSortable
} from '@dnd-kit/sortable'
import { CSS } from '@dnd-kit/utilities'

import type { Question } from '../../types'
import { Card } from '../ui/Card'
import { Button } from '../ui/Button'
import { SortableItemUI } from './SortableItemUI'
import { shuffleArray } from '../../utils/shuffle'
import { speechService } from '../../services/speechService'

interface WordOrderProps {
  question: Question
  onAnswer: (isCorrect: boolean) => void
  onPlaySound?: (type: 'click' | 'correct' | 'wrong') => void
  disabled?: boolean
  scenarioLanguage?: string | null
}

interface WordObj {
  id: string
  word: string
}

function SortableWord({ wordObj, onClick }: { wordObj: WordObj; onClick: () => void }) {
  const {
    attributes,
    listeners,
    setNodeRef,
    transform,
    transition,
    isDragging,
  } = useSortable({ id: wordObj.id })

  const style = {
    transform: CSS.Transform.toString(transform),
    transition,
    zIndex: isDragging ? 10 : 1,
    opacity: isDragging ? 0 : 1,
  }

  return (
    <div ref={setNodeRef} style={style} className="relative group">
      <div {...attributes} {...listeners}>
        <SortableItemUI 
          word={wordObj.word} 
          isDragging={isDragging} 
          onClick={() => {
            if (!isDragging) {
               onClick()
            }
          }} 
        />
      </div>
    </div>
  )
}

export function WordOrder({ question, onAnswer, onPlaySound, disabled, scenarioLanguage }: WordOrderProps) {
  const correctWords = useMemo(() => question.correct_answer.split(' '), [question.correct_answer])

  const allWordObjects = useMemo<WordObj[]>(() => {
    const rawWords = shuffleArray([...correctWords, ...(question.wrong_answers || [])])
    return rawWords.map((w, i) => ({ id: `word-${i}-${w}`, word: w }))
  }, [correctWords, question.wrong_answers])

  const [bank, setBank] = useState<WordObj[]>(allWordObjects)
  const [dropZone, setDropZone] = useState<WordObj[]>([])
  const [isChecking, setIsChecking] = useState(false)
  const [activeId, setActiveId] = useState<string | null>(null)

  const { setNodeRef: setBankNodeRef } = useDroppable({
    id: 'bank-droppable',
  })

  const sensors = useSensors(
    useSensor(MouseSensor, {
      activationConstraint: {
        distance: 10,
      },
    }),
    useSensor(TouchSensor, {
      activationConstraint: {
        delay: 150,
        tolerance: 5,
      },
    }),
    useSensor(KeyboardSensor, {
      coordinateGetter: sortableKeyboardCoordinates,
    })
  )

  const handleMoveToDropZone = (item: WordObj, index: number) => {
    if (disabled || isChecking) return
    const newBank = [...bank]
    newBank.splice(index, 1)
    setBank(newBank)
    setDropZone([...dropZone, item])
    onPlaySound?.('click')
  }

  const handleMoveToBank = (item: WordObj) => {
    if (disabled || isChecking) return
    setDropZone(dropZone.filter((x) => x.id !== item.id))
    setBank([...bank, item])
    onPlaySound?.('click')
  }

  const handleDragStart = (event: { active: { id: string | number } }) => {
    setActiveId(String(event.active.id))
    onPlaySound?.('click')
  }

  const handleDragEnd = (event: { active: { id: string | number }; over: { id: string | number } | null }) => {
    const { active, over } = event
    setActiveId(null)

    if (!over || over.id === 'bank-droppable') {
      const draggedItem = dropZone.find(i => i.id === active.id)
      if (draggedItem) {
        handleMoveToBank(draggedItem)
      }
      return
    }

    if (active.id !== over.id) {
      setDropZone((items) => {
        const oldIndex = items.findIndex((i) => i.id === active.id)
        const newIndex = items.findIndex((i) => i.id === over.id)
        return arrayMove(items, oldIndex, newIndex)
      })
      onPlaySound?.('click')
    }
  }

  const handleDragCancel = () => {
    setActiveId(null)
  }

  const handleCheck = () => {
    if (disabled || isChecking || dropZone.length === 0) return
    setIsChecking(true)
    
    // Ignore punctuation, casing and extra spaces 
    const sanitizeString = (str: string) => 
      str.replace(/[.,!?¡¿""'']/g, '').toLowerCase().trim()

    const currentSentence = dropZone.map(d => sanitizeString(d.word)).join(' ')
    const correctClean = sanitizeString(question.correct_answer).split(' ').join(' ') // ensuring multiple spaces are handled basically the same
    
    const isCorrect = currentSentence === correctClean
    
    if (isCorrect) {
      const ttsLang = scenarioLanguage === 'english' ? 'en-US' : 'es-ES'
      speechService.speak(question.question_text_tts || currentSentence, ttsLang)
    }

    onPlaySound?.(isCorrect ? 'correct' : 'wrong')
    
    setTimeout(() => {
      onAnswer(isCorrect)
      setIsChecking(false)
    }, 1500)
  }

  const activeWordObj = useMemo(
    () => dropZone.find((item) => item.id === activeId),
    [activeId, dropZone]
  )

  const dropAnimation = {
    sideEffects: defaultDropAnimationSideEffects({
      styles: { active: { opacity: "0" } },
    }),
  }

  // Extract quoted text if present to highlight it better
  const renderQuestionText = () => {
    const text = question.question_text || "Ordena la frase"
    const match = text.match(/^(.*?):\s*"(.*?)"$/)
    
    if (match) {
      return (
        <div className="flex flex-col items-center w-full">
          <span className="text-xs sm:text-sm font-semibold tracking-wider text-pb-text-light uppercase mb-2 sm:mb-3 text-center">
            Traduce al inglés:
          </span>
          <span className="text-xl sm:text-2xl font-black text-pb-dark text-center leading-tight sm:leading-snug wrap-break-word w-full">
            "{match[2]}"
          </span>
        </div>
      )
    }
    
    return (
      <div className="flex flex-col items-center w-full">
        <span className="text-xs sm:text-sm font-semibold tracking-wider text-pb-text-light uppercase mb-2 sm:mb-3 text-center">
          Traduce al inglés:
        </span>
        <span className="text-lg sm:text-xl font-bold text-pb-dark text-center leading-tight sm:leading-snug wrap-break-word w-full">
          {text}
        </span>
      </div>
    )
  }

  return (
    <DndContext
      sensors={sensors}
      collisionDetection={closestCenter}
      onDragStart={handleDragStart}
      onDragEnd={handleDragEnd}
      onDragCancel={handleDragCancel}
    >
      <div className="flex flex-col gap-4 sm:gap-6 w-full max-w-2xl mx-auto h-full px-2 sm:px-4">
        <Card className="p-4 sm:p-6 flex flex-col items-center justify-center relative min-h-56 sm:min-h-55 bg-slate-50/40 sm:mt-4 border-dashed border-[3px] sm:border-4 border-slate-200/80 shadow-sm">
          <div className="w-full flex flex-col items-center mb-4 sm:mb-6 border-b-2 border-slate-200/60 pb-3 sm:pb-4">
            {renderQuestionText()}
            {question.hint && (
              <span className="text-[10px] sm:text-xs font-bold text-pb-primary uppercase tracking-wider mt-3 bg-indigo-50 px-3.5 py-1.5 rounded-full border border-indigo-100/50 shadow-sm">
                {question.hint}
              </span>
            )}
          </div>

          <SortableContext items={dropZone.map(d => d.id)} strategy={rectSortingStrategy}>
            <div className="flex flex-wrap gap-2.5 sm:gap-3 w-full min-h-28 items-center justify-center content-start">
              {dropZone.map((item) => (
                 <SortableWord 
                   key={item.id} 
                   wordObj={item} 
                   onClick={() => handleMoveToBank(item)} 
                 />
              ))}
              {dropZone.length === 0 && (
                 <span className="text-slate-400/80 font-bold uppercase tracking-widest text-[13px] sm:text-sm text-center px-4 w-full mt-4">
                   Arrastra los bloques aquí
                 </span>
              )}
            </div>
          </SortableContext>
        </Card>

        {/* BANK - Click to add to dropZone or Drag to move back */}
        <div ref={setBankNodeRef} className="flex-1 flex flex-col justify-end gap-5 sm:gap-6 mb-2 sm:mb-4 mt-auto pt-4 sm:pt-6">
          <div className="flex flex-wrap justify-center gap-2.5 sm:gap-3 min-h-32 shadow-inner-none content-end">
            <AnimatePresence>
              {bank.map((item, i) => (
                <motion.div 
                  layoutId={item.id} 
                  key={item.id}
                  initial={{ opacity: 0, scale: 0.8 }}
                  animate={{ opacity: 1, scale: 1 }}
                  exit={{ opacity: 0, scale: 0.8 }}
                  transition={{ type: "spring", stiffness: 400, damping: 25 }}
                >
                  <SortableItemUI 
                    word={item.word} 
                    onClick={() => handleMoveToDropZone(item, i)}
                  />
                </motion.div>
              ))}
            </AnimatePresence>
          </div>
          
          <Button 
            size="lg" 
            disabled={isChecking || dropZone.length === 0} 
            onClick={handleCheck}
            className="w-full mt-2 sm:mt-4 shadow-sm hover:shadow-md transition-shadow"
          >
            COMPROBAR
          </Button>
        </div>
      </div>
      
      <DragOverlay dropAnimation={dropAnimation}>
        {activeWordObj ? (
          <SortableItemUI word={activeWordObj.word} isDragging={true} /> 
        ) : null}
      </DragOverlay>
    </DndContext>
  )
}
