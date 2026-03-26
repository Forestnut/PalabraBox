import { useEffect, useState, useCallback } from 'react';
import { supabase } from '../lib/supabase';
import type { Word } from '../types';
import { useSettingsStore } from '../store/settingsStore';
import { analyticsService } from '../services/analyticsService';

const CACHE_KEY_PREFIX = 'palabrabox_words_';
const CACHE_TTL_MS = 24 * 60 * 60 * 1000; // 24 hours

interface WordsCache {
  timestamp: number;
  data: Word[];
}

/**
 * Provides cached and personalized word collections for flashcards and exercises.
 */
export function useWords(category?: string) {
  const [words, setWords] = useState<Word[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);
  const [refreshTrigger, setRefreshTrigger] = useState(0);

  const learningLanguage = useSettingsStore((state) => state.learningLanguage) || 'english';
  const learningLevel = useSettingsStore((state) => state.learningLevel) || 'beginner';

  useEffect(() => {
    async function fetchWords() {
      try {
        setLoading(true);
        setError(null);

        const cacheKey = `${CACHE_KEY_PREFIX}${learningLanguage}_${learningLevel}${category ? `_${category}` : ''}`;
        
        // 1. Check offline cache
        const cachedItem = localStorage.getItem(cacheKey);
        if (cachedItem) {
          try {
            const parsedCache: WordsCache = JSON.parse(cachedItem);
            const isExpired = Date.now() - parsedCache.timestamp > CACHE_TTL_MS;
            
            if (!isExpired && Array.isArray(parsedCache.data)) {
              setWords(parsedCache.data);
              
              // If we are completely offline and have valid cache, just return
              if (typeof navigator !== 'undefined' && !navigator.onLine) {
                setLoading(false);
                return;
              }
            }
          } catch (e) {
            console.warn('Failed to parse cache for words', e);
          }
        }

        // 2. Fetch fresh data from Supabase
        let query = supabase
          .from('words')
          .select('*')
          .eq('language', learningLanguage)
          .eq('level', learningLevel);
          
        if (category) {
          query = query.eq('category', category);
        }

        const { data, error: sbError } = await query;

        if (sbError) {
          // If network failed but we have cached words (maybe expired), keep them on screen
          if (words.length > 0) {
            console.warn('Failed to fetch from Supabase, using stale cache', sbError);
            return;
          }
          throw new Error(sbError.message);
        }

        if (data) {
          const freshWords = data as Word[];
          setWords(freshWords);
          
          // 3. Save to LocalStorage cache
          localStorage.setItem(cacheKey, JSON.stringify({
            timestamp: Date.now(),
            data: freshWords
          } as WordsCache));
        }

      } catch (err: unknown) {
        setError(err instanceof Error ? err.message : String(err));
        console.error('Error fetching words:', err);
      } finally {
        setLoading(false);
      }
    }

    fetchWords();
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [learningLanguage, learningLevel, category, refreshTrigger]);

  /**
   * Forcefully fetches fresh words from the database, bypassing cache TTL.
   */
  const refreshWords = () => {
    setRefreshTrigger((prev) => prev + 1);
  };

  /**
   * Helper function to get random flashcards a subset of words.
   * @param limit How many words to pick
   */
  const getRandomWords = useCallback((limit: number): Word[] => {
    const uniqueMap = new Map<string, Word>();
    for (const w of words) {
      uniqueMap.set(w.word.toLowerCase(), w);
    }
    const uniqueWords = Array.from(uniqueMap.values());

    const shuffled = [...uniqueWords];
    for (let i = shuffled.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
    }
    return shuffled.slice(0, limit);
  }, [words]);

  /**
   * Helper function to get personalized flashcards based on worst performance.
   * Words with worst scores are prioritized. 
   * @param limit How many words to pick.
   */
  const getPersonalizedWords = useCallback((limit: number): Word[] => {
    if (words.length === 0) return [];
    
    // 1. Deduplicate
    const uniqueMap = new Map<string, Word>();
    for (const w of words) {
      uniqueMap.set(w.word.toLowerCase(), w);
    }
    const uniqueWords = Array.from(uniqueMap.values());

    // 2. Base Random Shuffle (Fisher-Yates) to ensure fair distribution of untested cards
    const shuffled = [...uniqueWords];
    for (let i = shuffled.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
    }

    const stats = analyticsService.getWorstWordsStats();
    const statsMap = new Map(stats.map(s => [s.word.toLowerCase(), s]));

    // 3. Sort by priority
    const sortedWords = shuffled.sort((a, b) => {
      const statA = statsMap.get(a.word.toLowerCase());
      const statB = statsMap.get(b.word.toLowerCase());

      const ratioA = statA ? (statA.correct / (statA.correct + statA.incorrect)) : 0.5;
      const ratioB = statB ? (statB.correct / (statB.correct + statB.incorrect)) : 0.5;

      if (ratioA !== ratioB) {
        return ratioA - ratioB; // Lower ratio means weaker performance, so it gets higher priority.
      }

      if (statA && statB) {
        return statB.incorrect - statA.incorrect; // More mistakes should be reviewed first.
      }

      // Preserve the shuffled order if stats are identical
      return 0; 
    });

    return sortedWords.slice(0, limit);
  }, [words]);

  return { words, loading, error, refreshWords, getRandomWords, getPersonalizedWords };
}
