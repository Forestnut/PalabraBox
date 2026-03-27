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

const categoryEmojiMap: Record<string, string> = {
  basics: '👋',
  travel: '✈️',
  food: '🍽️',
  shopping: '🛍️',
  work: '💼',
  health: '🏥',
  home: '🏠',
  family: '👨‍👩‍👧‍👦',
  time: '⏰',
  numbers: '🔢',
  grammar: '🧩',
  conversation: '💬',
}

function getErrorMessage(err: unknown): string {
  if (err instanceof Error) return err.message
  if (typeof err === 'string') return err
  if (err && typeof err === 'object') {
    const maybeMessage = 'message' in err ? err.message : null
    if (typeof maybeMessage === 'string' && maybeMessage.length > 0) return maybeMessage

    const maybeDetails = 'details' in err ? err.details : null
    if (typeof maybeDetails === 'string' && maybeDetails.length > 0) return maybeDetails
  }

  return 'Unknown error while loading scenarios.'
}

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
  const translationLanguage = 'en'

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
        const { data: legacyData, error: legacyError } = await supabase
          .from('scenarios')
          .select('*')
          .eq('language', learningLanguage)
          .eq('level', learningLevel)
          .order('sort_order', { ascending: true })

        let rawData: Scenario[] = []

        if (!legacyError) {
          rawData = (legacyData ?? []) as Scenario[]
        } else {
          // Fallback for normalized schema: scenarios + scenario_translations
          const { data: normalizedData, error: normalizedError } = await supabase
            .from('scenarios')
            .select('id, category, level, sort_order, scenario_translations!inner(language, title, description)')
            .eq('level', learningLevel)
            .eq('scenario_translations.language', translationLanguage)
            .order('sort_order', { ascending: true })

          if (normalizedError) throw normalizedError

          rawData = ((normalizedData ?? []) as Array<{
            id: string
            category: string
            level: string
            sort_order: number
            scenario_translations: Array<{
              language: string
              title: string
              description: string | null
            }>
          }>).map((scenario) => {
            const translation = scenario.scenario_translations?.[0]
            const title = translation?.title ?? scenario.category

            return {
              id: scenario.id,
              title,
              title_display: title,
              language: learningLanguage,
              level: scenario.level as Scenario['level'],
              description: translation?.description ?? null,
              emoji: categoryEmojiMap[scenario.category] ?? '📘',
              category: scenario.category,
              sort_order: scenario.sort_order,
              created_at: '',
            }
          })
        }

        scenariosCache[cacheKey] = rawData

        const enriched = getEnriched(rawData)
        const completedCount = enriched.filter(e => e.stars > 0).length
        
        updateCompletedTotal(completedCount, rawData.length)
        setScenarios(enriched)
      } catch (err) {
        setError(getErrorMessage(err))
      } finally {
        setLoading(false)
      }
    }

    fetchScenarios()
  }, [cacheKey, learningLanguage, learningLevel, updateCompletedTotal])

  return { scenarios, loading, error }
}


