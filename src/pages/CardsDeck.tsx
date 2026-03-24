import { useState, useMemo } from 'react'
import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { BackButton } from '../components/layout/BackButton'
import { FlashCard } from '../components/cards/FlashCard'
import { Button } from '../components/ui/Button'
import { Mascot } from '../components/ui/Mascot'
import { useWords } from '../hooks/useWords'

export default function CardsDeck() {
  const [currentIndex, setCurrentIndex] = useState(0)
  
  // Pobieramy słówka (nie określamy scenariusza, bierzemy z preferowanego przez użytkownika języka/poziomu)
  const { loading, getPersonalizedWords } = useWords()

  // Gdy hook pobierze słówka, losujemy spersonalizowany zestaw (np. 15 słówek)
  const cardWords = useMemo(() => {
    return getPersonalizedWords(15)
  }, [getPersonalizedWords])

  const handleNext = () => {
    if (currentIndex < cardWords.length - 1) {
      setCurrentIndex(prev => prev + 1)
    }
  }

  const handlePrev = () => {
    if (currentIndex > 0) {
      setCurrentIndex(prev => prev - 1)
    }
  }

  if (loading) {
    return (
      <PageTransition className="bg-pb-bg">
        <ScreenWrapper className="flex flex-col h-full py-6 pb-8 justify-center items-center min-h-[80vh]">
          <Mascot mood="idle" size="lg" />
          <h2 className="text-2xl font-bold mt-6 text-pb-dark animate-pulse">Cargando...</h2>
        </ScreenWrapper>
      </PageTransition>
    )
  }

  if (cardWords.length === 0) {
    return (
      <PageTransition className="bg-pb-bg">
        <ScreenWrapper className="flex flex-col h-full py-6 pb-8">
          <div className="flex items-center mb-8 z-10 w-full">
            <BackButton fallbackUrl="/menu" />
          </div>
          <div className="flex-1 flex justify-center items-center">
            <p className="text-xl text-pb-text-light text-center">Brak słówek w bazie.</p>
          </div>
        </ScreenWrapper>
      </PageTransition>
    )
  }

  const currentWord = cardWords[currentIndex]

  return (
    <PageTransition className="bg-pb-bg">
      <ScreenWrapper className="flex flex-col h-full py-6 pb-8">
        {/* Header Options */}
        <div className="flex items-center justify-between mb-8 z-10 w-full">
          <BackButton fallbackUrl="/menu" />
          <div className="bg-white px-5 py-2 rounded-full shadow-box font-bold flex items-center justify-center border-2 border-transparent">
            <span className="text-pb-dark text-xl mr-1">{currentIndex + 1}</span>
            <span className="text-pb-text-light">/ {cardWords.length}</span>
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
            disabled={currentIndex === cardWords.length - 1}
            className="flex-1 py-4 text-xl tracking-wider"
          >
            Siguiente
          </Button>
        </div>
      </ScreenWrapper>
    </PageTransition>
  )
}
