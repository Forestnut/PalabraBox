export interface WordStats {
  word: string;
  correct: number;
  incorrect: number;
}

const STORAGE_KEY = 'palabrabox.analytics';

class AnalyticsService {
  private getStatsMap(): Record<string, WordStats> {
    try {
      const raw = window.localStorage.getItem(STORAGE_KEY);
      if (raw) {
        return JSON.parse(raw);
      }
    } catch {
      // ignore
    }
    return {};
  }

  private saveStatsMap(map: Record<string, WordStats>): void {
    window.localStorage.setItem(STORAGE_KEY, JSON.stringify(map));
  }

  /**
    * Stores answer results keyed by a normalized token (for example a word or phrase).
   */
  logAnswer(wordKey: string, isCorrect: boolean): void {
    const map = this.getStatsMap();
    const key = wordKey.toLowerCase().trim();

    if (!map[key]) {
      map[key] = { word: key, correct: 0, incorrect: 0 };
    }

    if (isCorrect) {
      map[key].correct += 1;
    } else {
      map[key].incorrect += 1;
    }

    this.saveStatsMap(map);
  }

  /**
   * Returns tracked word statistics sorted from weakest to strongest performance.
   */
  getWorstWordsStats(): WordStats[] {
    const map = this.getStatsMap();
    const stats = Object.values(map);

    // Prioritize lower accuracy first (correct / total).
    // For ties, prioritize words with more incorrect attempts.
    return stats.sort((a, b) => {
      const totalA = a.correct + a.incorrect;
      const totalB = b.correct + b.incorrect;
      
      const ratioA = totalA > 0 ? a.correct / totalA : 0;
      const ratioB = totalB > 0 ? b.correct / totalB : 0;

      if (ratioA !== ratioB) {
        return ratioA - ratioB;
      }
      
      return b.incorrect - a.incorrect;
    });
  }
}

export const analyticsService = new AnalyticsService();
