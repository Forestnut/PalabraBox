import { describe, it, expect, beforeEach, afterEach, vi } from 'vitest'
import { useProgressStore, selectOwnedStars } from './progressStore'

function fakeDate(iso: string) {
  vi.useFakeTimers()
  vi.setSystemTime(new Date(iso))
}

describe('progressStore', () => {
  beforeEach(() => {
    window.localStorage.clear()
    useProgressStore.setState({
      starsByScenario: {},
      streakDays: 0,
      completed: 0,
      total: 0,
      points: 0,
      possibleStars: 0,
      lastActiveDate: null,
    })
  })

  afterEach(() => {
    vi.useRealTimers()
  })

  it('starts a streak on first activity', () => {
    fakeDate('2026-10-07T12:00:00')

    useProgressStore.getState().updateStreak()

    expect(useProgressStore.getState().streakDays).toBe(1)
    expect(useProgressStore.getState().lastActiveDate).toBe('2026-10-07')
  })

  it('increments the streak after exactly one day of inactivity', () => {
    useProgressStore.setState({ streakDays: 4, lastActiveDate: '2026-10-06' })
    fakeDate('2026-10-07T12:00:00')

    useProgressStore.getState().updateStreak()

    expect(useProgressStore.getState().streakDays).toBe(5)
  })

  it('does not change the streak when already active today', () => {
    useProgressStore.setState({ streakDays: 6, lastActiveDate: '2026-10-07' })
    fakeDate('2026-10-07T23:59:00')

    useProgressStore.getState().updateStreak()

    expect(useProgressStore.getState().streakDays).toBe(6)
  })

  it('resets the streak after more than one day of inactivity', () => {
    useProgressStore.setState({ streakDays: 10, lastActiveDate: '2026-10-03' })
    fakeDate('2026-10-07T12:00:00')

    useProgressStore.getState().updateStreak()

    expect(useProgressStore.getState().streakDays).toBe(1)
  })

  it('accumulates points and derives level / progress', () => {
    useProgressStore.getState().addPoints(30)
    useProgressStore.getState().addPoints(70)

    const state = useProgressStore.getState()
    expect(state.points).toBe(100)
    expect(state.getLevel()).toBe(2) // 100 points → level 2
    expect(state.getLevelProgress()).toBe(0) // exactly at the level boundary
  })

  it('records scenario stars and never downgrades them', () => {
    const id = '11111111-1111-1111-1111-111111111111'
    useProgressStore.getState().setScenarioStars(id, 2)
    useProgressStore.getState().setScenarioStars(id, 1)

    expect(useProgressStore.getState().starsByScenario[id]).toBe(2)
  })

  it('sums owned stars across scenarios', () => {
    useProgressStore.getState().setScenarioStars('11111111-1111-1111-1111-111111111111', 3)
    useProgressStore.getState().setScenarioStars('22222222-2222-2222-2222-222222222222', 1)

    expect(selectOwnedStars(useProgressStore.getState())).toBe(4)
  })
})
