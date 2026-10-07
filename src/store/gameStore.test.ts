import { describe, it, expect, beforeEach } from 'vitest'
import { useGameStore } from './gameStore'

describe('gameStore', () => {
  beforeEach(() => {
    useGameStore.getState().resetGame()
  })

  it('starts a game with reset score and lives', () => {
    useGameStore.getState().answerCorrect()
    useGameStore.getState().answerWrong()

    useGameStore.getState().startGame(10)

    const state = useGameStore.getState()
    expect(state.status).toBe('playing')
    expect(state.score).toBe(0)
    expect(state.lives).toBe(3)
    expect(state.totalQuestions).toBe(10)
    expect(state.currentQuestionIndex).toBe(0)
  })

  it('adds 10 points per correct answer', () => {
    useGameStore.getState().startGame(5)
    useGameStore.getState().answerCorrect()
    useGameStore.getState().answerCorrect()

    expect(useGameStore.getState().score).toBe(20)
  })

  it('removes one life per wrong answer but never below zero', () => {
    useGameStore.getState().startGame(5)
    useGameStore.getState().answerWrong()
    useGameStore.getState().answerWrong()
    useGameStore.getState().answerWrong()
    useGameStore.getState().answerWrong() // one more than max lives

    expect(useGameStore.getState().lives).toBe(0)
  })

  it('advances the question index and can finish the game', () => {
    useGameStore.getState().startGame(2)
    useGameStore.getState().nextQuestion()
    useGameStore.getState().nextQuestion()
    useGameStore.getState().endGame()

    const state = useGameStore.getState()
    expect(state.currentQuestionIndex).toBe(2)
    expect(state.status).toBe('finished')
  })

  it('blacklists answered questions once per session', () => {
    useGameStore.getState().addToBlacklist('q1')
    useGameStore.getState().addToBlacklist('q1')
    useGameStore.getState().addToBlacklist('q2')

    expect(useGameStore.getState().sessionBlacklist).toEqual(['q1', 'q2'])
  })
})
