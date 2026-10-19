import { useEffect, useState, useCallback } from 'react'
import { isSupabaseConfigured, supabase, SUPABASE_CONFIG_ERROR } from '../lib/supabase'
import type { Level, Word } from '../types'
import { useSettingsStore } from '../store/settingsStore'
import { analyticsService } from '../services/analyticsService'
import { shuffleArray } from '../utils/shuffle'

interface WordTranslationRow {
  language: string
  text: string
  audio_text: string | null
}

interface WordRow {
  id: string
  base_key: string
  category: string
  level: string
  emoji: string | null
  word_translations: WordTranslationRow[]
}

function mapWordRow(row: WordRow): Word | null {
  const en = row.word_translations.find((t) => t.language === 'en')
  const es = row.word_translations.find((t) => t.language === 'es')
  if (!en || !es) return null // incomplete vocabulary entry — content:check guarantees both
  return {
    id: row.id,
    baseKey: row.base_key,
    category: row.category,
    level: row.level as Level,
    emoji: row.emoji,
    en: { text: en.text, audioText: en.audio_text },
    es: { text: es.text, audioText: es.audio_text },
  }
}

/**
 * Provides word collections for flashcards, joined with their en/es
 * translations (normalized schema: words + word_translations).
 *
 * Offline support is handled by the PWA service worker (runtime caching of
 * Supabase REST responses) — there is deliberately no second localStorage
 * cache layer here.
 */
export function useWords(category?: string) {
  const [words, setWords] = useState<Word[]>([])
  const [loading, setLoading] = useState<boolean>(true)
  const [error, setError] = useState<string | null>(null)
  const [refreshTrigger, setRefreshTrigger] = useState(0)

  const learningLevel = useSettingsStore((state) => state.learningLevel) || 'beginner'

  useEffect(() => {
    async function fetchWords() {
      if (!isSupabaseConfigured) {
        setError(SUPABASE_CONFIG_ERROR)
        setLoading(false)
        return
      }

      try {
        setLoading(true)
        setError(null)

        let query = supabase
          .from('words')
          .select(
            'id, base_key, category, level, emoji, word_translations(language, text, audio_text)',
          )
          .eq('level', learningLevel)
          .order('base_key', { ascending: true })

        if (category) {
          query = query.eq('category', category)
        }

        const { data, error: sbError } = await query

        if (sbError) {
          throw new Error(sbError.message)
        }

        const mapped = ((data ?? []) as WordRow[])
          .map(mapWordRow)
          .filter((w): w is Word => w !== null)

        setWords(mapped)
      } catch (err: unknown) {
        setError(err instanceof Error ? err.message : String(err))
        console.error('Error fetching words:', err)
      } finally {
        setLoading(false)
      }
    }

    fetchWords()
  }, [learningLevel, category, refreshTrigger])

  /**
   * Forcefully fetches fresh words from the database.
   */
  const refreshWords = () => {
    setRefreshTrigger((prev) => prev + 1)
  }

  /**
   * Helper function to get random flashcards a subset of words.
   * @param limit How many words to pick
   */
  const getRandomWords = useCallback(
    (limit: number): Word[] => {
      const uniqueMap = new Map<string, Word>()
      for (const w of words) {
        uniqueMap.set(w.baseKey, w)
      }
      return shuffleArray(Array.from(uniqueMap.values())).slice(0, limit)
    },
    [words],
  )

  /**
   * Helper function to get personalized flashcards based on worst performance.
   * Words with worst scores are prioritized.
   * @param limit How many words to pick.
   */
  const getPersonalizedWords = useCallback(
    (limit: number): Word[] => {
      if (words.length === 0) return []

      // 1. Deduplicate by base_key
      const uniqueMap = new Map<string, Word>()
      for (const w of words) {
        uniqueMap.set(w.baseKey, w)
      }
      const uniqueWords = Array.from(uniqueMap.values())

      // 2. Base random shuffle to ensure fair distribution of untested cards
      const shuffled = shuffleArray([...uniqueWords])

      const stats = analyticsService.getWorstWordsStats()
      const statsMap = new Map(stats.map((s) => [s.word.toLowerCase(), s]))

      // 3. Sort by priority (weakest first)
      const sortedWords = shuffled.sort((a, b) => {
        const statA = statsMap.get(a.en.text.toLowerCase())
        const statB = statsMap.get(b.en.text.toLowerCase())

        const ratioA = statA ? statA.correct / (statA.correct + statA.incorrect) : 0.5
        const ratioB = statB ? statB.correct / (statB.correct + statB.incorrect) : 0.5

        if (ratioA !== ratioB) {
          return ratioA - ratioB // Lower ratio means weaker performance, so it gets higher priority.
        }

        if (statA && statB) {
          return statB.incorrect - statA.incorrect // More mistakes should be reviewed first.
        }

        // Preserve the shuffled order if stats are identical
        return 0
      })

      return sortedWords.slice(0, limit)
    },
    [words],
  )

  return { words, loading, error, refreshWords, getRandomWords, getPersonalizedWords }
}
