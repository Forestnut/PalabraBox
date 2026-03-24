export interface ProgressData {
  streakDays: number
  completed: number
  total: number
  points: number
  lastActiveDate: string | null
}

const STORAGE_KEY = 'palabrabox.quickProgress'

const DEFAULT_PROGRESS: ProgressData = {
  streakDays: 0,
  completed: 0,
  total: 12,
  points: 0,
  lastActiveDate: null,
}

class ProgressService {
  private get todayStr(): string {
    return new Date().toISOString().split('T')[0]
  }

  getProgress(): ProgressData {
    try {
      const raw = window.localStorage.getItem(STORAGE_KEY)
      if (raw) {
        return { ...DEFAULT_PROGRESS, ...JSON.parse(raw) }
      }
    } catch {
      // Ignore parse errors
    }
    return DEFAULT_PROGRESS
  }

  saveProgress(data: ProgressData): void {
    window.localStorage.setItem(STORAGE_KEY, JSON.stringify(data))
    // Dispatch custom event so hooks can listen if needed
    window.dispatchEvent(new Event('pb-progress-updated'))
  }

  addPoints(points: number): void {
    const data = this.getProgress()
    data.points += points
    this.saveProgress(data)
  }

  markScenarioCompleted(): void {
    const data = this.getProgress()
    // It's technically possible to complete scenarios up to total count
    if (data.completed < data.total) {
      data.completed += 1
    }
    this.saveProgress(data)
  }

  // A more robust way: set exactly how many are complete based on stars
  updateCompletedTotal(completedCount: number, totalCount: number): void {
     const data = this.getProgress()
     data.completed = completedCount
     data.total = totalCount
     this.saveProgress(data)
  }

  updateStreak(): void {
    const data = this.getProgress()
    const today = this.todayStr

    if (data.lastActiveDate === today) {
      // Already active today, streak unchanged
      return
    }

    if (!data.lastActiveDate) {
      data.streakDays = 1
    } else {
      const last = new Date(data.lastActiveDate)
      const current = new Date(today)
      const diffTime = Math.abs(current.getTime() - last.getTime())
      const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24))

      if (diffDays === 1) {
        data.streakDays += 1 // Consecutive day
      } else if (diffDays > 1) {
        data.streakDays = 1 // Streak broken
      }
    }

    data.lastActiveDate = today
    this.saveProgress(data)
  }
}

export const progressService = new ProgressService()
