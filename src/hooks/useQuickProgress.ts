import { useMemo, useState } from 'react'

export interface QuickProgress {
  streakDays: number
  completed: number
  total: number
  points: number
}

const STORAGE_KEY = 'palabrabox.quickProgress'

const DEFAULT_PROGRESS: QuickProgress = {
  streakDays: 3,
  completed: 2,
  total: 12,
  points: 450,
}

export function useQuickProgress() {
  const [progress] = useState<QuickProgress>(() => {
    try {
      const raw = window.localStorage.getItem(STORAGE_KEY)
      if (!raw) return DEFAULT_PROGRESS
      const parsed = JSON.parse(raw) as QuickProgress
      if (
        typeof parsed?.streakDays === 'number' &&
        typeof parsed?.completed === 'number' &&
        typeof parsed?.total === 'number' &&
        typeof parsed?.points === 'number'
      ) {
        return parsed
      }
    } catch {
      // Ignore invalid stored data
    }

    return DEFAULT_PROGRESS
  })

  const percentage = useMemo(() => {
    if (progress.total <= 0) return 0
    return Math.round((progress.completed / progress.total) * 100)
  }, [progress.completed, progress.total])

  return { progress, percentage }
}
