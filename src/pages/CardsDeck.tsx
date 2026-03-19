import { useState } from 'react'
import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { BackButton } from '../components/layout/BackButton'
import { FlashCard } from '../components/cards/FlashCard'
import { Button } from '../components/ui/Button'
import type { Word } from '../types'

// Mock Data for UI/UX testing before Jakub builds `useWords` integration (TASK-J6)
const MOCK_WORDS: Word[] = [
  { id: '1', word: 'manzana', language: 'spanish', level: 'beginner', category: 'comida', translation_es: null, translation_en: 'apple', image_emoji: '🍎', audio_text: 'manzana' },
  { id: '2', word: 'perro', language: 'spanish', level: 'beginner', category: 'animales', translation_es: null, translation_en: 'dog', image_emoji: '🐶', audio_text: 'perro' },
  { id: '3', word: 'casa', language: 'spanish', level: 'beginner', category: 'objetos', translation_es: null, translation_en: 'house', image_emoji: '🏠', audio_text: 'casa' },
  { id: '4', word: 'coche', language: 'spanish', level: 'beginner', category: 'transporte', translation_es: null, translation_en: 'car', image_emoji: '🚗', audio_text: 'coche' },
]

export default function CardsDeck() {
  const [currentIndex, setCurrentIndex] = useState(0)

  const handleNext = () => {
    if (currentIndex < MOCK_WORDS.length - 1) {
      setCurrentIndex(prev => prev + 1)
    }
  }

  const handlePrev = () => {
    if (currentIndex > 0) {
      setCurrentIndex(prev => prev - 1)
    }
  }

  const currentWord = MOCK_WORDS[currentIndex]

  return (
    <PageTransition className="bg-pb-bg">
      <ScreenWrapper className="flex flex-col h-full py-6 pb-8">
        {/* Header Options */}
        <div className="flex items-center justify-between mb-8 z-10 w-full">
          <BackButton />
          <div className="bg-white px-5 py-2 rounded-full shadow-box font-bold flex items-center justify-center border-2 border-transparent">
            <span className="text-pb-dark text-xl mr-1">{currentIndex + 1}</span> 
            <span className="text-pb-text-light">/ {MOCK_WORDS.length}</span>
          </div>
        </div>

        {/* Card Component Rendering Centered */}
        <div className="flex-1 flex flex-col justify-center items-center w-full z-0 px-2 sm:px-4 perspective-1000">
          <FlashCard key={currentWord.id} word={currentWord} />
        </div>

        {/* Navigation Controlls */}
        <div className="flex items-center justify-between mt-8 gap-4 z-10 w-full px-2">
          <Button 
            variant="secondary" 
            onClick={handlePrev} 
            disabled={currentIndex === 0}
            className="w-16 h-16 rounded-full p-0 flex items-center justify-center text-3xl shrink-0"
            aria-label="Anterior Tarjeta"
          >
            ◀
          </Button>
          <Button 
            onClick={handleNext} 
            disabled={currentIndex === MOCK_WORDS.length - 1}
            className="flex-1 py-4 text-xl tracking-wider"
          >
            Siguiente
          </Button>
        </div>
      </ScreenWrapper>
    </PageTransition>
  )
}
