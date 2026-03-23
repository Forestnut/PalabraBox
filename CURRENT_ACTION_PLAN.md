## Plan: Aktualne Poprawki UX/UI i Optymalizacja

Plan obejmuje szybkie i konkretne działania naprawcze dla najbardziej widocznych problemów zgłoszonych przez użytkowników — od logicznych błędów w w zadaniach, poprzez niejasny system oceniania, aż po kompleksowy redesign zachowań maskotki Boxika oraz usprawnienia wydajności.

**Kroki**
1. **Faza 1: Globalny loader i usunięcie SplashScreen z routera**
   - Usunięcie ścieżki `/splash` z routera.
   - Stworzenie pełnoekranowego komponentu `LoaderOverlay`, który wyświetla Boxika.
   - Wdrożenie loadera w głównym komponencie `App.tsx` w oparciu o stan inicjalizacji aplikacji (np. pobieranie sesji).
2. **Faza 2: Naprawa logiki zadań Word Order (Drag & Drop)**
   - Poprawa UI: Wyświetlanie czytelniejszego polecenia nad strefą rzutu, np. "Ułóż zdanie: ...".
   - Weryfikacja: W bazie danych zdanie do ułożenia ma klucz odpowiedzi, np. "the color is red". Sprawdzenie czy walidator ignoruje wielkość liter i białe znaki po obu stronach kafelka.
   - Zmiana błędnych dystraktorów w plikach seed (np. z `['sun', 'not', 'blue']` do bardziej spójnych z logiką tłumaczonego zdania).
3. **Faza 3: Uspójnienie punktacji i przyznawania gwiazdek**
   - Dodanie sztywnej zasady obliczania gwiazdek (np. 0. błędów = 3 gwiazdki, 1 błąd = 2 gwiazdki, 2+ lub timeout = 1 gwiazdka).
   - Wprowadzenie feedbacku dla gracza na finalnym ekranie podsumowującym: pokazanie, skąd dany wynik.
4. **Faza 4: Optymalizacja i Skeletons na liście Scenariuszy**
   - Refaktoryzacja pobierania danych w komponencie Scenariuszy: wymuszenie jednorazowego załadowania z opcjonalnym cachem.
   - Zaimplementowanie atrakcyjnych animacji ładowania układu ("Skeletons"), co zmniejszy wrażenie dłuższego wczytywania.
5. **Faza 5: Totalny remont maskotki "Boxik" (Design i Animacje)** (*Rozbite na wiele podzadań zależnych od stanów Boxika*)
   - **Stan Zamknięty**: Dodanie widocznej szparki / taśmy klejącej na środku dachu Boxika (zarówno na ekranie ładowania, jak i na menu pomiedzy pytaniami czy w płaczącym boxiku na końcu).
   - **Stan Otwarty**: Przebudowa warstw SVG -> skrzydełka boczne naturalnie opadające na boki/dół od ciężaru tektury. Skrócone przednie ramię, aby nie zasłaniało jego twarzy i oczu (np. widoczne w menu głównym).
   - **Błąd w scenariuszu**: Naprawa błędów widocznych w ekranie scenariusza (widmo/przezroczystość, brak ciągłości wektora). Scalenie konturów i wyrównanie go z resztą stylistyki aplikacji.
   - **Mikrointerakcje i UI**: Boxik mrugający / odskakujący na najechanie kursorem (hover).
   - **Rozbudowa reaktywności gry**: Stan poprawnej odpowiedzi -> radosny podskok Boxika; stan złej -> miny zniechęcenia/obrzydzenia/trzęsące się pudełko; długi czas namysłu gracza -> zmrużone oczy, stan drzemki.

**Wymagane Pliki (Przykładowe)**
- `src/App.tsx`, `src/pages/SplashScreen.tsx` — przeniesienie działania ekranu ładowania.
- `src/components/questions/WordOrder.tsx` (oraz ew. `supabase/seed.sql`) — do edycji układania zdań i kafelków.
- `src/services/progressService.ts` — logika punktacji.
- `src/hooks/useScenarios.ts` — dodanie loadera/cache do scenariuszy.
- `Projektowe pliki SVG w public/ / src/components/ui/Boxik.tsx` - gruntowne zmiany widoków UI dla bohatera, dodanie nowych wariantów i obsługi wariantów warunkowych poprzez propsy.

**Weryfikacja**
1. Test loadera: Wejście w aplikację przy spowolnionym symulowanym połączeniu - aplikacja pokazuje loader zamiast nawigować do osobnej pustej strony `/splash`.
2. Test układania: Poprawne ułożenie zdania bez wrażliwości na pierwszą wielką literę - zadanie uznane z sukcesem.
3. Boxika wgląd: Ręczne wejście na ekrany: (1) Scenario, (2) Loadings, (3) Win/Lose i wizualna weryfikacja czy skrzydła są opadnięte w otwartym i prawidłowo osadzone, sklejone taśmą przy zamknięciu.

**Dodatkowe przemyślenia**
- *Zależności:* Fazy mogą być wykonywane bez kolejności, jednak faza przebudowy logiki ekranu ładowania bezpośrednio przygotowuje miejsce do poprawiania loadera-Boxika, więc faze 1. i 5. warto realizować koło siebie.
