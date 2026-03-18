import { useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { motion } from 'framer-motion'
import { PageTransition } from '../components/layout/PageTransition'

export default function SplashScreen() {
  const navigate = useNavigate()

  useEffect(() => {
    const timeout = window.setTimeout(() => {
      navigate('/menu', { replace: true })
    }, 1600)

    return () => window.clearTimeout(timeout)
  }, [navigate])

  return (
    <PageTransition className="flex items-center justify-center bg-pb-dark text-white">
      <div className="text-center">
        <motion.span
          className="text-6xl"
          animate={{ rotate: [0, 5, -5, 0], scale: [1, 1.1, 1.1, 1] }}
          transition={{ duration: 1.4, repeat: Infinity, ease: 'easeInOut' }}
        >
          📦
        </motion.span>
        <motion.h1
          className="text-4xl font-extrabold mt-4"
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.4, duration: 0.6 }}
        >
          PalabraBox
        </motion.h1>
      </div>
    </PageTransition>
  )
}
