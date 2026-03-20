import { useState } from 'react'
import type { Word } from '../../types'
import { cn } from '../../utils/cn'
import { speechService } from '../../services/speechService'

interface FlashCardProps {
  word: Word
}

export function FlashCard({ word }: FlashCardProps) {
  const [isFlipped, setIsFlipped] = useState(false)

  // Determine which text is which
  const isEnglishPackage = word.language === 'english'
  
  // Spanish is ALWAYS front.
  const spanishText = isEnglishPackage ? (word.translation_es || '...') : word.word
  const spanishAudio = isEnglishPackage ? (word.translation_es || '...') : (word.audio_text || word.word)

  // English is ALWAYS back.
  const englishText = isEnglishPackage ? word.word : (word.translation_en || '...')
  const englishAudio = isEnglishPackage ? (word.audio_text || word.word) : (word.translation_en || '...')

  return (
    <div 
      className="w-full max-w-sm aspect-3/4 perspective-[1000px] mx-auto cursor-pointer group"
      onClick={() => setIsFlipped(!isFlipped)}
    >
      <div className={cn(
        "relative w-full h-full transition-all duration-500 transform-3d",
        isFlipped && "transform-[rotateY(180deg)]"
      )}>
        {/* Front - Spanish */}
        <div className="absolute inset-0 w-full h-full bg-white rounded-3xl shadow-box border-4 border-pb-bg flex flex-col items-center justify-center p-6 backface-hidden">
          <span className="text-[120px] leading-none mb-6 drop-shadow-md">{word.image_emoji || '❓'}</span>
          
          <h2 className="text-4xl font-black text-pb-dark mb-2 text-center">{spanishText}</h2>
          <span className="text-pb-amber font-bold text-sm tracking-widest uppercase mb-4">{word.category}</span>
          
          <button 
            onClick={(e) => {
              e.stopPropagation() 
              speechService.speak(spanishAudio, 'es-ES')
            }}
            className="w-12 h-12 rounded-full bg-pb-bg text-pb-amber flex items-center justify-center text-2xl shadow-md hover:scale-105 active:scale-95 transition-all z-10"
            aria-label="Escuchar en español"
          >
            🔊
          </button>
          
          <div className="absolute bottom-6 flex flex-col items-center opacity-40">
            <span className="text-2xl animate-bounce">👆</span>
            <p className="text-pb-text-light text-xs font-bold uppercase tracking-widest">Toca para voltear</p>
          </div>
        </div>

        {/* Back - English */}
        <div className="absolute inset-0 w-full h-full bg-pb-amber rounded-3xl shadow-box border-4 border-pb-amber flex flex-col items-center justify-center p-6 backface-hidden transform-[rotateY(180deg)] text-white">
          <span className="text-xl font-bold opacity-80 mb-2">Traducción</span>
          <h2 className="text-5xl font-black mb-8 text-center">{englishText}</h2>
          
          <button 
            onClick={(e) => {
              e.stopPropagation()
              speechService.speak(englishAudio, 'en-US')
            }}
            className="w-16 h-16 rounded-full bg-white text-pb-amber flex items-center justify-center text-3xl shadow-md hover:scale-105 active:scale-95 transition-all z-10"
            aria-label="Escuchar en inglés"
          >
            🔊
          </button>
        </div>
      </div>
    </div>
  )
}
