import { motion, AnimatePresence } from 'framer-motion'
import { Mascot } from './Mascot'

interface LoaderOverlayProps {
  isLoading: boolean
}

export function LoaderOverlay({ isLoading }: LoaderOverlayProps) {
  return (
    <AnimatePresence>
      {isLoading && (
        <motion.div
          className="fixed inset-0 z-[100] flex flex-col items-center justify-center bg-pb-dark text-white"
          initial={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          transition={{ duration: 0.4 }}
        >
          <div className="mx-auto mb-4 flex justify-center">
            <Mascot mood="idle" size="lg" />
          </div>
          <motion.h1
            className="text-4xl font-extrabold mt-4"
            initial={{ opacity: 0, y: 12 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.2, duration: 0.4 }}
          >
            PalabraBox
          </motion.h1>
          <motion.div 
            className="mt-6 flex space-x-2"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ delay: 0.5 }}
          >
            <div className="w-3 h-3 rounded-full bg-pb-primary animate-bounce" style={{ animationDelay: '0ms' }} />
            <div className="w-3 h-3 rounded-full bg-pb-primary animate-bounce" style={{ animationDelay: '150ms' }} />
            <div className="w-3 h-3 rounded-full bg-pb-primary animate-bounce" style={{ animationDelay: '300ms' }} />
          </motion.div>
        </motion.div>
      )}
    </AnimatePresence>
  )
}
