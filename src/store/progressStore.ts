/**
 * Store managing the user's overall progress (streak, total points, and total completed scenarios).
 * Uses Zustand's persist middleware for robust local storage persistence.
 */
import { create } from 'zustand'
import { persist } from 'zustand/middleware'

/**
 * Core interface for the game's progression tracking
 */
export interface ProgressState {
  /** The consecutive number of days the user has played */
  streakDays: number
  /** Amount of scenarios finished (stars > 0) */
  completed: number
  /** Overall total scenarios fetched */
  total: number
  /** Global accumulated score across games */
  points: number
  /** Standardized ISO date string of last activity */
  lastActiveDate: string | null
  
  /** 
   * Compares the current date with lastActiveDate.
   * If gap is exactly 1 day, increments streak.
   * If gap > 1 day, resets streak to 1. 
   */
  updateStreak: () => void
  /**
   * Appends score points earned from an individual finished scenario to the total pool.
   * @param points - The score to add.
   */
  addPoints: (points: number) => void
  /**
   * Enforces strict syncing of scenario counts across the whole application.
   * This is generally called by the useScenarios hook using truthy data from DB + stars.
   * @param completedCount - Number of scenarios completed 
   * @param totalCount - Total numbers in the active category
   */
  updateCompletedTotal: (completedCount: number, totalCount: number) => void
}

export const useProgressStore = create<ProgressState>()(
  persist(
    (set, get) => ({
      streakDays: 0,
      completed: 0,
      total: 12,
      points: 0,
      lastActiveDate: null,

      updateStreak: () => {
        const today = new Date().toISOString().split('T')[0]
        const state = get()

        if (state.lastActiveDate === today) {
          return // Already active today
        }

        let newStreak = state.streakDays
        if (!state.lastActiveDate) {
          newStreak = 1
        } else {
          // Normalize dates to strictly compare midnight gaps
          const lastDate = new Date(state.lastActiveDate)
          const currentDate = new Date(today)
          const diffTime = Math.abs(currentDate.getTime() - lastDate.getTime())
          const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24))

          if (diffDays === 1) {
            newStreak += 1
          } else if (diffDays > 1) {
            newStreak = 1
          }
        }

        set({ streakDays: newStreak, lastActiveDate: today })
      },

      addPoints: (points: number) => {
        set((state) => ({ points: state.points + points }))
      },

      updateCompletedTotal: (completedCount: number, totalCount: number) => {
        set({ completed: completedCount, total: totalCount })
      }
    }),
    {
      name: 'palabrabox-progress-storage', // unique name
    }
  )
)
