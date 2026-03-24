import { useEffect, useState } from 'react'
import { supabase } from '../lib/supabase'
import type { Scenario } from '../types'
import { useSettingsStore } from '../store/settingsStore'
import { getScenarioStars } from '../utils/progress'

export interface ScenarioWithProgress extends Scenario {
  stars: number
  isLocked: boolean
}

// Simple in-memory cache to avoid refetching scenarios across page navigation
const scenariosCache: Record<string, Scenario[]> = {}

export function useScenarios() {
  const [scenarios, setScenarios] = useState<ScenarioWithProgress[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const learningLanguage = useSettingsStore((state) => state.learningLanguage) || 'english'
  const learningLevel = useSettingsStore((state) => state.learningLevel) || 'beginner'

  useEffect(() => {
    async function fetchScenarios() {
      try {
        setLoading(true)
        const cacheKey = `${learningLanguage}-${learningLevel}`
        let rawData: Scenario[] = []

        if (scenariosCache[cacheKey]) {
          rawData = scenariosCache[cacheKey]
        } else {
          const { data, error: err } = await supabase
            .from('scenarios')
            .select('*')
            .eq('language', learningLanguage)
            .eq('level', learningLevel)
            .order('sort_order', { ascending: true })

          if (err) throw err
          rawData = data as Scenario[]
          scenariosCache[cacheKey] = rawData
        }

        // Always re-calculate progress and locked states to ensure fresh local progress is read
        let prevUnlocked = true
        let completedCount = 0
        const enriched = rawData.map((scenario, index) => {
          const stars = getScenarioStars(scenario.id)
          const isLocked = index === 0 ? false : !prevUnlocked
          
          if (stars > 0) {
             completedCount++;
          }
          if (stars === 0) {
            prevUnlocked = false
          }

          return {
            ...scenario,
            stars,
            isLocked,
          }
        })
        
        // Sync true values to the fast global store whenever we fetch/re-evaluate scenarios
        import('../services/progressService').then(({ progressService }) => {
          progressService.updateCompletedTotal(completedCount, rawData.length)
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
