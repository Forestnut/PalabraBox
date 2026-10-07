import { describe, it, expect, beforeEach } from 'vitest'
import { getScenarioStars, saveScenarioStars } from './progress'
import { useProgressStore } from '../store/progressStore'

const SCENARIO_ID = '11111111-1111-1111-1111-111111111111'

describe('scenario stars (progress store backed)', () => {
  beforeEach(() => {
    window.localStorage.clear()
    useProgressStore.setState({ starsByScenario: {} })
  })

  it('returns 0 for a scenario with no saved stars', () => {
    expect(getScenarioStars(SCENARIO_ID)).toBe(0)
  })

  it('saves stars into the store and reads them back', () => {
    saveScenarioStars(SCENARIO_ID, 2)

    expect(useProgressStore.getState().starsByScenario[SCENARIO_ID]).toBe(2)
    expect(getScenarioStars(SCENARIO_ID)).toBe(2)
  })

  it('keeps the highest score (never downgrades)', () => {
    saveScenarioStars(SCENARIO_ID, 3)
    saveScenarioStars(SCENARIO_ID, 1)

    expect(getScenarioStars(SCENARIO_ID)).toBe(3)
  })

  it('clamps stars to the 0–3 range', () => {
    saveScenarioStars(SCENARIO_ID, 7)

    expect(getScenarioStars(SCENARIO_ID)).toBe(3)
  })

  it('stores stars per scenario independently', () => {
    const otherId = '22222222-2222-2222-2222-222222222222'
    saveScenarioStars(SCENARIO_ID, 1)
    saveScenarioStars(otherId, 3)

    expect(getScenarioStars(SCENARIO_ID)).toBe(1)
    expect(getScenarioStars(otherId)).toBe(3)
  })
})
