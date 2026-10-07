/**
 * Store managing the user's overall progress (stars, streak, points, completions).
 * Uses Zustand's persist middleware for robust local storage persistence.
 *
 * Single source of truth for scenario stars: `starsByScenario`. Legacy
 * `pb_stars_*` localStorage keys are imported once by the state migration
 * (see services/migrationService.ts).
 */
import { create } from 'zustand'
import { persist } from 'zustand/middleware'

/**
 * Core interface for the game's progression tracking
 */
export interface ProgressState {
  /** Stars earned per scenario id (0–3). Never downgrades. */
  starsByScenario: Record<string, number>
  /** Total stars that could be earned in the currently known scenario set (×3) */
  possibleStars: number
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

  /** Records the best result for a scenario (keeps the higher star count). */
  setScenarioStars: (scenarioId: string, stars: number) => void
  /** Sets how many stars are achievable in total (scenario count × 3). */
  setPossibleStars: (total: number) => void
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
  /** Gets the current semantic level based on total points */
  getLevel: () => number
  /** Gets the percentage progress (0-100) towards the next level */
  getLevelProgress: () => number
}

/** Sums all earned stars (use outside React or as a plain selector helper). */
export function selectOwnedStars(state: Pick<ProgressState, 'starsByScenario'>): number {
  return Object.values(state.starsByScenario).reduce((sum, stars) => sum + stars, 0)
}

export const useProgressStore = create<ProgressState>()(
  persist(
    (set, get) => ({
      starsByScenario: {},
      possibleStars: 0,
      streakDays: 0,
      completed: 0,
      total: 0,
      points: 0,
      lastActiveDate: null,

      setScenarioStars: (scenarioId, stars) => {
        const clamped = Math.max(0, Math.min(3, Math.round(stars)))
        set((state) => {
          const current = state.starsByScenario[scenarioId] ?? 0
          if (clamped <= current) return state // never downgrade
          return { starsByScenario: { ...state.starsByScenario, [scenarioId]: clamped } }
        })
      },

      setPossibleStars: (total) => {
        set({ possibleStars: Math.max(0, total) })
      },

      updateStreak: () => {
        // Get local date properly considering timezones to prevent streak breaks due to UTC shifts
        const now = new Date()
        const today = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`
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
      },

      getLevel: () => {
        return Math.floor(get().points / 100) + 1
      },

      getLevelProgress: () => {
        return get().points % 100
      },
    }),
    {
      name: 'palabrabox-progress-storage', // unique name
    },
  ),
)
