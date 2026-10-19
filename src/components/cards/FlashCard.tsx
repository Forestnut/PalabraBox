import { useState, useEffect, useCallback } from 'react'
import { motion } from 'motion/react'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faVolumeHigh, faRotate } from '@fortawesome/free-solid-svg-icons'
import { speak, cancelSpeech } from '../../speak'
import { useSettingsStore } from '../../store/settingsStore'
import type { Word } from '../../types'
import { cn } from '../../utils/cn'

interface FlashCardProps {
  word: Word
}

/**
 * Flashcard: English front (the learning target), Spanish back.
 * Audio follows the same direction — en-US on the front, es-ES on the back.
 */
export function FlashCard({ word }: FlashCardProps) {
  const [flipped, setFlipped] = useState(false)
  const speechSpeed = useSettingsStore((s) => s.speechSpeed)
  const ttsVolume = useSettingsStore((s) => s.volume.tts)

  const frontText = word.en.text
  const backText = word.es.text
  const emoji = word.emoji

  useEffect(() => {
    return () => {
      cancelSpeech()
    }
  }, [])

  const handlePlayAudio = useCallback(
    (e: React.MouseEvent, side: 'front' | 'back') => {
      e.stopPropagation()
      const text = side === 'front' ? word.en.audioText || frontText : word.es.audioText || backText
      const lang = side === 'front' ? ('en' as const) : ('es' as const)
      speak(text, { defaultLang: lang, volume: ttsVolume, rate: speechSpeed })
    },
    [word, frontText, backText, ttsVolume, speechSpeed],
  )

  return (
    <div
      role="button"
      tabIndex={0}
      aria-pressed={flipped}
      aria-label={`Tarjeta: ${frontText}. Activar para girar`}
      className="w-full max-w-sm mx-auto perspective-midrange cursor-pointer select-none focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-pb-amber rounded-3xl"
      onClick={() => setFlipped(!flipped)}
      onKeyDown={(e) => {
        if (e.key === 'Enter' || e.key === ' ') {
          e.preventDefault()
          setFlipped(!flipped)
        }
      }}
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
            'bg-white p-6 sm:p-8',
            'shadow-elevated ring-1 ring-black/4',
            'flex flex-col items-center justify-center gap-4',
          )}
          style={{ backfaceVisibility: 'hidden', WebkitBackfaceVisibility: 'hidden' }}
        >
          {emoji && <span className="text-5xl sm:text-6xl mb-2">{emoji}</span>}

          <h2 className="text-3xl sm:text-4xl font-black text-pb-dark tracking-tight text-center">
            {frontText}
          </h2>

          <motion.button
            onClick={(e) => handlePlayAudio(e, 'front')}
            aria-label={`Escuchar "${frontText}"`}
            className="mt-2 w-14 h-14 rounded-full bg-linear-to-b from-[#0a8a5e] to-pb-emerald text-white flex items-center justify-center shadow-[0_4px_0_0_#035c3a] active:shadow-[0_1px_0_0_#035c3a] active:translate-y-0.75 transition-all cursor-pointer"
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
            'bg-linear-to-br from-[#FFA500] to-[#FF8C00] p-6 sm:p-8',
            'shadow-elevated',
            'flex flex-col items-center justify-center gap-4',
          )}
          style={{
            backfaceVisibility: 'hidden',
            WebkitBackfaceVisibility: 'hidden',
            transform: 'rotateY(180deg)',
          }}
        >
          {emoji && (
            <span className="text-4xl sm:text-5xl mb-2 opacity-90 drop-shadow-sm">{emoji}</span>
          )}

          <h2 className="text-2xl sm:text-3xl font-black text-white tracking-tight text-center drop-shadow-sm">
            {backText}
          </h2>

          <motion.button
            onClick={(e) => handlePlayAudio(e, 'back')}
            aria-label={`Escuchar "${backText}"`}
            className="mt-2 w-12 h-12 rounded-full bg-white text-pb-amber flex items-center justify-center shadow-[0_4px_0_0_#d86c00] active:shadow-[0_1px_0_0_#d86c00] active:translate-y-0.75 transition-all cursor-pointer"
            whileHover={{ scale: 1.08 }}
            whileTap={{ scale: 0.92 }}
          >
            <FontAwesomeIcon icon={faVolumeHigh} className="text-lg" />
          </motion.button>

          <div className="absolute bottom-5 flex items-center gap-1.5 text-xs text-white/40 font-semibold">
            <FontAwesomeIcon icon={faRotate} className="text-[10px]" />
            Toca para girar
          </div>
        </div>
      </motion.div>
    </div>
  )
}
