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
   * Zapisuje wynik odpowiedzi na podstawie klucza (np. słowa lub frazy)
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
   * Zwraca statystyki wszystkich słów, opcjonalnie posortowane od najgorszych do najlepszych
   */
  getWorstWordsStats(): WordStats[] {
    const map = this.getStatsMap();
    const stats = Object.values(map);

    // Sortowanie: najpierw te z najmniejszą celnością (correct / total)
    // Jeśli total jest małe, też mogą mieć priorytet
    return stats.sort((a, b) => {
      const totalA = a.correct + a.incorrect;
      const totalB = b.correct + b.incorrect;
      
      const ratioA = totalA > 0 ? a.correct / totalA : 0;
      const ratioB = totalB > 0 ? b.correct / totalB : 0;

      // Im mniejszy stosunek poprawnych odpowiedzi, tym wyżej na liście (najgorsze słowa)
      if (ratioA !== ratioB) {
        return ratioA - ratioB;
      }
      
      // Jeśli ratio jest równe, wybieramy te, gdzie było więcej błędów (lub ogólnie więcej prób jako potwierdzone słabe)
      return b.incorrect - a.incorrect;
    });
  }
}

export const analyticsService = new AnalyticsService();
