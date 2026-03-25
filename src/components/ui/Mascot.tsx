import { motion, AnimatePresence } from 'framer-motion'
import { useEffect, useState, useId } from 'react'
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
  
  // Interactive state - allows the mascot to dynamically react to user actions
  const [interactionMood, setInteractionMood] = useState<MascotMood | null>(null)
  
  const uniqueId = useId()
  const safeUniqueId = uniqueId.replace(/:/g, '')
  const gId1 = `frontGrad-${safeUniqueId}`
  const gId2 = `rightGrad-${safeUniqueId}`
  const tapeId = `tapeGrad-${safeUniqueId}`
  
  // Calculate active mood (interaction overrides the base prop)
  const currentMood = interactionMood || mood
  const isClosed = currentMood !== 'happy' && currentMood !== 'celebrate'
  
  // Hide message if the mascot is woken up from sleeping
  const currentMessage = (mood === 'sleeping' && currentMood !== 'sleeping') ? null : message
  
  // Blinking logic (only active when idle or happy)
  useEffect(() => {
    if (currentMood !== 'idle' && currentMood !== 'happy') {
      const t = setTimeout(() => setIsBlinking(false), 0)
      return () => clearTimeout(t)
    }

    let blinkTimeout: ReturnType<typeof setTimeout> | null = null
    let resetTimeout: ReturnType<typeof setTimeout> | null = null
    let cancelled = false

    const scheduleBlink = () => {
      blinkTimeout = setTimeout(() => {
        if (cancelled) return
        setIsBlinking(true)

        resetTimeout = setTimeout(() => {
          if (cancelled) return
          setIsBlinking(false)
          scheduleBlink()
        }, 160)
      }, Math.random() * 3000 + 2200)
    }

    scheduleBlink()

    return () => {
      cancelled = true
      if (blinkTimeout) clearTimeout(blinkTimeout)
      if (resetTimeout) clearTimeout(resetTimeout)
    }
  }, [currentMood])

  // --- Animations Maps (DRY Pattern) ---
  const bodyAnimations = {
    idle: { y: [0, -3, 0], scaleY: [1, 0.98, 1], scaleX: [1, 1.01, 1], transition: { repeat: Infinity, duration: 3, ease: "easeInOut" as const } },
    happy: { y: [0, -15, 0], scaleY: [1, 1.08, 0.92, 1], transition: { repeat: 2, duration: 0.5, ease: "easeOut" as const } },
    wrong: { x: [0, -8, 8, -8, 8, 0], transition: { duration: 0.4 } },
    celebrate: { y: [0, -22, 0], scale: [1, 1.05, 0.95, 1], rotate: [0, -5, 5, 0], transition: { repeat: Infinity, duration: 0.7, ease: "easeInOut" as const } },
    sad: { y: [0, 8, 0], scaleY: [1, 0.9, 1], scaleX: [1, 1.05, 1], transition: { repeat: 2, duration: 2, ease: "easeInOut" as const } },
    sleeping: { y: [0, -3, 0], scaleY: [1, 1.03, 1], scaleX: [1, 1.02, 1], transition: { repeat: Infinity, duration: 3, ease: "easeInOut" as const } }
  }

  const shadowAnimations = {
    idle: { scaleX: [1, 0.97, 1], opacity: [0.16, 0.13, 0.16], transition: { repeat: Infinity, duration: 3, ease: "easeInOut" as const } },
    happy: { scaleX: [1, 0.78, 1], opacity: [0.16, 0.09, 0.16], transition: { repeat: 2, duration: 0.5, ease: "easeOut" as const } },
    wrong: { x: [0, -4, 4, -4, 4, 0], transition: { duration: 0.4 } },
    celebrate: { scaleX: [1, 0.72, 1], opacity: [0.16, 0.08, 0.16], transition: { repeat: Infinity, duration: 0.7, ease: "easeInOut" as const } },
    sad: { scaleX: [1, 1.04, 1], opacity: [0.16, 0.18, 0.16], transition: { repeat: 2, duration: 2, ease: "easeInOut" as const } },
    sleeping: { scaleX: [1, 0.98, 1], opacity: [0.16, 0.12, 0.16], transition: { repeat: Infinity, duration: 3, ease: "easeInOut" as const } }
  }

  // --- Flap Geometries ---
  const flapsPaths = {
    backOpened: "M 120 40 L 40 40 L 35 68 L 115 68 Z", // Drops fully down behind the box
    backClosed: "M 40 40 L 120 40 L 100 50 L 60 50 Z",
    frontOpened: "M 20 60 L 100 60 L 92 83 L 12 83 Z", // Balanced drop, doesn't cover eyes
    frontClosed: "M 20 60 L 100 60 L 80 50 L 40 50 Z",
    leftOpened: "M 20 60 L 40 40 L 10 60 L -10 80 Z",
    leftClosed: "M 20 60 L 40 40 L 80 40 L 60 60 Z",
    rightOpened: "M 100 60 L 120 40 L 150 60 L 130 80 Z",
    rightClosed: "M 100 60 L 120 40 L 80 40 L 60 60 Z",
  }

  // --- Interaction Handlers ---
  const handleMouseEnter = () => {
    if (mood === 'sleeping') {
      setInteractionMood('idle') // Wake up!
    } else if (mood === 'idle') {
      setInteractionMood('happy') // Get excited
    } else if (mood === 'sad') {
      setInteractionMood('idle') // Cheer up slightly
    }
    
    // Force a micro blink on interaction (unless going to sleep)
    if (mood !== 'sleeping') {
      setIsBlinking(true)
      setTimeout(() => setIsBlinking(false), 160)
    }
  }

  const handleMouseLeave = () => {
    // Restore original prop mood smoothly
    setInteractionMood(null)
  }

  return (
    <div 
      className={cn('relative inline-flex flex-col items-center justify-end select-none cursor-pointer', className)}
      onMouseEnter={handleMouseEnter}
      onMouseLeave={handleMouseLeave}
      onClick={handleMouseEnter}
    >
      {/* MESSAGE BUBBLE */}
      <AnimatePresence>
        {currentMessage && (
          <motion.div
            initial={{ opacity: 0, x: -15, scale: 0.8 }}
            animate={{ opacity: 1, x: 0, scale: 1 }}
            exit={{ opacity: 0, scale: 0.8, x: -10 }}
            className="absolute left-[90%] top-0 ml-4 bg-white text-pb-dark px-5 py-3 rounded-3xl border-4 border-pb-amber/30 shadow-[0_8px_16px_rgba(0,0,0,0.1)] whitespace-nowrap font-black z-30 text-center text-sm md:text-base before:content-[''] before:absolute before:-left-2.5 before:top-1/2 before:-translate-y-1/2 before:w-5 before:h-5 before:bg-white before:border-b-4 before:border-l-4 before:border-pb-amber/30 before:rotate-45"
          >
            {currentMessage}
          </motion.div>
        )}
      </AnimatePresence>

      {/* MASCOT BODY */}
      <motion.div
        className={cn(sizeMap[size], "relative")}
        whileHover={{ y: -1, scale: 1.01 }}
        whileTap={{ scale: 0.98, y: 1 }}
      >
        {/* GROUND SHADOW */}
        <motion.div
          animate={shadowAnimations[currentMood]}
          className="absolute bottom-[4%] left-1/2 z-0 h-[12%] w-[60%] -translate-x-1/2 rounded-full bg-[#4A1E00] blur-[6px]"
          style={{ transformOrigin: '50% 50%' }}
        />

        <motion.div 
          animate={bodyAnimations[currentMood]} 
          className="relative z-10 h-full w-full"
          style={{ transformOrigin: '50% 100%' }}
        >
          <svg viewBox="-10 -10 160 160" className="w-full h-full overflow-visible">
            <defs>
              <linearGradient id={gId1} x1="0%" y1="0%" x2="0%" y2="100%">
                <stop offset="0%" stopColor="#F59E0B" />
                <stop offset="100%" stopColor="#D97706" />
              </linearGradient>
              <linearGradient id={gId2} x1="0%" y1="0%" x2="100%" y2="100%">
                <stop offset="0%" stopColor="#D97706" />
                <stop offset="100%" stopColor="#B45309" />
              </linearGradient>
              <linearGradient id={tapeId} x1="0%" y1="0%" x2="0%" y2="100%">
                <stop offset="0%" stopColor="#FEF08A" stopOpacity="0.85" />
                <stop offset="100%" stopColor="#FDE047" stopOpacity="0.6" />
              </linearGradient>
            </defs>

            {/* BACKGROUND BACK FLAP (Drops behind the box for a 3D effect) */}
            <motion.path 
              initial={false}
              animate={{ 
                d: isClosed ? flapsPaths.backClosed : flapsPaths.backOpened,
                opacity: isClosed ? 0 : 1 
              }}
              fill="#D97706" stroke="#4A1E00" strokeWidth="5" strokeLinejoin="round" strokeLinecap="round"
              transition={{ duration: 0.6, type: "spring", bounce: 0.4 }}
            />

            {/* BOX INSIDE & INNER SHADOW */}
            <path d="M 20 60 L 100 60 L 120 40 L 40 40 Z" fill="#290F02" stroke="#4A1E00" strokeWidth="5" strokeLinejoin="round" />

            {/* RIGHT FACE */}
            <path d="M 100 60 L 120 40 L 120 110 L 100 130 Z" fill={`url(#${gId2})`} stroke="#4A1E00" strokeWidth="5" strokeLinejoin="round" />

            {/* FRONT FACE */}
            <path d="M 20 60 L 100 60 L 100 130 L 20 130 Z" fill={`url(#${gId1})`} stroke="#4A1E00" strokeWidth="5" strokeLinejoin="round" />
            <path d="M 24 64 L 96 64" stroke="white" strokeWidth="3" strokeLinecap="round" opacity="0.25" fill="none" />

            {/* --- FACE ELEMENTS --- */}
            <g transform="translate(60, 95)">
              
              {/* SWEAT DROP (Wrong / Sad) */}
              <AnimatePresence>
                {(currentMood === 'wrong' || currentMood === 'sad') && (
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
              {currentMood !== 'sleeping' && (
                <>
                  <ellipse cx="-20" cy="12" rx="7" ry="4" fill="#EF4444" opacity="0.4" />
                  <ellipse cx="20" cy="12" rx="7" ry="4" fill="#EF4444" opacity="0.4" />
                </>
              )}

              {/* LEFT EYE */}
              {currentMood === 'happy' || currentMood === 'celebrate' ? (
                <path d="M -25 -2 Q -15 -10 -5 -2" fill="none" stroke="#290F02" strokeWidth="6" strokeLinecap="round" />
              ) : currentMood === 'wrong' || currentMood === 'sad' ? (
                <path d="M -25 2 L -10 -4" stroke="#290F02" strokeWidth="6" strokeLinecap="round" />
              ) : currentMood === 'sleeping' ? (
                <path d="M -25 0 Q -15 8 -5 0" fill="none" stroke="#290F02" strokeWidth="6" strokeLinecap="round" />
              ) : (
                <motion.ellipse cx="-15" cy="0" rx="6" ry={isBlinking ? 0.5 : 8} fill="#290F02" transition={{ duration: 0.1 }} />
              )}

              {/* RIGHT EYE */}
              {currentMood === 'happy' || currentMood === 'celebrate' ? (
                <path d="M 5 -2 Q 15 -10 25 -2" fill="none" stroke="#290F02" strokeWidth="6" strokeLinecap="round" />
              ) : currentMood === 'wrong' ? (
                <path d="M 25 2 L 10 -4" stroke="#290F02" strokeWidth="6" strokeLinecap="round" />
              ) : currentMood === 'sad' ? (
                <path d="M 5 -4 L 20 2" stroke="#290F02" strokeWidth="6" strokeLinecap="round" />
              ) : currentMood === 'sleeping' ? (
                <path d="M 5 0 Q 15 8 25 0" fill="none" stroke="#290F02" strokeWidth="6" strokeLinecap="round" />
              ) : (
                <motion.ellipse cx="15" cy="0" rx="6" ry={isBlinking ? 0.5 : 8} fill="#290F02" transition={{ duration: 0.1 }} />
              )}

              {/* EYE SHINE (Only for idle/awake) */}
              {currentMood === 'idle' && !isBlinking && (
                <>
                  <circle cx="-17" cy="-3" r="1.6" fill="white" opacity="0.9" />
                  <circle cx="13" cy="-3" r="1.6" fill="white" opacity="0.9" />
                </>
              )}

              {/* MOUTH */}
              {currentMood === 'happy' || currentMood === 'celebrate' ? (
                <path d="M -8 10 Q 0 25 8 10 Z" fill="#290F02" stroke="#290F02" strokeWidth="4" strokeLinejoin="round" />
              ) : currentMood === 'wrong' ? (
                <path d="M -8 15 Q 0 8 8 15" fill="none" stroke="#290F02" strokeWidth="6" strokeLinecap="round" />
              ) : currentMood === 'sad' ? (
                <path d="M -8 12 Q 0 5 8 12" fill="none" stroke="#290F02" strokeWidth="6" strokeLinecap="round" />
              ) : currentMood === 'sleeping' ? (
                <circle cx="0" cy="10" r="4" fill="#290F02" />
              ) : (
                <path d="M -5 10 Q 0 13 5 10" fill="none" stroke="#290F02" strokeWidth="6" strokeLinecap="round" />
              )}
            </g>

            {/* FOREGROUND BACK FLAP (Fades out when box is fully opened) */}
            <motion.path 
              initial={false}
              animate={{ 
                d: isClosed ? flapsPaths.backClosed : flapsPaths.backOpened,
                opacity: isClosed ? 1 : 0 
              }}
              fill="#FBBF24" stroke="#4A1E00" strokeWidth="5" strokeLinejoin="round" strokeLinecap="round"
              transition={{ duration: 0.6, type: "spring", bounce: 0.4 }}
            />

            {/* FRONT FLAP */}
            <motion.path 
              animate={{ d: isClosed ? flapsPaths.frontClosed : flapsPaths.frontOpened }}
              fill="#FDBA74" stroke="#4A1E00" strokeWidth="5" strokeLinejoin="round" strokeLinecap="round"
              transition={{ duration: 0.6, type: "spring", bounce: 0.4 }}
            />

            {/* LEFT FLAP */}
            <motion.path 
              animate={{ d: isClosed ? flapsPaths.leftClosed : flapsPaths.leftOpened }}
              fill="#FBBF24" stroke="#4A1E00" strokeWidth="5" strokeLinejoin="round" strokeLinecap="round"
              transition={{ duration: 0.6, type: "spring", bounce: 0.4 }}
            />

            {/* RIGHT FLAP */}
            <motion.path 
              animate={{ d: isClosed ? flapsPaths.rightClosed : flapsPaths.rightOpened }}
              fill="#F59E0B" stroke="#4A1E00" strokeWidth="5" strokeLinejoin="round" strokeLinecap="round"
              transition={{ duration: 0.6, type: "spring", bounce: 0.4 }}
            />

            {/* --- PACKING TAPE --- */}
            {/* 
              Rebuilt as a perfectly crafted SVG Polygon for crisp edges.
              It starts exactly at the back edge (Y=40) and features a seamlessly 
              integrated jagged tear at the bottom (Y=73/70).
            */}
            <AnimatePresence>
              {isClosed && (
                <motion.g
                  initial={{ opacity: 0 }}
                  animate={{ opacity: 1 }}
                  exit={{ opacity: 0 }}
                >
                  <path
                    d="M 76 40 L 84 40 L 64 60 L 64 73 L 62 70 L 60 73 L 58 70 L 56 73 L 56 60 Z"
                    fill={`url(#${tapeId})`}
                    opacity={0.9}
                  />
                </motion.g>
              )}
            </AnimatePresence>

            {/* --- ZZZ EFFECT --- */}
            <AnimatePresence>
              {currentMood === 'sleeping' && (
                <g>
                  {[0, 1, 2].map((z) => (
                    <motion.text
                      key={`z-${z}`}
                      x="100" y="30"
                      fontSize="24"
                      fontWeight="900"
                      fill="#60A5FA"
                      initial={{ opacity: 0, y: 30, x: 80, scale: 0.5 }}
                      animate={{ opacity: [0, 1, 0], y: -10 - (z * 15), x: 100 + (z * 10), scale: [0.5, 1.5, 2] }}
                      transition={{ repeat: Infinity, duration: 2.5, delay: z * 0.8 }}
                      exit={{ opacity: 0 }}
                    >
                      z
                    </motion.text>
                  ))}
                </g>
              )}
            </AnimatePresence>

            {/* --- CONFETTI EFFECT --- */}
            <AnimatePresence>
              {(currentMood === 'happy' || currentMood === 'celebrate') && (
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
                        x: [conf.x, conf.x + (i % 2 ? -40 : 40)],
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

          </svg>
        </motion.div>
      </motion.div>
    </div>
  )
}