import { useEffect, useState } from 'react'
import { supabase } from '../lib/supabase'
import type { Scenario } from '../types'
import { useSettingsStore } from '../store/settingsStore'
import { getScenarioStars } from '../utils/progress'
import { useProgressStore } from '../store/progressStore'

export interface ScenarioWithProgress extends Scenario {
  stars: number
  isLocked: boolean
}

// Simple in-memory cache to avoid refetching scenarios across page navigation
const scenariosCache: Record<string, Scenario[]> = {}

/**
 * Custom hook to fetch and manage scenarios for the current learning language and level.
 * Connects to Supabase for data and relies on local storage for progression states.
 * 
 * @returns Object containing the scenarios array, loading boolean, and error string.
 */
export function useScenarios() {
  const learningLanguage = useSettingsStore((state) => state.learningLanguage) || 'english'
  const learningLevel = useSettingsStore((state) => state.learningLevel) || 'beginner'
  const updateCompletedTotal = useProgressStore(state => state.updateCompletedTotal)

  const cacheKey = `${learningLanguage}-${learningLevel}`

  const getEnriched = (rawData: Scenario[]) => {
    let prevUnlocked = true
    return rawData.map((scenario, index) => {
      const stars = getScenarioStars(scenario.id)
      const isLocked = index === 0 ? false : !prevUnlocked
      
      if (stars === 0) prevUnlocked = false

      return { ...scenario, stars, isLocked }
    })
  }

  const [scenarios, setScenarios] = useState<ScenarioWithProgress[]>(() => {
    if (scenariosCache[cacheKey]) {
      return getEnriched(scenariosCache[cacheKey])
    }
    return []
  })
  const [loading, setLoading] = useState(!scenariosCache[cacheKey])
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    async function fetchScenarios() {
      // If cached, sync store but don't show loading
      if (scenariosCache[cacheKey]) {
        const enriched = getEnriched(scenariosCache[cacheKey])
        const completedCount = enriched.filter(e => e.stars > 0).length
        updateCompletedTotal(completedCount, enriched.length)
        setScenarios(enriched)
        setLoading(false)
        return
      }

      try {
        setLoading(true)
        const { data, error: err } = await supabase
          .from('scenarios')
          .select('*')
          .eq('language', learningLanguage)
          .eq('level', learningLevel)
          .order('sort_order', { ascending: true })

        if (err) throw err
        const rawData = data as Scenario[]
        scenariosCache[cacheKey] = rawData

        const enriched = getEnriched(rawData)
        const completedCount = enriched.filter(e => e.stars > 0).length
        
        updateCompletedTotal(completedCount, rawData.length)
        setScenarios(enriched)
      } catch (err) {
        setError(err instanceof Error ? err.message : String(err))
      } finally {
        setLoading(false)
      }
    }

    fetchScenarios()
  }, [cacheKey, learningLanguage, learningLevel, updateCompletedTotal])

  return { scenarios, loading, error }
}


