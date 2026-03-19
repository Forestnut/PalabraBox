# ✅ Harmonogram, Zadania i Główne Źródło Prawdy (TASKS.md)

Ten plik to **GŁÓWNE ŹRÓDŁO WIEDZY** dla projektu **PalabraBox**. Zarządza absolutnie wszystkimi etapami powstawania aplikacji i został zaprojektowany z myślą o pełnej autonomii działania dla programistów oraz agentów AI.

**Oś czasu projektu:** 10 Dni (17–26 Marca 2026)  
**Właściciele:**
- **Jakub (J)** - Architektura Danych, Supabase, Zustand, Logika Biznesowa, Integracje Usług, Custom Hooks, Backend.
- **Błażej (B)** - Interfejs Użytkownika (UI), Routing, Tailwind, Komponenty Prezencyjne, UX/UI, Framer Motion, Mocks.

---

## 🤖 Instrukcje dla Agentów AI (Kluczowe)
Aby praca Jakuba i Błażeja mogła toczyć się **w pełni równolegle**:
1. **Niezależność Środowisk:** Jakub nie pisze komponentów UI, a Błażej nie pisze logiki. Agent modyfikuje tylko pliki właściwe zadaniu.
2. **Mockowanie i Atrapy (Klucz do równoległości):**
   - Jeśli Błażej (B) dostarcza UI a brakuje danych (J) $\rightarrow$ wstaw mock data (`const MOCK_WORDS = [...]`).
   - Jeśli Jakub (J) dostarcza logikę a brakuje guzików (B) $\rightarrow$ wystaw hooka w pliku i napisz mikro-komponent testowy w dowolnym rogu, który tylko go odpala.
3. **Zadania Integracyjne (J+B):** Punkty spotkań (Merge Points), w których mokowane dane zamieniane są na realne połączenia. Są one zazwyczaj zamykane pod koniec każdej fazy.

---

## 🚀 Faza 1: MVP (Minimum Viable Product) [ZAKOŃCZONA]
*Cel fazy: Działająca pętla gry. Rozdzielenie ról nastąpiło po początkowej konfiguracji.*

### 🛠️ Zadania Wspólne MVP
- [x] **TASK-0:** Inicjalizacja Vite, Tailwind, folderów i PWA w postaci wyjściowej. *(J+B)*

### 🧠 Ścieżka Jakuba (J)
- [x] **TASK-J1:** Baza danych Supabase, tabele (`scenarios`, `questions`, `words`), RLS, export typów do TypeScript.
- [x] **TASK-J2:** Stan Globalny (`gameStore.ts`, `settingsStore.ts`) niezależny od renderingu Reacta.
- [x] **TASK-J3:** Logika pobierania i przeliczania gry: `useScenarios`, `useGame`, losowanie punktów i sumowanie żyć.
- [x] **TASK-J4:** Zapis stanu do LocalStorage z `progressService.ts`.

### 🎨 Ścieżka Błażeja (B)
- [x] **TASK-B1:** Wyprowadzenie klas CSS, `Box shadow` w Tailwind. Przygotowanie Button, Card.
- [x] **TASK-B2:** Statyczny Skeleton pod Routing + ładowarki w `react-router-dom` bez twardych linków.
- [x] **TASK-B3:** Layout `SplashScreen` z logiem emoji i layout podstawowego `MainMenu`.
- [x] **TASK-B4:** Ekrany Wyboru (Wizualnie). Kafle Scenariuszy i ekran konfiguracyjny (Mock data).
- [x] **TASK-B5:** Ekran gry `QuestionRenderer` pod typ *MultipleChoice* + prosta prezentacja wyniku w `ResultsScreen.tsx`.

### 🔗 Integracja MVP
- [x] **TASK-I1:** Wpięcie realnych hooków pobierania API na wyprodukowane i oskryptowane widoki.

---

## 🟡 Faza 2: Zawartość, Formaty i Audio (Important) [W TRAKCIE]
*Rozbudowa wariantów pytań i obsługa multimediów. Błażej dba o styl, Jakub buduje mechanikę pod maską.*

### 🧠 Ścieżka Jakuba (J)
- [x] **TASK-J5: Usługa Speech (Web Speech API / TTS)**
  - Implementacja instancji `SpeechService.ts`. Płynne łączenie TTS ze zdarzeniem, by można go zawołać z dowolnego miejsca.
- [x] **TASK-J6: Przechwytywanie Fiszek - Logika (useWords)**
  - Opracowanie logiki pobierania i segregowania wyrazów z bazy Supabase w trybie Offline (zapis na cache przez localStorage lub PWA) `src/hooks/useWords.ts`.
- [x] **TASK-J7: Kontent i Seeding**
  - Stworzenie pełnej konfiguracji 12 modułów językowych w bazie.  
- [x] **TASK-J8: Stan Audio dla Howler.js**
  - Opracowanie metod i serwisu ładującego SFX w pamięć podręczną gry przy starcie do szybkiego użycia w hooku. Nasłuch ustawień Mute.

### 🎨 Ścieżka Błażeja (B)
- [x] **TASK-B6: Layout Pytania Obrazkowego (Image Match)**
  - Ostylowanie opcji i graficzne podpięcie wielkiego pola `<Emoji>` jako pytania.
- [x] **TASK-B7: Layout i Guzik Słuchania (Listening)**
  - Zbudowanie pulsującego `<button>` ze stanem (Mock) "Playing" i przekształcenie wizualne list odpowiedzi z 2x2 na ułożenie szerszych linijek tekstu.
- [x] **TASK-B8: Ekran Zmiany Opcji (Settings UI)**
  - Układ pionowy na komponenty Drag Sliders.
- [x] **TASK-B9: Layout Fiszek Karcianych (Flashcard UI)**
  - Czysto wizualny komponent `FlashCard.tsx` rotujący się w efekcie 3D flipu na CSS oraz kontrolki góra/dół.

### 🔗 Integracja Fazy 2
- [x] **TASK-I2:** Błażej nałożony na dźwięki Jakuba używa ich w komponentach i podłącza event `onPlay` do guzików w ui zadań ze ścieżki słuchowej.

---

## 🟢 Faza 3: Zaawansowana Mechanika Rozgrywki (Stretch Goals)
*Komplikacje pytań polegające na sortowaniu słów i budowie logiki DND.*

### 🧠 Ścieżka Jakuba (J)
- [x] **TASK-J9: Analityka i Moduł Raportu**
  - Prosty system kalkulacji "słów z najgorszym wynikiem" na bazie poprzednich wejść gracza w celach personalizacji fiszek.
- [x] **TASK-J10: Algorytm Dnd-Kit & Moduł Sensors**
  - Jakub instaluje i obudowuje `@dnd-kit/core`. Zajmuje się hookami dotykowymi na komórki (Sensory pointer/touch), tak aby wykluczyć bug scrollowania bez męczenia stylowania.

### 🎨 Ścieżka Błażeja (B)
- [x] **TASK-B10: Wizualne Uzupełnianie Luk**
  - Wyrysowanie interfejsu zdań z odstępami ("_____") animowane tak, żeby po kliknięciu wyraz z banku odlatywał w wyznaczoną dziurę (Framer Motion `layoutId`).
- [x] **TASK-B11: Layout Układanki DND (Word Order)**
  - Błażej wyłącznie dostosowuje grid i style elementów `SortableItem`, ustawiając odległości cieni pod palcem bez ingerencji w logikę przesuwania.
- [x] **TASK-B12: Mascot Wprowadzenie - Boxi Pudełko**
  - Animowany czysty CSS/SVG z idle-loops mrugający do gracza czy wybuchajajcy serduszkami na dobrym wyniku.

### 🔗 Integracja Fazy 3
- [x] **TASK-I3:** Spięcie drag&drop razem z generatorem zdania, przetesowanie responsywności Boxiego.

---

## 🚀 Faza 4: Dostępność Offline i Szlifowanie (Wyjście ze strefy Stretch)
*Finalne uderzenie - dedykowane na ostatnie dni z 10-dniowego deadline-u.*

### 🧠 Ścieżka Jakuba (J)
- [ ] **TASK-J11: PWA Cache Fiszek i Wyników**
  - Konfiguracja logiki workbox-a, by tryb "Tarjetas/Fiszki" działał bez włączonego Wifi, zapis do lokalnego cache API.
- [ ] **TASK-J12: Audyt bezpieczeństwa i czyszczenie stanu**
  - Rozwiązanie problemów z resetowaniem cache na twardo w razie przestarzałych migracji czy starych stanów zapisu graczy.

### 🎨 Ścieżka Błażeja (B)
- [ ] **TASK-B13: Ostatnie poprawki UX / Mobilne wpadki**
  - Blokada podwójnego wciskania przycisków w Mobile Safari/Chrome. Naprawa wycieków cieni i ukrywanie "scroll-x". Poprawa ikon PWA.
- [ ] **TASK-B14: Konfetti w wywiadówkach / Detale**
  - Zwiększenie satysfakcji użytkownika o nowe stany kolorystyczne na ekranach końcowych.

### 🔗 Integracja Faza 4 i Deploy
- [ ] **TASK-I4:** Pełne manualne przejście Quality Assurance na 3 różnych urządzeniach.
- [ ] **TASK-I5:** Eksport na Vercel z ostrym lockiem wersji i oddanie MVP inwestorom.
