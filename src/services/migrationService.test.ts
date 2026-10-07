import { describe, it, expect, beforeEach } from 'vitest'
import { getStateVersion, runMigrations, CURRENT_STATE_VERSION } from './migrationService'
import { useProgressStore } from '../store/progressStore'

describe('migrationService (non-destructive state migrations)', () => {
  beforeEach(() => {
    window.localStorage.clear()
    useProgressStore.setState({ starsByScenario: {} })
  })

  it('stamps the current state version when none exists', () => {
    runMigrations()

    expect(window.localStorage.getItem('pb_state_version')).toBe(String(CURRENT_STATE_VERSION))
    expect(getStateVersion()).toBe(CURRENT_STATE_VERSION)
  })

  it('never touches user progress keys', () => {
    window.localStorage.setItem('palabrabox-progress-storage', '{"points":250}')
    window.localStorage.setItem('palabrabox-settings-storage', '{"speechSpeed":1}')

    runMigrations()

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

    expect(getStateVersion()).toBe(CURRENT_STATE_VERSION)
    expect(window.localStorage.getItem('pb_state_version')).toBe(String(CURRENT_STATE_VERSION))
  })

  it('v1 → v2 imports legacy pb_stars_* keys into the store', () => {
    const idA = '11111111-1111-1111-1111-111111111111'
    const idB = '22222222-2222-2222-2222-222222222222'
    window.localStorage.setItem(`pb_stars_${idA}`, '2')
    window.localStorage.setItem(`pb_stars_${idB}`, '3')
    window.localStorage.setItem('pb_stars_', 'ignored (no id)')

    runMigrations()

    expect(useProgressStore.getState().starsByScenario[idA]).toBe(2)
    expect(useProgressStore.getState().starsByScenario[idB]).toBe(3)
    // original keys are left in place (nothing is ever deleted)
    expect(window.localStorage.getItem(`pb_stars_${idA}`)).toBe('2')
  })

  it('does not downgrade already-imported stars on re-run', () => {
    const id = '11111111-1111-1111-1111-111111111111'
    useProgressStore.setState({ starsByScenario: { [id]: 3 } })
    window.localStorage.setItem(`pb_stars_${id}`, '1') // stale legacy value
    window.localStorage.setItem('pb_state_version', '1')

    runMigrations()

    expect(useProgressStore.getState().starsByScenario[id]).toBe(3)
  })
})
