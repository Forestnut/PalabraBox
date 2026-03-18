import { useEffect, useState } from 'react'
import { supabase } from '../lib/supabase'
import type { Scenario } from '../types'
import { useSettingsStore } from '../store/settingsStore'
import { getScenarioStars } from '../utils/progress'

export interface ScenarioWithProgress extends Scenario {
  stars: number
  isLocked: boolean
}

export function useScenarios() {
  const [scenarios, setScenarios] = useState<ScenarioWithProgress[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const learningLanguage = useSettingsStore((state) => state.learningLanguage) || 'spanish'
  const learningLevel = useSettingsStore((state) => state.learningLevel) || 'beginner'

  useEffect(() => {
    async function fetchScenarios() {
      try {
        setLoading(true)
        const { data, error: err } = await supabase
          .from('scenarios')
          .select('*')
          .eq('language', learningLanguage)
          .eq('level', learningLevel)
          .order('sort_order', { ascending: true })

        if (err) throw err

        // Calculate progress and locked states
        let prevUnlocked = true
        const enriched = (data as Scenario[]).map((scenario, index) => {
          const stars = getScenarioStars(scenario.id)
          // Always unlock the first one, or if the previous one was unlocked AND has > 0 stars
          // We can simplify: always unlock the first scenario, others require prev to have stars.
          // Wait, Task 8 says "Implement lock/unlock logic based on localStorage progress".
          // Let's assume order dictates progression.
          const isLocked = index === 0 ? false : !prevUnlocked
          
          if (stars === 0) {
            prevUnlocked = false // Nex scenarios will be locked
          }

          return {
            ...scenario,
            stars,
            isLocked,
          }
        })

        setScenarios(enriched)
      } catch (err) {
        setError(err instanceof Error ? err.message : String(err))
      } finally {
        setLoading(false)
      }
    }

    fetchScenarios()
  }, [learningLanguage, learningLevel])

  return { scenarios, loading, error }
}
