/**
 * Hook to quickly access user's core progress stats (streak, points, completions)
 * connected safely to persistent Zustand store.
 */
import { useMemo, useEffect } from 'react'
import { useProgressStore } from '../store/progressStore'

export function useQuickProgress() {
  const streakDays = useProgressStore(state => state.streakDays)
  const completed = useProgressStore(state => state.completed)
  const total = useProgressStore(state => state.total)
  const points = useProgressStore(state => state.points)
  const getLevel = useProgressStore(state => state.getLevel)
  const getLevelProgress = useProgressStore(state => state.getLevelProgress)
  const lastActiveDate = useProgressStore(state => state.lastActiveDate)
  const updateStreak = useProgressStore(state => state.updateStreak)

  useEffect(() => {
    // Determine streak continuously safely mounted
    setTimeout(() => {
      updateStreak()
    }, 0)
  }, [updateStreak])

  const percentage = useMemo(() => {
    if (total <= 0) return 0
    return Math.round((completed / total) * 100)
  }, [completed, total])

  const level = getLevel()
  const levelProgressPercentage = getLevelProgress()

  return { 
    progress: { streakDays, completed, total, points, lastActiveDate }, 
    percentage,
    level,
    levelProgressPercentage
  }
}
