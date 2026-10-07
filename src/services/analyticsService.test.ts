import { describe, it, expect, beforeEach } from 'vitest'
import { analyticsService } from './analyticsService'

describe('analyticsService', () => {
  beforeEach(() => {
    window.localStorage.clear()
  })

  it('tracks correct and incorrect answers per word', () => {
    analyticsService.logAnswer('Apple', true)
    analyticsService.logAnswer('apple', true)
    analyticsService.logAnswer('apple', false)

    const stats = analyticsService.getWorstWordsStats()
    const apple = stats.find((s) => s.word === 'apple')

    expect(apple).toBeDefined()
    expect(apple?.correct).toBe(2)
    expect(apple?.incorrect).toBe(1)
  })

  it('sorts words from weakest to strongest accuracy', () => {
    analyticsService.logAnswer('weak', false)
    analyticsService.logAnswer('weak', false)
    analyticsService.logAnswer('mid', true)
    analyticsService.logAnswer('mid', false)
    analyticsService.logAnswer('strong', true)
    analyticsService.logAnswer('strong', true)

    const stats = analyticsService.getWorstWordsStats()
    const words = stats.map((s) => s.word)

    expect(words.indexOf('weak')).toBeLessThan(words.indexOf('mid'))
    expect(words.indexOf('mid')).toBeLessThan(words.indexOf('strong'))
  })

  it('returns an empty list when nothing was tracked', () => {
    expect(analyticsService.getWorstWordsStats()).toEqual([])
  })
})
