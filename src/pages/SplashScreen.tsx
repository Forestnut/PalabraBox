import { useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { motion } from 'motion/react'
import { PageTransition } from '../components/layout/PageTransition'
import { Mascot } from '../components/ui/Mascot'

export default function SplashScreen() {
  const navigate = useNavigate()

  useEffect(() => {
    const timeout = window.setTimeout(() => {
      navigate('/menu', { replace: true })
    }, 1600)

    return () => window.clearTimeout(timeout)
  }, [navigate])

  return (
    <PageTransition className="flex items-center justify-center bg-linear-to-b from-[#0a0f0a] via-pb-dark to-[#0f1a0f] text-white">
      <div className="text-center">
        <motion.div
          className="mx-auto mb-4 flex justify-center"
          initial={{ scale: 0.8, opacity: 0 }}
          animate={{ scale: 1, opacity: 1 }}
          transition={{ duration: 0.5, ease: 'easeOut' }}
        >
          <Mascot mood="idle" size="lg" />
        </motion.div>
        <motion.h1
          className="text-4xl font-black mt-4 tracking-tight"
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.3, duration: 0.5 }}
        >
          Palabra<span className="text-pb-amber">Box</span>
        </motion.h1>
        <motion.div
          className="mt-6 flex justify-center gap-1.5"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 0.6 }}
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
      </div>
    </PageTransition>
  )
}
