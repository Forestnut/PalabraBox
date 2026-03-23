import { motion, AnimatePresence } from 'framer-motion'
import { useEffect, useState } from 'react'
import { cn } from '../../utils/cn'

export type MascotMood = 'idle' | 'happy' | 'wrong' | 'sad' | 'celebrate' | 'sleeping'
export type MascotSize = 'sm' | 'md' | 'lg' | 'xl' | '2xl'

interface MascotProps {
  mood?: MascotMood
  size?: MascotSize
  className?: string
  message?: string | null
}

const sizeMap: Record<MascotSize, string> = {
  sm: 'w-16 h-16',
  md: 'w-24 h-24',
  lg: 'w-36 h-36',
  xl: 'w-48 h-48',
  '2xl': 'w-64 h-64',
}

export function Mascot({ mood = 'idle', size = 'md', className, message }: MascotProps) {
  const [isBlinking, setIsBlinking] = useState(false)
  
  // Default is closed, except when happy or celebrate (confetti happens)
  const isClosed = mood !== 'happy' && mood !== 'celebrate'
  
  useEffect(() => {
    if (mood !== 'idle' && mood !== 'happy') return
    const blinkInterval = setInterval(() => {
      setIsBlinking(true)
      setTimeout(() => setIsBlinking(false), 200)
    }, Math.random() * 3000 + 2500)
    return () => clearInterval(blinkInterval)
  }, [mood])

  const idleBob = { 
    y: [0, -3, 0], 
    scaleY: [1, 0.98, 1],
    scaleX: [1, 1.01, 1],
    transition: { repeat: Infinity, duration: 3, ease: "easeInOut" as const } 
  }
  
  const happyJump = { 
    y: [0, -15, 0], 
    scaleY: [1, 1.08, 0.92, 1],
    transition: { repeat: 2, duration: 0.5, ease: "easeOut" as const } 
  }

  const wrongShake = { 
    x: [0, -8, 8, -8, 8, 0], 
    transition: { duration: 0.4 } 
  }

  const celebrateJump = {
    y: [0, -22, 0],
    scale: [1, 1.05, 0.95, 1],
    rotate: [0, -5, 5, 0],
    transition: { repeat: Infinity, duration: 0.7, ease: "easeInOut" as const }
  }

  const sadDroop = {
    y: [0, 8, 0],
    scaleY: [1, 0.9, 1],
    scaleX: [1, 1.05, 1],
    transition: { repeat: 2, duration: 2, ease: "easeInOut" as const }
  }

  const sleepingBreath = {
    y: [0, -3, 0],
    scaleY: [1, 1.03, 1],
    scaleX: [1, 1.02, 1],
    transition: { repeat: Infinity, duration: 3, ease: "easeInOut" as const }
  }

  const getAnim = () => {
    switch(mood) {
      case 'happy': return happyJump
      case 'wrong': return wrongShake
      case 'celebrate': return celebrateJump
      case 'sad': return sadDroop
      case 'sleeping': return sleepingBreath
      default: return idleBob
    }
  }

  // Paths - skrzydełka równo (Straight Flaps along Z axis)
  const backFlapOpened = "M 40 40 L 120 40 L 115 35 L 45 35 Z"
  const backFlapClosed = "M 40 40 L 120 40 L 100 60 L 20 60 Z"

  const leftFlapOpened = "M 20 60 L 40 40 L 40 20 L 20 40 Z"
  const leftFlapClosed = "M 20 60 L 40 40 L 80 40 L 60 60 Z"

  const rightFlapOpened = "M 100 60 L 120 40 L 120 20 L 100 40 Z"
  const rightFlapClosed = "M 100 60 L 120 40 L 80 40 L 60 60 Z"

  const frontFlapOpened = "M 20 60 L 100 60 L 100 95 L 20 95 Z"
  const frontFlapClosed = "M 20 60 L 100 60 L 120 40 L 40 40 Z"

  return (
    <div className={cn('relative inline-flex flex-col items-center justify-end select-none', className)}>
      <AnimatePresence>
        {message && (
          <motion.div
            initial={{ opacity: 0, x: -15, scale: 0.8 }}
            animate={{ opacity: 1, x: 0, scale: 1 }}
            exit={{ opacity: 0, scale: 0.8, x: -10 }}
            className="absolute left-[90%] top-0 ml-4 bg-white text-pb-dark px-5 py-3 rounded-3xl border-4 border-pb-amber/30 shadow-[0_8px_16px_rgba(0,0,0,0.1)] whitespace-nowrap font-black z-30 text-center text-sm md:text-base before:content-[''] before:absolute before:-left-2.75 before:top-1/2 before:-translate-y-1/2 before:w-5 before:h-5 before:bg-white before:border-b-4 before:border-l-4 before:border-pb-amber/30 before:rotate-45"
          >
            {message}
          </motion.div>
        )}
      </AnimatePresence>

      <div className="relative">
        <motion.div 
          animate={getAnim()} 
          className={cn(sizeMap[size], "relative z-10")}
          style={{ transformOrigin: '50% 100%' }}
        >
          <svg viewBox="-10 -10 160 160" className="w-full h-full drop-shadow-[0_15px_15px_rgba(217,119,6,0.3)] overflow-visible">
            <defs>
              <linearGradient id="frontGrad" x1="0%" y1="0%" x2="0%" y2="100%">
                <stop offset="0%" stopColor="#F5A623" />
                <stop offset="100%" stopColor="#D97706" />
              </linearGradient>
              <linearGradient id="rightGrad" x1="0%" y1="0%" x2="100%" y2="100%">
                <stop offset="0%" stopColor="#D97706" />
                <stop offset="100%" stopColor="#92400E" />
              </linearGradient>
            </defs>

            {/* CONFETTI LAYER (Inside the back flap but behind front flap) */}
            <AnimatePresence>
              {(mood === 'happy' || mood === 'celebrate') && (
                <g>
                  {[
                    { x: 50, y: 50, c: '#EF4444' }, { x: 70, y: 50, c: '#3B82F6' },
                    { x: 90, y: 50, c: '#10B981' }, { x: 60, y: 50, c: '#F59E0B' },
                    { x: 80, y: 50, c: '#8B5CF6' }
                  ].map((conf, i) => (
                    <motion.rect
                      key={`c-${i}`}
                      x={conf.x} y={conf.y} width="8" height="8" fill={conf.c} rx="2"
                      initial={{ y: 50, scale: 0, opacity: 1 }}
                      animate={{ 
                        y: [-10, -60, -20, 80],
                        x: [conf.x, conf.x + (i%2 ? -40 : 40)],
                        rotate: [0, 180, 360, 720],
                        scale: [0, 1.5, 1, 0]
                      }}
                      transition={{ duration: 1.5, ease: "easeOut", repeat: Infinity, delay: i * 0.1 }}
                      exit={{ opacity: 0, scale: 0 }}
                    />
                  ))}
                </g>
              )}
            </AnimatePresence>

            {/* ZZZs */}
            <AnimatePresence>
              {mood === 'sleeping' && (
                <g>
                  {[0,1,2].map((z) => (
                    <motion.text
                      key={`z-${z}`}
                      x="100" y="30"
                      fontSize="24"
                      fontWeight="900"
                      fill="#60A5FA"
                      initial={{ opacity: 0, y: 30, x: 80, scale: 0.5 }}
                      animate={{ opacity: [0, 1, 0], y: -10 - (z*15), x: 100 + (z*10), scale: [0.5, 1.5, 2] }}
                      transition={{ repeat: Infinity, duration: 2.5, delay: z * 0.8 }}
                      exit={{ opacity: 0 }}
                    >
                      z
                    </motion.text>
                  ))}
                </g>
              )}
            </AnimatePresence>

            {/* BACK FLAP (Peeking slightly down/back) */}
            <motion.path 
              animate={{ d: isClosed ? backFlapClosed : backFlapOpened }}
              fill="#D97706" stroke="#78350F" strokeWidth="6" strokeLinejoin="round" strokeLinecap="round"
              transition={{ duration: 0.6, type: "spring", bounce: 0.4 }}
            />

            {/* INSIDE HOLE */}
            <path d="M 20 60 L 100 60 L 120 40 L 40 40 Z" fill="#451A03" stroke="#78350F" strokeWidth="6" strokeLinejoin="round" />

            {/* RIGHT FACE */}
            <path d="M 100 60 L 120 40 L 120 110 L 100 130 Z" fill="url(#rightGrad)" stroke="#78350F" strokeWidth="6" strokeLinejoin="round" />

            {/* LEFT FLAP */}
            <motion.path 
              animate={{ d: isClosed ? leftFlapClosed : leftFlapOpened }}
              fill="#F5A623" stroke="#78350F" strokeWidth="6" strokeLinejoin="round" strokeLinecap="round"
              transition={{ duration: 0.6, type: "spring", bounce: 0.4 }}
            />

            {/* RIGHT FLAP */}
            <motion.path 
              animate={{ d: isClosed ? rightFlapClosed : rightFlapOpened }}
              fill="#D97706" stroke="#78350F" strokeWidth="6" strokeLinejoin="round" strokeLinecap="round"
              transition={{ duration: 0.6, type: "spring", bounce: 0.4 }}
            />

            {/* FRONT FACE */}
            <path d="M 20 60 L 100 60 L 100 130 L 20 130 Z" fill="url(#frontGrad)" stroke="#78350F" strokeWidth="6" strokeLinejoin="round" />
            <path d="M 24 64 L 96 64" stroke="#FBBF24" strokeWidth="6" strokeLinecap="round" fill="none" />

            {/* FACE elements relative to front face center (60, 95) */}
            <g transform="translate(60, 95)">
              {/* SWEAT DROP */}
              <AnimatePresence>
                {(mood === 'wrong' || mood === 'sad') && (
                  <motion.g
                    initial={{ opacity: 0, y: -20, x: 25, scale: 0 }}
                    animate={{ opacity: [0, 1, 0], y: [-20, 15, 25], scale: [0, 1.2, 1] }}
                    transition={{ repeat: Infinity, duration: 1.2, ease: "easeIn" }}
                    exit={{ opacity: 0 }}
                  >
                    <path d="M 0 0 C 0 0 -5 7 -5 10 C -5 13 0 15 0 15 C 0 15 5 13 5 10 C 5 7 0 0 0 0 Z" fill="#60A5FA" />
                  </motion.g>
                )}
              </AnimatePresence>

              {/* CHEEKS */}
              {mood !== 'sleeping' && (
                <>
                  <ellipse cx="-20" cy="12" rx="7" ry="4" fill="#EF4444" opacity="0.4" />
                  <ellipse cx="20" cy="12" rx="7" ry="4" fill="#EF4444" opacity="0.4" />
                </>
              )}

              {/* LEFT EYE */}
              {mood === 'happy' || mood === 'celebrate' ? (
                <path d="M -25 -2 Q -15 -10 -5 -2" fill="none" stroke="#451A03" strokeWidth="6" strokeLinecap="round" />
              ) : mood === 'wrong' || mood === 'sad' ? (
                <path d="M -25 2 L -10 -4" stroke="#451A03" strokeWidth="6" strokeLinecap="round" />
              ) : mood === 'sleeping' ? (
                <path d="M -25 0 Q -15 8 -5 0" fill="none" stroke="#451A03" strokeWidth="6" strokeLinecap="round" />
              ) : (
                <motion.ellipse 
                  cx="-15" cy="0" rx="6" ry={isBlinking ? 0.5 : 8} fill="#451A03"
                  transition={{ duration: 0.1 }}
                />
              )}

              {/* RIGHT EYE */}
              {mood === 'happy' || mood === 'celebrate' ? (
                <path d="M 5 -2 Q 15 -10 25 -2" fill="none" stroke="#451A03" strokeWidth="6" strokeLinecap="round" />
              ) : mood === 'wrong' ? (
                <path d="M 25 2 L 10 -4" stroke="#451A03" strokeWidth="6" strokeLinecap="round" />
              ) : mood === 'sad' ? (
                <path d="M 5 -4 L 20 2" stroke="#451A03" strokeWidth="6" strokeLinecap="round" />
              ) : mood === 'sleeping' ? (
                <path d="M 5 0 Q 15 8 25 0" fill="none" stroke="#451A03" strokeWidth="6" strokeLinecap="round" />
              ) : (
                <motion.ellipse 
                  cx="15" cy="0" rx="6" ry={isBlinking ? 0.5 : 8} fill="#451A03"
                  transition={{ duration: 0.1 }}
                />
              )}

              {/* MOUTH */}
              {mood === 'happy' || mood === 'celebrate' ? (
                <path d="M -8 10 Q 0 25 8 10 Z" fill="#451A03" stroke="#451A03" strokeWidth="4" strokeLinejoin="round" />
              ) : mood === 'wrong' ? (
                <path d="M -8 15 Q 0 8 8 15" fill="none" stroke="#451A03" strokeWidth="6" strokeLinecap="round" />
              ) : mood === 'sad' ? (
                <path d="M -8 12 Q 0 5 8 12" fill="none" stroke="#451A03" strokeWidth="6" strokeLinecap="round" />
              ) : mood === 'sleeping' ? (
                <circle cx="0" cy="10" r="4" fill="#451A03" />
              ) : (
                <path d="M -5 10 Q 0 13 5 10" fill="none" stroke="#451A03" strokeWidth="6" strokeLinecap="round" />
              )}
            </g>

            {/* FRONT FLAP */}
            <motion.path 
              animate={{ d: isClosed ? frontFlapClosed : frontFlapOpened }}
              fill="#FBBF24" stroke="#78350F" strokeWidth="6" strokeLinejoin="round" strokeLinecap="round"
              transition={{ duration: 0.6, type: "spring", bounce: 0.4 }}
            />
          </svg>
        </motion.div>
      </div>
    </div>
  )
}
