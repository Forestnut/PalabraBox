import { useState } from 'react'
import { motion } from 'framer-motion'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faVolumeHigh, faRotate } from '@fortawesome/free-solid-svg-icons'
import { speechService } from '../../services/speechService'
import { useSettingsStore } from '../../store/settingsStore'
import type { Word } from '../../types'
import { cn } from '../../utils/cn'

interface FlashCardProps {
  word: Word
}

export function FlashCard({ word }: FlashCardProps) {
  const [flipped, setFlipped] = useState(false)
  const speechSpeed = useSettingsStore((s) => s.speechSpeed)

  const handlePlayAudio = (e: React.MouseEvent) => {
    e.stopPropagation()
    const text = word.audio_text || word.word
    speechService.speak(text, 'en-US', speechSpeed)
  }

  const emoji = word.image_emoji
  const translation = word.translation_es || word.translation_en || ''

  return (
    <div
      className="w-full max-w-sm mx-auto perspective-midrange cursor-pointer select-none"
      onClick={() => setFlipped(!flipped)}
    >
      <motion.div
        className="relative w-full aspect-4/5 preserve-3d"
        animate={{ rotateY: flipped ? 180 : 0 }}
        transition={{ duration: 0.5, ease: [0.4, 0, 0.2, 1] }}
        style={{ transformStyle: 'preserve-3d' }}
      >
        {/* Front */}
        <div
          className={cn(
            'absolute inset-0 backface-hidden rounded-3xl',
            'bg-white/80 backdrop-blur-xl p-6 sm:p-8',
            'shadow-elevated ring-1 ring-black/4',
            'flex flex-col items-center justify-center gap-4',
          )}
          style={{ backfaceVisibility: 'hidden' }}
        >
          {emoji && <span className="text-5xl sm:text-6xl mb-2">{emoji}</span>}
          
          <h2 className="text-3xl sm:text-4xl font-black text-pb-dark tracking-tight">
            {word.word}
          </h2>

          <motion.button
            onClick={handlePlayAudio}
            className="mt-2 w-14 h-14 rounded-full bg-linear-to-b from-[#0a8a5e] to-pb-emerald text-white flex items-center justify-center shadow-[0_4px_0_0_#035c3a] active:shadow-[0_1px_0_0_#035c3a] active:translate-y-[3px] transition-all cursor-pointer"
            whileHover={{ scale: 1.08 }}
            whileTap={{ scale: 0.92 }}
          >
            <FontAwesomeIcon icon={faVolumeHigh} className="text-xl" />
          </motion.button>

          <div className="absolute bottom-5 flex items-center gap-1.5 text-xs text-pb-text-light/50 font-semibold">
            <FontAwesomeIcon icon={faRotate} className="text-[10px]" />
            Toca para girar
          </div>
        </div>

        {/* Back */}
        <div
          className={cn(
            'absolute inset-0 backface-hidden rounded-3xl',
            'bg-linear-to-br from-pb-amber/90 to-[#FF8C00]/90 backdrop-blur-xl p-6 sm:p-8',
            'shadow-elevated',
            'flex flex-col items-center justify-center gap-4',
          )}
          style={{ backfaceVisibility: 'hidden', transform: 'rotateY(180deg)' }}
        >
          <h2 className="text-2xl sm:text-3xl font-black text-white tracking-tight text-center">
            {translation}
          </h2>

          <div className="absolute bottom-5 flex items-center gap-1.5 text-xs text-white/40 font-semibold">
            <FontAwesomeIcon icon={faRotate} className="text-[10px]" />
            Toca para girar
          </div>
        </div>
      </motion.div>
    </div>
  )
}
