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
  const [scenarios, setScenarios] = useState<ScenarioWithProgress[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const learningLanguage = useSettingsStore((state) => state.learningLanguage) || 'english'
  const learningLevel = useSettingsStore((state) => state.learningLevel) || 'beginner'

  // Grab the update function from store once to make sure dependency array is stable
  const updateCompletedTotal = useProgressStore(state => state.updateCompletedTotal)

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
        
        // Sync true values to the global store 
        updateCompletedTotal(completedCount, rawData.length)

        setScenarios(enriched)
      } catch (err) {
        setError(err instanceof Error ? err.message : String(err))
      } finally {
        setLoading(false)
      }
    }

    fetchScenarios()
  }, [learningLanguage, learningLevel, updateCompletedTotal])

  return { scenarios, loading, error }
}

