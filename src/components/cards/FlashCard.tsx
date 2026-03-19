import { useState, useEffect } from 'react'
import type { Word } from '../../types'
import { cn } from '../../utils/cn'

interface FlashCardProps {
  word: Word
}

export function FlashCard({ word }: FlashCardProps) {
  const [isFlipped, setIsFlipped] = useState(false)

  // Reset flip state when the word changes to prevent showing the back by default
  useEffect(() => {
    setIsFlipped(false)
  }, [word.id])

  return (
    <div 
      className="w-full max-w-sm aspect-[3/4] [perspective:1000px] mx-auto cursor-pointer group"
      onClick={() => setIsFlipped(!isFlipped)}
    >
      <div className={cn(
        "relative w-full h-full transition-all duration-500 [transform-style:preserve-3d]",
        isFlipped && "[transform:rotateY(180deg)]"
      )}>
        {/* Front */}
        <div className="absolute inset-0 w-full h-full bg-white rounded-3xl shadow-box border-4 border-pb-bg flex flex-col items-center justify-center p-6 [backface-visibility:hidden]">
          <span className="text-[120px] leading-none mb-6 drop-shadow-md">{word.image_emoji || '❓'}</span>
          <h2 className="text-4xl font-black text-pb-dark mb-2 text-center">{word.word}</h2>
          <span className="text-pb-amber font-bold text-sm tracking-widest uppercase">{word.category}</span>
          
          <div className="absolute bottom-6 flex flex-col items-center opacity-40">
            <span className="text-2xl animate-bounce">👆</span>
            <p className="text-pb-text-light text-xs font-bold uppercase tracking-widest">Toca para voltear</p>
          </div>
        </div>

        {/* Back */}
        <div className="absolute inset-0 w-full h-full bg-pb-amber rounded-3xl shadow-box border-4 border-pb-amber flex flex-col items-center justify-center p-6 [backface-visibility:hidden] [transform:rotateY(180deg)] text-white">
          <span className="text-xl font-bold opacity-80 mb-2">Traducción</span>
          <h2 className="text-5xl font-black mb-8 text-center">{word.translation_es || word.translation_en || '...'}</h2>
          
          <button 
            onClick={(e) => {
              e.stopPropagation() // Prevent card flip when clicking the audio button
              // TODO: Integrate TTS inside TASK-J5
            }}
            className="w-16 h-16 rounded-full bg-white text-pb-amber flex items-center justify-center text-3xl shadow-md hover:scale-105 active:scale-95 transition-all"
            aria-label="Escuchar pronunciación"
          >
            🔊
          </button>
        </div>
      </div>
    </div>
  )
}
