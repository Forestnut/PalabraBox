import { useEffect, useState } from 'react';
import { supabase } from '../lib/supabase';
import type { Word } from '../types';
import { useSettingsStore } from '../store/settingsStore';

const CACHE_KEY_PREFIX = 'palabrabox_words_';
const CACHE_TTL_MS = 24 * 60 * 60 * 1000; // 24 hours

interface WordsCache {
  timestamp: number;
  data: Word[];
}

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
  const getRandomWords = (limit: number): Word[] => {
    const shuffled = [...words].sort(() => 0.5 - Math.random());
    return shuffled.slice(0, limit);
  };

  return { words, loading, error, refreshWords, getRandomWords };
}
