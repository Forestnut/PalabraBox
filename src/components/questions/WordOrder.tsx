import { useState, useMemo } from 'react'
import { motion } from 'framer-motion'
import type { Question } from '../../types'
import { Card } from '../ui/Card'
import { Button } from '../ui/Button'
import { SortableItemUI } from './SortableItemUI'
import { shuffleArray } from '../../utils/shuffle'
import type { ClickSoundType } from './MultipleChoice'

interface WordOrderProps {
  question: Question
  onAnswer: (isCorrect: boolean) => void
  onPlaySound?: (type: ClickSoundType) => void
  disabled?: boolean
}

interface WordObj {
  id: string
  word: string
}

export function WordOrder({ question, onAnswer, onPlaySound, disabled }: WordOrderProps) {
  // Rozbijamy prawidłowe zdanie na tablicę stringów
  const correctWords = useMemo(() => question.correct_answer.split(' '), [question.correct_answer])
  
  // Łączymy z dystraktorami. Mapujemy na obiekt z unikalnym ID po to aby layoutId z Framera 
  // widziało je jako te same divy gdy klikamy i skaczą one miedzy listami.
  const allWordObjects = useMemo<WordObj[]>(() => {
    const rawWords = shuffleArray([...correctWords, ...(question.wrong_answers || [])])
    return rawWords.map((w, i) => ({ id: `word-${i}-${w}`, word: w }))
  }, [correctWords, question.wrong_answers])

  // Roboczy stany: Bank to dolne wycięcia, dropZone to górny pojemnik.
  const [bank, setBank] = useState<WordObj[]>(allWordObjects)
  const [dropZone, setDropZone] = useState<WordObj[]>([])
  const [isChecking, setIsChecking] = useState(false)

  // Kliknięcie Puzzla z Banku - przenosi do strefy rzutu
  const handleMoveToDropZone = (item: WordObj, index: number) => {
    if (disabled || isChecking) return
    const newBank = [...bank]
    newBank.splice(index, 1)
    setBank(newBank)
    setDropZone([...dropZone, item])
    onPlaySound?.('click')
  }

  // Kliknięcie Puzzla ze strefy rzutu - oddaje do banku
  const handleMoveToBank = (item: WordObj, index: number) => {
    if (disabled || isChecking) return
    const newDrop = [...dropZone]
    newDrop.splice(index, 1)
    setDropZone(newDrop)
    setBank([...bank, item])
    onPlaySound?.('click')
  }

  const handleCheck = () => {
    if (disabled || isChecking || dropZone.length !== correctWords.length) return
    setIsChecking(true)
    
    const isCorrect = dropZone.map(d => d.word).join(' ') === question.correct_answer
    onPlaySound?.(isCorrect ? 'correct' : 'wrong')
    
    // Wizualne odczekanie na animację po sprawdzeniu (dla testów u Jakuba)
    setTimeout(() => {
      onAnswer(isCorrect)
      setIsChecking(false)
    }, 1500)
  }

  return (
    <div className="flex flex-col gap-6 w-full max-w-lg mx-auto h-full px-2">
      {/* 
         STREFA RZUTU (DROP ZONE MOCKUP)
         Tutaj Jakubowi z dnd-kit powinno wkroczyć <SortableContext> i wypluwać SortableItemy...
      */}
      <Card className="p-6 flex flex-col items-center justify-center relative min-h-[220px] bg-white mt-4 border-dashed border-4 border-pb-bg">
        <div className="w-full flex flex-col items-center mb-6 border-b-2 border-pb-bg pb-4">
          <span className="text-xl font-bold text-pb-dark text-center leading-tight">
             {question.question_text || "Ordena la frase"}
          </span>
          {question.hint && (
            <span className="text-xs font-bold text-pb-text-light uppercase tracking-wider mt-2">
               {question.hint}
            </span>
          )}
        </div>

        <div className="flex flex-wrap gap-3 w-full min-h-[100px] items-center justify-center content-start">
          {dropZone.map((item, i) => (
             <motion.div layoutId={item.id} key={item.id}>
               <SortableItemUI 
                 word={item.word} 
                 onClick={() => handleMoveToBank(item, i)}
               />
             </motion.div>
          ))}
          {dropZone.length === 0 && (
             <span className="text-pb-text-light/50 font-bold uppercase tracking-widest text-sm text-center">
               Arrastra los bloques aquí
             </span>
          )}
        </div>
      </Card>

      {/* 
         STREFA BANKU (DRAGGABLES SOURCE)
      */}
      <div className="flex-1 flex flex-col justify-end gap-6 mb-4 mt-auto pt-6">
        <div className="flex flex-wrap justify-center gap-3 min-h-[120px] content-end">
          {bank.map((item, i) => (
            <motion.div layoutId={item.id} key={item.id}>
              <SortableItemUI 
                word={item.word} 
                onClick={() => handleMoveToDropZone(item, i)}
              />
            </motion.div>
          ))}
        </div>
        
        <Button 
          size="lg" 
          disabled={isChecking || dropZone.length !== correctWords.length} 
          onClick={handleCheck}
          className="w-full mt-4"
        >
          COMPROBAR
        </Button>
      </div>
    </div>
  )
}
