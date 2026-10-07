import { describe, it, expect, beforeEach } from 'vitest'
import { getStateVersion, runMigrations } from './migrationService'

describe('migrationService (non-destructive state migrations)', () => {
  beforeEach(() => {
    window.localStorage.clear()
  })

  it('stamps the current state version when none exists', () => {
    runMigrations()

    expect(window.localStorage.getItem('pb_state_version')).toBe('1')
    expect(getStateVersion()).toBe(1)
  })

  it('never touches user progress keys', () => {
    window.localStorage.setItem('pb_stars_11111111-1111-1111-1111-111111111111', '3')
    window.localStorage.setItem('palabrabox-progress-storage', '{"points":250}')
    window.localStorage.setItem('palabrabox-settings-storage', '{"speechSpeed":1}')

    runMigrations()

    expect(window.localStorage.getItem('pb_stars_11111111-1111-1111-1111-111111111111')).toBe('3')
    expect(window.localStorage.getItem('palabrabox-progress-storage')).toBe('{"points":250}')
    expect(window.localStorage.getItem('palabrabox-settings-storage')).toBe('{"speechSpeed":1}')
  })

  it('is idempotent — running twice changes nothing', () => {
    runMigrations()
    const afterFirst = window.localStorage.getItem('pb_state_version')

    runMigrations()

    expect(window.localStorage.getItem('pb_state_version')).toBe(afterFirst)
  })

  it('recovers from a corrupted version stamp', () => {
    window.localStorage.setItem('pb_state_version', 'not-a-number')

    runMigrations()

    expect(getStateVersion()).toBe(1)
    expect(window.localStorage.getItem('pb_state_version')).toBe('1')
  })
})
