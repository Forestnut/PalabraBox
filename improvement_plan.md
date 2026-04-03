# PalabraBox Master Plan: Naprawa i Rozwój (Faza 4)

Niniejszy plan stanowi kompleksową strategię rozwiązania zgłoszonych problemów z danymi, UI oraz systemem progresji. Plan skupia się na jakości danych (AI data extraction) oraz estetyce interfejsu.

## 1. Drag & Drop: Estetyka i Stabilność (`WordOrder.tsx`)
Celem jest powrót do klasycznego wyglądu "linii" (underscores) przy zachowaniu pełnej responsywności.

- **Przywrócenie Slotów**: Zamiast jednego bloku, każda sekcja w strefie `dropZone` będzie wizualnie reprezentowana przez poziomą linię (border-b-2) o szerokości dopasowanej do słowa.
- **Dynamiczne Rozmieszczenie**: Użycie `flex-wrap` w strefie upuszczania, co pozwoli liniom automatycznie przechodzić do nowego rzędu na małych ekranach.
- **Bezpieczny Margines**: Zwiększenie `padding-bottom` w kontenerze zadań, aby bank słów (dolny panel) nigdy nie nakładał się na ostatnie linie zadania, nawet przy długich zdaniach.
- **Hover/Active States**: Dodanie subtelnych animacji (`framer-motion`) przy "wskakiwaniu" słowa na linię, aby UX był "premium".

## 2. Poprawa Jakości i Deduplikacji Pytań (`useGame.ts`)
Rozwiązanie problemu powtarzających się i pustych pytań.

- **Inteligentna Ekstrakcja JSONB**:
  - Priorytet: `data.sentence` / `data.phrase`.
  - Fallback 1: `data.word` (dla słownictwa).
  - Fallback 2: Przetworzenie pól `translation_es` / `translation_en` jako źródła pytania.
  - **Bezpiecznik**: Jeśli pole "źródłowe" (to, co użytkownik ma przetłumaczyć) jest puste lub równe `undefined`, pytanie zostanie odrzucone przed dodaniem do puli gry.
- **Blokada Powtórek Sesji**:
  - Wprowadzenie `SessionBlacklist` w `gameStore.ts`.
  - Każde zadane pytanie trafia na czarną listę na czas trwania sesji przeglądarki.
  - Przy losowaniu, pytania z czarnej listy są pomijane, dopóki baza nie zostanie wyczerpana.

## 3. Nowy System Progresji: Gwiazdki (`progressStore.ts` & `MainMenu.tsx`)
Zastąpienie punktów i poziomów (Nivel) rzetelnym licznikiem postępu scenariuszy.

- **Logika Gwiazdek**:
  - `progressStore` będzie agregować sumę wszystkich gwiazdek zapisanych w `localStorage` (pobieranych z bazy Supabase przy starcie).
  - Obliczenie: `totalStarsOwned` vs `totalPossibleStars` (Liczba scenariuszy * 3).
- **Interfejs MainMenu**:
  - Zamiast paska "Poziom 1", wyświetlimy kartę **Postęp Globalny**.
  - Ikona dużej, złotej gwiazdy (FontAwesome `faStar` z gradientem).
  - Tekst: `42 / 150 Gwiazdek` (wartości dynamiczne).
  - Pasek postępu pod licznikiem, pokazujący procentową drogę do ukończenia całego kursu.

## 4. Przegląd i Czyszczenie Kodu (QA)
- **Logowanie Błędów**: Dodanie `console.info` przy odrzucaniu pustych pytań, aby ułatwić debugowanie bazy danych w przyszłości.
- **Weryfikacja Typów**: Pełny przebieg `npx tsc` po zmianach struktury `gameStore`.

---
> [!NOTE]
> Zgodnie z instrukcją, powyższy plan został tylko zapisany jako dokumentacja i **nie został jeszcze wykonany**. 
