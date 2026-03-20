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

const sizeMap: Record<MascotSize, string> = {
  sm: 'w-16 h-16',
  md: 'w-28 h-28',
  lg: 'w-40 h-40',
}

export function Mascot({ mood = 'idle', size = 'md', className, message }: MascotProps) {
  // Simple animations for different moods
  const bobAnim = mood === 'idle' 
    ? { y: [0, -4, 0], transition: { repeat: Infinity, duration: 2, ease: "easeInOut" as const } }
    : mood === 'happy'
    ? { y: [0, -10, 0], transition: { repeat: Infinity, duration: 0.5, ease: "easeOut" as const } }
    : { x: [-3, 3, -3, 3, 0], transition: { duration: 0.4 } } // wrong shake

  // Heart particles for happy
  const hearts = mood === 'happy' ? ['💕', '✨', '💕'] : []

  return (
    <div className={cn('relative inline-flex flex-col items-center select-none', className)}>
      {/* Speech Bubble */}
      <AnimatePresence>
        {message && (
          <motion.div
            initial={{ opacity: 0, y: 10, scale: 0.8 }}
            animate={{ opacity: 1, y: 0, scale: 1 }}
            exit={{ opacity: 0, scale: 0.8, y: 5 }}
            className="absolute bottom-[115%] left-1/2 -translate-x-1/2 mb-2 bg-white text-pb-dark px-4 py-2 rounded-2xl border-2 border-slate-200 shadow-[0_4px_0_0_rgba(203,213,225,1)] whitespace-nowrap font-black z-20 text-center text-sm md:text-base before:content-[''] before:absolute before:-bottom-2 before:left-1/2 before:-translate-x-1/2 before:w-4 before:h-4 before:bg-white before:border-b-2 before:border-r-2 before:border-slate-200 before:rotate-45"
          >
            {message}
          </motion.div>
        )}
      </AnimatePresence>

      <div className="relative">
        {/* Floating particles */}
        <AnimatePresence>
          {hearts.map((h, i) => (
            <motion.div
              key={i}
              initial={{ opacity: 0, y: 0, scale: 0 }}
              animate={{ opacity: 1, y: -40 - (i*10), scale: 1.5, x: (i-1)*20 }}
              exit={{ opacity: 0 }}
              transition={{ repeat: Infinity, duration: 1.5, delay: i * 0.2 }}
              className="absolute top-0 left-1/2 -translate-x-1/2 text-2xl z-0 pointer-events-none"
            >
              {h}
            </motion.div>
          ))}
        </AnimatePresence>

        <motion.div 
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          animate={bobAnim as any} 
          className={cn(sizeMap[size], "relative z-10")}
          style={{ transformOrigin: 'bottom center' }}
        >
          {/* Cardboard Box SVG */}
          <svg viewBox="0 0 100 100" className="w-full h-full drop-shadow-md overflow-visible">
            {/* Back Flap */}
            <motion.path 
              d="M 20 30 L 80 30 L 70 10 L 30 10 Z" 
              fill="#B47228" 
              stroke="#4A2E15" 
              strokeWidth="3" 
              strokeLinejoin="round"
              initial={{ rotateX: 0 }}
              animate={mood === 'happy' ? { rotateX: [0, 20, 0] } : {}}
              transition={{ repeat: Infinity, duration: 0.5 }}
              style={{ transformOrigin: 'center 30px' }}
            />
            
            {/* Box Body */}
            <path 
              d="M 15 30 L 85 30 L 80 90 L 20 90 Z" 
              fill="#F4A236" 
              stroke="#4A2E15" 
              strokeWidth="3" 
              strokeLinejoin="round" 
            />
            
            {/* Box Inner Shadow / Fold Line */}
            <path d="M 20 90 L 15 30" stroke="#4A2E15" strokeWidth="3" opacity="0.3" />
            <path d="M 80 90 L 85 30" stroke="#4A2E15" strokeWidth="3" opacity="0.3" />

            {/* Left Flap */}
            <motion.path 
              d="M 15 30 L 5 45 L 25 55 L 35 30 Z" 
              fill="#F4A236" 
              stroke="#4A2E15" 
              strokeWidth="3" 
              strokeLinejoin="round"
              initial={{ rotate: 0 }}
              animate={mood === 'happy' ? { rotate: [-5, 5, -5] } : { rotate: [0, 2, 0] }}
              transition={{ repeat: Infinity, duration: mood === 'happy' ? 0.3 : 3 }}
              style={{ transformOrigin: '15px 30px' }}
            />

            {/* Right Flap */}
            <motion.path 
              d="M 85 30 L 95 45 L 75 55 L 65 30 Z" 
              fill="#E08F22" 
              stroke="#4A2E15" 
              strokeWidth="3" 
              strokeLinejoin="round"
              initial={{ rotate: 0 }}
              animate={mood === 'happy' ? { rotate: [5, -5, 5] } : { rotate: [0, -2, 0] }}
              transition={{ repeat: Infinity, duration: mood === 'happy' ? 0.3 : 3.2 }}
              style={{ transformOrigin: '85px 30px' }}
            />

            {/* Face Container */}
            <g transform="translate(0, 10)">
              {/* Left Eye */}
              {mood === 'happy' ? (
                <path d="M 35 45 Q 40 40 45 45" fill="none" stroke="#4A2E15" strokeWidth="4" strokeLinecap="round" />
              ) : mood === 'wrong' ? (
                <path d="M 35 40 L 45 50 M 45 40 L 35 50" stroke="#4A2E15" strokeWidth="4" strokeLinecap="round" />
              ) : (
                <motion.circle 
                  cx="40" cy="45" r="4" fill="#4A2E15"
                  animate={{ scaleY: [1, 0.1, 1] }}
                  transition={{ repeat: Infinity, duration: 3, times: [0, 0.05, 0.1] }}
                />
              )}

              {/* Right Eye */}
              {mood === 'happy' ? (
                <path d="M 55 45 Q 60 40 65 45" fill="none" stroke="#4A2E15" strokeWidth="4" strokeLinecap="round" />
              ) : mood === 'wrong' ? (
                <path d="M 55 40 L 65 50 M 65 40 L 55 50" stroke="#4A2E15" strokeWidth="4" strokeLinecap="round" />
              ) : (
                <motion.circle 
                  cx="60" cy="45" r="4" fill="#4A2E15"
                  animate={{ scaleY: [1, 0.1, 1] }}
                  transition={{ repeat: Infinity, duration: 3, times: [0, 0.05, 0.1] }}
                />
              )}

              {/* Mouth */}
              {mood === 'happy' ? (
                <path d="M 42 55 Q 50 65 58 55" fill="none" stroke="#4A2E15" strokeWidth="4" strokeLinecap="round" />
              ) : mood === 'wrong' ? (
                <path d="M 45 60 Q 50 55 55 60" fill="none" stroke="#4A2E15" strokeWidth="3" strokeLinecap="round" />
              ) : (
                <path d="M 46 56 Q 50 58 54 56" fill="none" stroke="#4A2E15" strokeWidth="3" strokeLinecap="round" />
              )}
            </g>

            {/* Front Flap (Folded down a bit) */}
            <motion.path 
              d="M 15 30 L 85 30 L 75 40 L 25 40 Z" 
              fill="#FFB952" 
              stroke="#4A2E15" 
              strokeWidth="3" 
              strokeLinejoin="round"
              initial={{ rotateX: 0 }}
              animate={mood === 'happy' ? { rotateX: [0, -20, 0] } : {}}
              transition={{ repeat: Infinity, duration: 0.5 }}
              style={{ transformOrigin: 'center 30px' }}
            />
          </svg>
        </motion.div>
      </div>
    </div>
  )
}
