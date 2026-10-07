/**
 * Scenario stars helpers backed by the progress store (single source of truth).
 * Kept as functions so hooks can read/write stars without prop drilling.
 */
import { useProgressStore } from '../store/progressStore'

export function getScenarioStars(scenarioId: string): number {
  return useProgressStore.getState().starsByScenario[scenarioId] ?? 0
}

export function saveScenarioStars(scenarioId: string, stars: number) {
  useProgressStore.getState().setScenarioStars(scenarioId, stars)
}
