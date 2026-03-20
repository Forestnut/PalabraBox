import { useState, useMemo, useRef, useEffect } from 'react'
import { motion } from 'framer-motion'
import type { Question } from '../../types'
import { Card } from '../ui/Card'
import { Button } from '../ui/Button'
import { cn } from '../../utils/cn'
import { shuffleArray } from '../../utils/shuffle'
import { speechService } from '../../services/speechService'
import type { ClickSoundType } from './MultipleChoice'

interface FillInBlankProps {
  question: Question
  onAnswer: (isCorrect: boolean) => void
  onPlaySound?: (type: ClickSoundType) => void
  disabled?: boolean
  scenarioLanguage?: string | null
}

export function FillInBlank({ question, onAnswer, onPlaySound, disabled, scenarioLanguage }: FillInBlankProps) {
  // Format expected: "Yo ____ una manzana." where "____" is the blank.
  const parts = (question.question_text || '').split('____')
  const beforeBlank = parts[0] || ''
  const afterBlank = parts[1] || ''

  const [selectedWord, setSelectedWord] = useState<string | null>(null)
  const [isChecking, setIsChecking] = useState(false)
  const [feedback, setFeedback] = useState<'correct'|'wrong'|null>(null)
  const answerTimeoutRef = useRef<number | null>(null)

  const wordsBank = useMemo(() => {
    return shuffleArray([question.correct_answer, ...question.wrong_answers])
  }, [question.correct_answer, question.wrong_answers])

  useEffect(() => {
    return () => {
      if (answerTimeoutRef.current) window.clearTimeout(answerTimeoutRef.current)
    }
  }, [])

  const handleSelectWord = (word: string) => {
    if (disabled || isChecking) return
    if (selectedWord === word) {
      setSelectedWord(null) // deselect
      onPlaySound?.('click')
    } else {
      setSelectedWord(word)
      onPlaySound?.('click')
    }
  }

  const handleCheck = () => {
    if (!selectedWord || disabled || isChecking) return

    setIsChecking(true)
    const isCorrect = selectedWord === question.correct_answer
    setFeedback(isCorrect ? 'correct' : 'wrong')
    
    if (isCorrect) {
      const fullSentence = question.question_text?.replace('____', selectedWord) || selectedWord
      const ttsLang = scenarioLanguage === 'english' ? 'en-US' : 'es-ES'
      speechService.speak(question.question_text_tts || fullSentence, ttsLang)
    }
    
    onPlaySound?.(isCorrect ? 'correct' : 'wrong')

    answerTimeoutRef.current = window.setTimeout(() => {
      onAnswer(isCorrect)
      setSelectedWord(null)
      setFeedback(null)
      setIsChecking(false)
    }, 1500)
  }

  const blankStateClass = selectedWord 
    ? feedback === 'correct' 
      ? 'bg-pb-success border-pb-success border-b-[4px] text-white translate-y-[-2px]' 
      : feedback === 'wrong' 
        ? 'bg-pb-error border-pb-error border-b-[4px] text-white translate-y-[-2px]' 
        : 'bg-pb-amber border-pb-amber border-b-[4px] text-white translate-y-[-2px]'
    : 'bg-pb-bg border-pb-text-light/30 border-dashed text-transparent'

  return (
    <div className="flex flex-col gap-6 w-full max-w-lg mx-auto h-full px-2">
      <Card className="p-6 sm:p-8 flex flex-col items-center justify-center relative min-h-45 bg-white mt-4">
        <div className="flex flex-wrap items-center justify-center gap-x-2 gap-y-4 text-xl sm:text-2xl font-bold text-pb-dark text-center leading-loose">
          <span>{beforeBlank}</span>
          
          <div 
            className={cn(
              "relative min-w-25 h-12 rounded-xl border-2 flex items-center justify-center px-4 transition-colors cursor-pointer",
              blankStateClass
            )}
            onClick={() => {
               if (selectedWord && !isChecking) {
                  setSelectedWord(null)
                  onPlaySound?.('click')
               }
            }}
          >
            {selectedWord ? (
              <motion.span 
                layoutId={`word-${selectedWord}`} 
                className="font-black text-xl"
              >
                {selectedWord}
              </motion.span>
            ) : (
              "____"
            )}
          </div>

          <span>{afterBlank}</span>
        </div>
        
        {question.hint && (
          <div className="w-full text-center mt-6 border-t border-pb-bg pt-3">
             <p className="text-sm font-bold text-pb-text-light">{question.hint}</p>
          </div>
        )}
      </Card>

      {/* Word Bank Area */}
      <div className="flex-1 flex flex-col justify-end gap-6 mb-4 mt-auto pt-6">
        <div className="flex flex-wrap justify-center gap-3">
          {wordsBank.map(word => {
            const isSelected = selectedWord === word
            return (
              <div key={word} className="relative h-14 min-w-30">
                {/* Ghost placeholder when the word is dropped in the blank */}
                <div className={cn(
                  "absolute inset-0 bg-pb-bg rounded-xl border-2 border-pb-text-light/20 flex items-center justify-center transition-opacity duration-300",
                  isSelected ? "opacity-100" : "opacity-0"
                )} />

                {!isSelected && (
                  <motion.button
                    layoutId={`word-${word}`}
                    onClick={() => handleSelectWord(word)}
                    disabled={isChecking || disabled}
                    className="absolute inset-0 bg-white border-2 border-b-4 border-slate-200 rounded-2xl text-lg font-bold text-pb-dark flex items-center justify-center px-6 hover:bg-slate-50 transition-colors z-10"
                    whileHover={{ scale: 1.02 }}
                    whileTap={{ scale: 0.98, y: 2, borderBottomWidth: '2px' }}
                  >
                    {word}
                  </motion.button>
                )}
              </div>
            )
          })}
        </div>
        
        <Button 
          size="lg" 
          disabled={!selectedWord || isChecking} 
          onClick={handleCheck}
          className="w-full mt-4"
        >
          COMPROBAR
        </Button>
      </div>
    </div>
  )
}
