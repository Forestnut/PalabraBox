import { useEffect, useState } from 'react'
import { isSupabaseConfigured, supabase, SUPABASE_CONFIG_ERROR } from '../lib/supabase'
import type { Scenario, ScenarioWithProgress, Level } from '../types'
import { useSettingsStore } from '../store/settingsStore'
import { getScenarioStars } from '../utils/progress'
import { useProgressStore } from '../store/progressStore'

/** The app UI is Spanish; scenario titles/descriptions are served in this language. */
const UI_LANGUAGE = 'es'
const FALLBACK_EMOJI = '✨'

// Simple in-memory cache to avoid refetching scenarios across page navigation
const scenariosCache: Record<string, Scenario[]> = {}

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

interface ScenarioTranslationRow {
  language: string
  title: string
  description: string | null
}

interface ScenarioRow {
  id: string
  category: string
  level: string
  sort_order: number | null
  emoji: string | null
  scenario_translations: ScenarioTranslationRow[]
}

/**
 * Custom hook to fetch scenarios for the current level.
 * Titles/descriptions come from scenario_translations in the UI language (es),
 * emoji from scenarios.emoji (populated by the content migration).
 *
 * @returns Object containing the scenarios array, loading boolean, and error string.
 */
export function useScenarios() {
  const learningLevel = useSettingsStore((state) => state.learningLevel) || 'beginner'
  const updateCompletedTotal = useProgressStore((state) => state.updateCompletedTotal)
  const setPossibleStars = useProgressStore((state) => state.setPossibleStars)

  const cacheKey = learningLevel

  const getEnriched = (rawData: Scenario[]): ScenarioWithProgress[] => {
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
      if (!isSupabaseConfigured) {
        setError(SUPABASE_CONFIG_ERROR)
        setLoading(false)
        return
      }

      // If cached, sync store but don't show loading
      if (scenariosCache[cacheKey]) {
        const enriched = getEnriched(scenariosCache[cacheKey])
        const completedCount = enriched.filter((e) => e.stars > 0).length
        setPossibleStars(enriched.length * 3)
        updateCompletedTotal(completedCount, enriched.length)
        setScenarios(enriched)
        setLoading(false)
        return
      }

      try {
        setLoading(true)
        const { data, error: fetchError } = await supabase
          .from('scenarios')
          .select(
            'id, category, level, sort_order, emoji, scenario_translations!inner(language, title, description)',
          )
          .eq('level', learningLevel)
          .eq('scenario_translations.language', UI_LANGUAGE)
          .order('sort_order', { ascending: true })

        if (fetchError) throw fetchError

        const rawData: Scenario[] = ((data ?? []) as ScenarioRow[]).map((scenario) => {
          const translation = scenario.scenario_translations?.[0]
          return {
            id: scenario.id,
            title: translation?.title ?? scenario.category,
            description: translation?.description ?? null,
            emoji: scenario.emoji ?? FALLBACK_EMOJI,
            category: scenario.category,
            level: scenario.level as Level,
            sort_order: scenario.sort_order ?? 0,
          }
        })

        scenariosCache[cacheKey] = rawData

        const enriched = getEnriched(rawData)
        const completedCount = enriched.filter((e) => e.stars > 0).length

        setPossibleStars(rawData.length * 3)
        updateCompletedTotal(completedCount, rawData.length)
        setScenarios(enriched)
      } catch (err) {
        setError(getErrorMessage(err))
      } finally {
        setLoading(false)
      }
    }

    fetchScenarios()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [cacheKey, learningLevel, updateCompletedTotal])

  return { scenarios, loading, error }
}
