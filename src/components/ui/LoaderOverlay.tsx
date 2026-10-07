import { motion, AnimatePresence } from 'motion/react'
import { Mascot } from './Mascot'

interface LoaderOverlayProps {
  isLoading: boolean
}

export function LoaderOverlay({ isLoading }: LoaderOverlayProps) {
  return (
    <AnimatePresence>
      {isLoading && (
        <motion.div
          className="fixed inset-0 z-100 flex flex-col items-center justify-center bg-linear-to-b from-[#0a0f0a] via-pb-dark to-[#0f1a0f] text-white"
          initial={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          transition={{ duration: 0.4 }}
        >
          <motion.div
            className="mx-auto mb-4 flex justify-center"
            initial={{ scale: 0.85 }}
            animate={{ scale: 1 }}
            transition={{ duration: 0.4 }}
          >
            <Mascot mood="idle" size="lg" />
          </motion.div>
          <motion.h1
            className="text-4xl font-black mt-4 tracking-tight"
            initial={{ opacity: 0, y: 12 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.2, duration: 0.4 }}
          >
            Palabra<span className="text-pb-amber">Box</span>
          </motion.h1>
          <motion.div
            className="mt-6 flex gap-1.5"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ delay: 0.4 }}
          >
            {[0, 1, 2].map(i => (
              <motion.div
                key={i}
                className="w-2 h-2 rounded-full bg-pb-amber"
                animate={{ opacity: [0.3, 1, 0.3], scale: [0.8, 1.1, 0.8] }}
                transition={{ repeat: Infinity, duration: 1.2, delay: i * 0.15, ease: 'easeInOut' }}
              />
            ))}
          </motion.div>
        </motion.div>
      )}
    </AnimatePresence>
  )
}
