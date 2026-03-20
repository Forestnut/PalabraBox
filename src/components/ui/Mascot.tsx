/**
 * Boxi – the PalabraBox mascot.
 * A pure CSS/TSX animated box character.
 * Props:
 *  - mood: 'idle' | 'happy' | 'wrong'
 *  - size: 'sm' | 'md' | 'lg' (default: 'md')
 *  - className: optional extra classes
 */
import { motion, AnimatePresence } from 'framer-motion'
import { cn } from '../../utils/cn'

export type MascotMood = 'idle' | 'happy' | 'wrong'
export type MascotSize = 'sm' | 'md' | 'lg'

interface MascotProps {
  mood?: MascotMood
  size?: MascotSize
  className?: string
  message?: string | null
}

const sizeMap: Record<MascotSize, { box: string; eye: string; mouth: string; flap: string; particle: string }> = {
  sm: { box: 'w-16 h-14', eye: 'w-2 h-2', mouth: 'w-5 h-2.5', flap: 'w-5 h-3', particle: 'text-lg' },
  md: { box: 'w-24 h-20', eye: 'w-3 h-3', mouth: 'w-7 h-3.5', flap: 'w-7 h-4', particle: 'text-2xl' },
  lg: { box: 'w-36 h-28', eye: 'w-4 h-4', mouth: 'w-10 h-5', flap: 'w-11 h-6', particle: 'text-4xl' },
}

export function Mascot({ mood = 'idle', size = 'md', className, message }: MascotProps) {
  const s = sizeMap[size]

  // Resolve box body color based on mood
  const bodyColor =
    mood === 'happy' ? 'bg-pb-amber border-amber-400' :
    mood === 'wrong' ? 'bg-red-100 border-red-300' :
    'bg-amber-100 border-amber-300'

  // Resolve mouth shape based on mood
  const mouthClass =
    mood === 'happy' ? 'rounded-t-full border-b-0 border-t border-x border-amber-700/60' :
    mood === 'wrong' ? 'rounded-b-full border-t-0 border-b border-x border-amber-700/60 translate-y-0.5' :
    'rounded-full border border-amber-700/40'

  // Resolve wrapper animation based on mood
  const wrapperAnim =
    mood === 'happy' ? 'animate-boxi-happy' :
    mood === 'wrong'  ? 'animate-boxi-shake' :
    'animate-boxi-bob'

  return (
    <div className={cn('relative inline-flex flex-col items-center select-none', className)} role="img" aria-label="Boxi mascot">
      {/* Speech Bubble */}
      <AnimatePresence>
        {message && (
          <motion.div
            initial={{ opacity: 0, y: 10, scale: 0.9 }}
            animate={{ opacity: 1, y: 0, scale: 1 }}
            exit={{ opacity: 0, scale: 0.9, y: 5 }}
            className="absolute bottom-[110%] left-1/2 -translate-x-1/2 mb-2 bg-white text-pb-dark px-4 py-2 rounded-2xl shadow-box-hover border-2 border-pb-bg whitespace-nowrap font-bold z-10 before:content-[''] before:absolute before:-bottom-2 before:left-1/2 before:-translate-x-1/2 before:border-8 before:border-transparent before:border-t-white"
          >
            {message}
          </motion.div>
        )}
      </AnimatePresence>

      {/* Floating hearts / particles on happy */}
      {mood === 'happy' && (
        <div className="absolute -top-8 w-full flex justify-around pointer-events-none" aria-hidden>
          {['💕', '⭐', '💕'].map((emoji, i) => (
            <span
              key={i}
              className={cn(s.particle, 'animate-boxi-heartpop')}
              style={{ animationDelay: `${i * 0.15}s` }}
            >
              {emoji}
            </span>
          ))}
        </div>
      )}

      <div className={cn('relative flex flex-col items-center', wrapperAnim)}>
        {/* Box flaps (cardboard ears) */}
        <div className="flex gap-1 mb-0.5">
          <div className={cn(s.flap, 'rounded-t-md border-2 border-b-0 border-amber-400', bodyColor, '-rotate-6')} />
          <div className={cn(s.flap, 'rounded-t-md border-2 border-b-0 border-amber-400', bodyColor, 'rotate-6')} />
        </div>

        {/* Main box body */}
        <div className={cn(s.box, 'relative rounded-2xl border-2 flex items-center justify-center', bodyColor, 'shadow-box overflow-hidden')}>
          {/* Face */}
          <div className="flex flex-col items-center gap-1">
            {/* Eyes row */}
            <div className="flex gap-3">
              {/* Left eye */}
              <div className={cn(s.eye, 'rounded-full bg-pb-dark animate-boxi-blink relative overflow-hidden')}>
                {/* Eye shine */}
                <div className="absolute top-0.5 right-0.5 w-1 h-1 rounded-full bg-white opacity-70" />
              </div>
              {/* Right eye */}
              <div className={cn(s.eye, 'rounded-full bg-pb-dark animate-boxi-blink relative overflow-hidden')}>
                <div className="absolute top-0.5 right-0.5 w-1 h-1 rounded-full bg-white opacity-70" />
              </div>
            </div>

            {/* Mouth */}
            <div className={cn(s.mouth, mouthClass)} />
          </div>

          {/* Subtle cardboard texture lines */}
          <div className="absolute inset-0 pointer-events-none">
            <div className="absolute left-1/2 top-0 bottom-0 w-px bg-amber-400/20" />
          </div>
        </div>
      </div>
    </div>
  )
}
