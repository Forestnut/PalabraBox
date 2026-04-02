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
  colors: '🎨',
  animals: '🦁',
  food: '🍔',
  family: '👨‍👩‍👧‍👦',
  body: '🩺',
  travel: '✈️',
  grammar: '📏',
  verbs: '🏃',
  vocabulary: '📚',
  daily_life: '☀️',
  basic_situations: '🤝',
  conversation: '💬',
  life: '🌱',
  shopping: '🛍️',
  work: '💼',
  health: '🩺',
  home: '🏠',
  time: '⏳',
  numbers: '🔢',
  basics: '🎓',

}

const idEmojiMap: Record<string, string> = {
  'e11c8282-e565-4f40-8483-e0202e8d3eaa': '🎨',
  '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e': '🐶',
  '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f': '🍔',
  '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a': '👪',
  '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b': '🦵',
  '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c': '✈️',
  'c3cd8c0e-ef75-a403-a415-d847a5ad9377': '👋',
  'a55a651d-faae-e3f7-f23d-8916a4e6da4f': '👤',
  '5cc18025-2de5-5507-c6ca-50ca28ee91ae': '🤝',
  'cd44da6a-6f21-da23-f755-431fd36a2898': '🏃',
  '923c6a4b-051d-6f4d-960d-4b67d3a0ed87': '📦',
  '063a9ff8-017c-71cb-def4-149748527027': '✨',
  '516ee08e-e023-ad9e-10f0-88a9743358e5': '❓',
  '0fca953c-8bff-e618-280c-27634d870c72': '🌮',
  '08a646f5-1f85-7a34-2e86-8247cd35fe6b': '🏘️',
  '796bc90f-8fb8-f15b-e476-01f31e9adc05': '🔢',
  '572d450b-daeb-f6cc-f44b-304212a3b6e2': '⏰',
  'f53bf0d1-e871-ad1e-0ac3-0cc5544add3f': '🏫',
  '06911f6e-9364-b54b-ddd1-d5e5b8deada8': '🛍️',
  '55cf7dc4-248c-02fe-b166-fec134d8f02e': '🍽️',
  '873b34b6-ea4b-7e32-1d02-d04e66b8a3da': '🧳',
  '4891c820-c1ef-3f37-0261-adf23d37cb29': '⏪',
  '12d902f4-4d73-31c4-df6c-36f2d64ab0c6': '⏩',
  'e639a619-a490-0f45-eb60-1d6bac0e2005': '🤔',
  '7160a79c-5864-e2f0-959f-2c527c03886e': '💭',
  '84048b53-8d0c-cc45-5646-69ec64e8522b': '❤️',
  '862f54f8-4b7c-35e6-f6ab-34ef09d005d2': '🎭',
  '0eea0585-0041-eb51-550d-2d830b8e3d65': '💬',
  'c222a766-f685-0d79-5014-9e04c23d8b57': '🗺️',
  '92581f31-6c8f-e2c0-9436-4aceb36c6f12': '💼'
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
  const updateStars = useProgressStore(state => state.updateStars)
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
        const totalStarsOwned = enriched.reduce((sum, e) => sum + e.stars, 0)
        updateStars(totalStarsOwned, enriched.length * 3)
        updateCompletedTotal(completedCount, enriched.length)
        setScenarios(enriched)
        setLoading(false)
        return
      }

      try {
        setLoading(true)
        const { data: normalizedData, error: normalizedError } = await supabase
          .from('scenarios')
          .select('id, category, level, sort_order, scenario_translations!inner(language, title, description)')
          .eq('level', learningLevel)
          .eq('scenario_translations.language', translationLanguage)
          .order('sort_order', { ascending: true })

        let rawData: Scenario[] = []

        if (!normalizedError && normalizedData && normalizedData.length > 0) {
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
              emoji: idEmojiMap[scenario.id] || categoryEmojiMap[scenario.category] || '✨',
              category: scenario.category,
              sort_order: scenario.sort_order,
              created_at: '',
            }
          })
        } else {
          // Fallback for legacy schema: direct fields on scenarios
          const { data: legacyData, error: legacyError } = await supabase
            .from('scenarios')
            .select('*')
            .eq('language', learningLanguage)
            .eq('level', learningLevel)
            .order('sort_order', { ascending: true })

          if (legacyError) {
            throw normalizedError ?? legacyError
          }

          rawData = (legacyData ?? []) as Scenario[]
        }

        scenariosCache[cacheKey] = rawData

        const enriched = getEnriched(rawData)
        const completedCount = enriched.filter(e => e.stars > 0).length
        
        const totalStarsOwned = enriched.reduce((sum, e) => sum + e.stars, 0)
        updateStars(totalStarsOwned, rawData.length * 3)
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
  }, [cacheKey, learningLanguage, learningLevel, updateCompletedTotal])

  return { scenarios, loading, error }
}


