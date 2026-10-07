import { create } from 'zustand'

export type GameStatus = 'idle' | 'playing' | 'finished'

interface GameState {
  status: GameStatus
  score: number
  lives: number
  maxLives: number
  currentQuestionIndex: number
  totalQuestions: number
  sessionBlacklist: string[]
  startGame: (total?: number) => void
  answerCorrect: () => void
  answerWrong: () => void
  resetGame: () => void
  nextQuestion: () => void
  endGame: () => void
  addToBlacklist: (id: string) => void
}

export const useGameStore = create<GameState>((set) => ({
  status: 'idle',
  score: 0,
  lives: 3,
  maxLives: 3,
  currentQuestionIndex: 0,
  totalQuestions: 0,
  sessionBlacklist: [],

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
    set({ status: 'idle', score: 0, lives: 3, currentQuestionIndex: 0, totalQuestions: 0 }),
  addToBlacklist: (id) =>
    set((state) => {
      if (state.sessionBlacklist.includes(id)) return state
      return { sessionBlacklist: [...state.sessionBlacklist, id] }
    }),
}))
