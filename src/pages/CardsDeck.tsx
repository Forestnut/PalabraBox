import { useState, useEffect, useCallback } from 'react'
import { useNavigate } from 'react-router-dom'
import { motion, AnimatePresence } from 'framer-motion'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faChevronLeft, faChevronRight } from '@fortawesome/free-solid-svg-icons'

import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { BackButton } from '../components/layout/BackButton'
import { FlashCard } from '../components/cards/FlashCard'
import { useSettingsStore } from '../store/settingsStore'
import { useWords } from '../hooks/useWords'

export default function CardsDeck() {
  const navigate = useNavigate()
  const { learningLanguage, learningLevel } = useSettingsStore()
  const { words, loading } = useWords()
  const [currentIndex, setCurrentIndex] = useState(0)
  const [direction, setDirection] = useState(0) // -1 left, 1 right

  useEffect(() => {
    if (!learningLanguage || !learningLevel) {
      navigate('/language', { replace: true })
    }
  }, [learningLanguage, learningLevel, navigate])

  const prev = useCallback(() => {
    if (currentIndex <= 0) return
    setDirection(-1)
    setCurrentIndex((i) => i - 1)
  }, [currentIndex])

  const next = useCallback(() => {
    if (currentIndex >= words.length - 1) return
    setDirection(1)
    setCurrentIndex((i) => i + 1)
  }, [currentIndex, words.length])

  if (loading) {
    return (
      <PageTransition>
        <ScreenWrapper className="flex flex-col items-center justify-center">
          <div className="animate-pulse flex flex-col items-center gap-4">
            <div className="w-72 h-96 rounded-3xl bg-white/50 shadow-soft" />
            <div className="h-4 w-24 bg-black/4 rounded-lg" />
          </div>
        </ScreenWrapper>
      </PageTransition>
    )
  }

  if (words.length === 0) {
    return (
      <PageTransition>
        <ScreenWrapper className="flex flex-col items-center justify-center">
          <BackButton fallbackUrl="/menu" />
          <p className="mt-4 text-center font-bold text-pb-text-light text-base">
            No se encontraron tarjetas.
          </p>
        </ScreenWrapper>
      </PageTransition>
    )
  }

  const currentWord = words[currentIndex]

  return (
    <PageTransition>
      <ScreenWrapper className="flex flex-col items-center gap-4 py-6">
        <div className="w-full flex items-center justify-between mb-4">
          <BackButton fallbackUrl="/menu" />
          <div className="bg-white/70 backdrop-blur-sm px-4 py-1.5 rounded-full shadow-soft ring-1 ring-black/4 font-bold text-pb-amber text-sm">
            {currentIndex + 1} / {words.length}
          </div>
        </div>

        <div className="flex-1 flex items-center justify-center w-full overflow-hidden py-2">
          <AnimatePresence mode="wait" custom={direction}>
            <motion.div
              key={currentWord.id}
              custom={direction}
              initial={{ opacity: 0, x: direction * 60 }}
              animate={{ opacity: 1, x: 0 }}
              exit={{ opacity: 0, x: direction * -60 }}
              transition={{ duration: 0.25, ease: 'easeOut' }}
              className="w-full"
            >
              <FlashCard word={currentWord} />
            </motion.div>
          </AnimatePresence>
        </div>

        <div className="flex items-center justify-center gap-6 mt-2">
          <button
            onClick={prev}
            disabled={currentIndex <= 0}
            className="w-14 h-14 rounded-full flex items-center justify-center bg-white/70 backdrop-blur-lg shadow-soft ring-1 ring-black/4 text-pb-dark transition-all hover:bg-white/90 hover:shadow-glass active:scale-95 disabled:opacity-30 disabled:cursor-not-allowed cursor-pointer"
          >
            <FontAwesomeIcon icon={faChevronLeft} className="text-base" />
          </button>

          <button
            onClick={next}
            disabled={currentIndex >= words.length - 1}
            className="w-14 h-14 rounded-full flex items-center justify-center bg-white/70 backdrop-blur-lg shadow-soft ring-1 ring-black/4 text-pb-dark transition-all hover:bg-white/90 hover:shadow-glass active:scale-95 disabled:opacity-30 disabled:cursor-not-allowed cursor-pointer"
          >
            <FontAwesomeIcon icon={faChevronRight} className="text-base" />
          </button>
        </div>
      </ScreenWrapper>
    </PageTransition>
  )
}
