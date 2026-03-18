import { useMemo, useState, useEffect } from 'react'
import { progressService } from '../services/progressService'
import type { ProgressData } from '../services/progressService'

export function useQuickProgress() {
  const [progress, setProgress] = useState<ProgressData>(() => progressService.getProgress())

  useEffect(() => {
    // Listen to changes from other parts of the app
    const handleUpdate = () => {
      setProgress(progressService.getProgress())
    }
    
    window.addEventListener('pb-progress-updated', handleUpdate)

    // Update streak asynchronously to avoid synchronous effect state updates
    setTimeout(() => {
      progressService.updateStreak()
    }, 0)

    return () => window.removeEventListener('pb-progress-updated', handleUpdate)
  }, [])

  const percentage = useMemo(() => {
    if (progress.total <= 0) return 0
    return Math.round((progress.completed / progress.total) * 100)
  }, [progress.completed, progress.total])

  return { progress, percentage }
}
