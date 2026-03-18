import { useState } from 'react'
import type { Question } from '../../types'

interface Props {
  question: Question
  onAnswer: (isCorrect: boolean) => void
  onNext: () => void
}

export function QuestionRenderer({ question, onAnswer, onNext }: Props) {
  const [selectedAnswer, setSelectedAnswer] = useState<string | null>(null)
  const [status, setStatus] = useState<'idle' | 'correct' | 'wrong'>('idle')
  
  // Derive answers securely only upon strict initialization per question key
  const [answers] = useState<string[]>(() => {
    const all = [question.correct_answer, ...question.wrong_answers]
    return all.sort(() => Math.random() - 0.5)
  })

  const handleSelect = (ans: string) => {
    if (status !== 'idle') return
    
    setSelectedAnswer(ans)
    const isCorrect = ans === question.correct_answer
    setStatus(isCorrect ? 'correct' : 'wrong')
    
    setTimeout(() => {
      onAnswer(isCorrect)
      onNext()
    }, 1200)
  }

  const renderContent = () => {
    if (question.type === 'image_match' && question.image_emoji) {
      return (
        <div className="flex flex-col items-center">
          <div className="text-8xl py-6 drop-shadow-md animate-bounce-short">{question.image_emoji}</div>
          <h2 className="text-xl font-bold mb-6 text-pb-text-light">{question.question_text}</h2>
        </div>
      )
    }
    
    if (question.type === 'listening') {
      return (
        <div className="flex flex-col items-center gap-6 py-4 mb-4">
          <button 
            className="w-28 h-28 rounded-full bg-pb-amber text-white shadow-box flex items-center justify-center text-5xl hover:scale-105 hover:shadow-box-hover active:scale-95 active:shadow-box-pressed transition-all focus-visible:outline-4 focus-visible:outline-pb-amber/50"
            onClick={() => {
              if ('speechSynthesis' in window) {
                const utterance = new SpeechSynthesisUtterance(question.question_text_tts || question.correct_answer)
                utterance.lang = 'es-ES' // Hardcoded Spanish for MVP
                utterance.rate = 0.9
                window.speechSynthesis.speak(utterance)
              }
            }}
          >
            🔊
          </button>
          <span className="text-pb-dark font-bold text-xl">{question.question_text}</span>
        </div>
      )
    }

    // Default 'multiple_choice' text
    return <h2 className="text-3xl font-bold mb-10 text-center text-pb-dark px-4">{question.question_text}</h2>
  }

  return (
    <div className="flex flex-col items-center w-full max-w-lg mx-auto animate-in fade-in slide-in-from-bottom-4 duration-300">
      {renderContent()}

      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 w-full mt-4">
        {answers.map((ans) => {
          const isSelected = selectedAnswer === ans
          const isCorrectAns = ans === question.correct_answer

          let btnClass = 'bg-white text-pb-dark shadow-box hover:-translate-y-1 hover:shadow-box-hover active:translate-y-0.5 active:shadow-box-pressed'
          
          if (status !== 'idle') {
            if (isCorrectAns) {
              btnClass = 'bg-pb-success text-white shadow-none translate-y-1 scale-105 transition-all ring-4 ring-pb-success/30 z-10'
            } else if (isSelected) {
              btnClass = 'bg-pb-error text-white shadow-none translate-y-1 opacity-90'
            } else {
              btnClass = 'bg-gray-100 text-gray-400 shadow-none opacity-60 pointer-events-none'
            }
          }

          return (
            <button
              key={ans}
              onClick={() => handleSelect(ans)}
              disabled={status !== 'idle'}
              className={`
                p-6 rounded-box font-bold text-xl transition-all duration-300 capitalize
                ${btnClass}
              `}
            >
              {ans}
            </button>
          )
        })}
      </div>
    </div>
  )
}
