import { create } from 'zustand'

export type GameStatus = 'idle' | 'playing' | 'finished'

export interface GameResult {
  scenarioId: string | null
  score: number
  lives: number
  maxLives: number
  /** 0 when lost, otherwise equals remaining lives (min 1) */
  stars: number
}

interface GameState {
  status: GameStatus
  score: number
  lives: number
  maxLives: number
  currentQuestionIndex: number
  totalQuestions: number
  sessionBlacklist: string[]
  /** Result of the last finished game — consumed by the results screen. */
  lastResult: GameResult | null
  startGame: (total?: number) => void
  answerCorrect: () => void
  answerWrong: () => void
  resetGame: () => void
  nextQuestion: () => void
  endGame: () => void
  addToBlacklist: (id: string) => void
  setLastResult: (result: GameResult) => void
}

export const useGameStore = create<GameState>((set) => ({
  status: 'idle',
  score: 0,
  lives: 3,
  maxLives: 3,
  currentQuestionIndex: 0,
  totalQuestions: 0,
  sessionBlacklist: [],
  lastResult: null,

  startGame: (total) =>
    set({
      status: 'playing',
      score: 0,
      lives: 3,
      currentQuestionIndex: 0,
      totalQuestions: total ?? 0,
    }),
  answerCorrect: () => set((state) => ({ score: state.score + 10 })),
  answerWrong: () => set((state) => ({ lives: Math.max(0, state.lives - 1) })),
  nextQuestion: () => set((state) => ({ currentQuestionIndex: state.currentQuestionIndex + 1 })),
  endGame: () => set({ status: 'finished' }),
  resetGame: () =>
    set({
      status: 'idle',
      score: 0,
      lives: 3,
      currentQuestionIndex: 0,
      totalQuestions: 0,
      lastResult: null,
    }),
  addToBlacklist: (id) =>
    set((state) => {
      if (state.sessionBlacklist.includes(id)) return state
      return { sessionBlacklist: [...state.sessionBlacklist, id] }
    }),
  setLastResult: (result) => set({ lastResult: result }),
}))
