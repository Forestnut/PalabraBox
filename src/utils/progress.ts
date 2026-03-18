export function getScenarioStars(scenarioId: string): number {
  const saved = localStorage.getItem(`pb_stars_${scenarioId}`)
  return saved ? parseInt(saved, 10) : 0
}

export function saveScenarioStars(scenarioId: string, stars: number) {
  const current = getScenarioStars(scenarioId)
  if (stars > current) {
    localStorage.setItem(`pb_stars_${scenarioId}`, stars.toString())
  }
}
