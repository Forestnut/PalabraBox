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
    const shuffled = [...words].sort(() => 0.5 - Math.random());
    return shuffled.slice(0, limit);
  }, [words]);

  /**
   * Helper function to get personalized flashcards based on worst performance.
   * Words with worst scores are prioritized. 
   * @param limit How many words to pick.
   */
  const getPersonalizedWords = useCallback((limit: number): Word[] => {
    if (words.length === 0) return [];
    
    const stats = analyticsService.getWorstWordsStats();
    
    // Create a map for quick lookup
    const statsMap = new Map(stats.map(s => [s.word.toLowerCase(), s]));

    const sortedWords = [...words].sort((a, b) => {
      // Słowa, które w ogóle nie były przerabiane w statystykach, można traktować różnie.
      // Dajmy im neutralną wartość, ale jeśli mamy words ze złymi statystykami, powinny być wyżej.
      const statA = statsMap.get(a.word.toLowerCase());
      const statB = statsMap.get(b.word.toLowerCase());

      // Jeśli słowo nie ma statystyk, traktujemy je średnio/losowo (0.5 ratio, 0 incorrect)
      const ratioA = statA ? (statA.correct / (statA.correct + statA.incorrect)) : 0.5;
      const ratioB = statB ? (statB.correct / (statB.correct + statB.incorrect)) : 0.5;

      if (ratioA !== ratioB) {
        return ratioA - ratioB; // Mniejsze ratio win -> idzie wyżej
      }

      if (statA && statB) {
        return statB.incorrect - statA.incorrect; // Więcej wpadek win -> wyżej
      }

      // Jeśli oba nie mają, zostawiamy jako losowe lub bez zmiany
      return 0.5 - Math.random(); 
    });

    return sortedWords.slice(0, limit);
  }, [words]);

  return { words, loading, error, refreshWords, getRandomWords, getPersonalizedWords };
}
