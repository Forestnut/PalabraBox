# PalabraBox — Plan prac (Etap 2)

**Data:** 2026-10-07 · **Status:** zatwierdzony do realizacji · **Wejście:** [AUDIT.md](./AUDIT.md)

---

## Jak korzystać z planu

- Status zadania: `[ ]` do zrobienia · `[~]` w toku · `[x]` ukończone · `(⏸)` odroczone.
- Każde zadanie = osobny, mały commit (Conventional Commits) na branchu sesji `arena/46d7e90e-palabrabox`; w kamieniach milowych otwieram PR do `main` — merge wyłącznie po Twojej akceptacji.
- Złożoność: **S** ≤ 2 h · **M** ≤ 1 dzień · **L** ≤ 2–3 dni.
- Zadania wymagające Twojej akcji oznaczone 🙋.
- Zasada stała: **każde zadanie kończy się aktualizacją dokumentacji**, której dotyczy.

## Decyzje przyjęte (na podstawie odpowiedzi z 2026-10-07)

| Obszar        | Decyzja                                                                                                                                                                                                      |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Historia Git  | Zostaje zgnieciony `main`; pełna historia zarchiwizowana tagami `archive/*`; branche `blaze`, `jacob`, `copilot/*`, `docs/project-audit` usuwane po otagowaniu                                               |
| Licencja      | **MIT** (projekt portfolio; zmiana później jest trywialna)                                                                                                                                                   |
| Języki        | Docelowo 3 języki nauki i 3 języki UI (`en`/`es`/`pl`); dziś produkt: Hiszpan uczy się angielskiego; schemat wielojęzyczny od początku (kody języków jako `en`/`es`/`pl`)                                    |
| Deploy        | Vercel Hobby (darmowy) + integracja GitHub; deploy z `main` po merge PR; `vercel-ignore.sh` do usunięcia                                                                                                     |
| TTS           | Segmentacja tekstu po języku, wybór głosu per segment, feature detection; brak głosu EN ⇒ zadania Listening wypadają z puli (z komunikatem); brak TTS ⇒ widoczny komunikat + pokazanie tekstu                |
| Auth          | Tryb gościa domyślny (localStorage); konto (Supabase Auth: magic link + Google) = synchronizacja postępu między urządzeniami, streak, statystyki słówek; modale zachęty z przyciskiem „continuar sin cuenta" |
| Ranking       | Nie w tym zakresie; model danych projektowany tak, by dało się go dodać bez migracji łamiących                                                                                                               |
| `image_match` | Zostaje; treści oparte o emoji (`data.image_emoji` + opcje)                                                                                                                                                  |
| Boxi          | Zostaje; system reakcji kontekstowych (typ pytania, streak, poprawność)                                                                                                                                      |
| TypeScript    | Zostaje na 5.9 — TS 7 odroczone do czasu wsparcia w typescript-eslint (ADR-0002)                                                                                                                             |
| Testy         | Vitest 5 + Testing Library (jednostkowe/komponentowe); Playwright e2e jako opcja na końcu                                                                                                                    |

## Mapa faz

```
F0 Fundamenty (repo, CI, zależności)
 └─> F1 Stabilizacja kodu (bugfixy, refaktor)
      └─> F2 Baza danych (baseline, treści, typy)  ── E7 zależy od F2.E6
           └─> F3 TTS (nowa architektura)
                └─> F4 Auth + synchronizacja
                     └─> F5 UX (Boxi, treści) ──> F6 Dokumentacja końcowa + QA
```

---

## Faza 0 — Fundamenty: repozytorium, GitHub, tooling, zależności

### A1 — `.gitignore`, śmieci, archiwum dokumentów — **S**

Usunięcie z repo: `.env.vercel*`, `audit_artifacts/`, `.playwright-mcp/`, `test-*.cjs`, `test-*.mjs`, `test-results/`, `check.mjs`, `delete.sql`, `audit_report_es.md` (pusty), `src/**/.gitkeep`, przestarzałych instrukcji agentów (`.agents/`, `.github/instructions/`, `.github/prompts/`). Przeniesienie historycznych dokumentów planistycznych (`PLAN.md`, `TODO.md`, `improvement_plan.md`, `docs/TASKS*.md`) do `docs/archive/` z README wyjaśniającym status. Przepisanie `.gitignore` od zera (poprawny UTF-8, `.env*` poza `.example`, `test-results/`, `coverage/`, artefakty Playwright).
**DoD:** świeży klon przechodzi `npm install && npm run build`; `git ls-files` nie zawiera żadnego z wymienionych śmieci; `git check-ignore .env.local` działa.

### A2 — Archiwizacja historii + porządki w branchach i ustawieniach repo — **S**

Tagi `archive/2026-06-blaze`, `archive/2026-03-jacob`, `archive/2026-03-copilot` → usunięcie branchey `blaze`, `jacob`, `copilot/vscode-mn4hr331-whe0`, `docs/project-audit`. Ustawienia repo przez API: opis, tematy, `delete_branch_on_merge=true`, squash jako domyślny merge.
**DoD:** tagi wypchnięte, branche usunięte (restorowalne z tagów), ustawienia zapisane lub — jeśli token nie ma uprawnień — instrukcja klik-by-klik dla Ciebie 🙋.

### A3 — LICENSE (MIT) + nowy README — **S**

**DoD:** LICENSE z prawami „Jakub Laskowski, Błażej Goliszek"; README prawdziwe (opis, quick start, zmienne środowiskowe, workflow bazodanowy, struktura katalogów, linki do docs/, badge CI); zerwanie z martwymi odnośnikami (np. `PalabraBoxHappy.png`).

### A4 — Szablony GitHub: issue, PR, CODEOWNERS — **S**

**DoD:** `.github/ISSUE_TEMPLATE/bug.yml`, `feature.yml`, `.github/PULL_REQUEST_TEMPLATE.md`, `.github/CODEOWNERS`; checklisty PR zawierają wymogi testów i aktualizacji docs.

### A5 — Ochrona brancha `main` — **S** 🙋

Wymagany PR + zaliczone checki CI + fresh branches; bez wymogu aprovals (praca solo/2 osoby). Próba przez API; przy braku uprawnień — instrukcja dla Ciebie.
**DoD:** `main` przyjmuje zmiany wyłącznie przez PR z zielonym CI.

### A6 — Dependabot — **S**

**DoD:** `.github/dependabot.yml` (npm + github-actions, tygodniowo, grupowane minor/patch, limit 5 PR).

### A7 — CI (GitHub Actions) — **M**

Workflow `ci.yml`: `npm ci` → lint → typecheck → test → build; Node 24; trigger: PR + push `main` + `workflow_dispatch`.
**DoD:** zielony przebieg na PR; blokada merge przy czerwonym buildzie (razem z A5).

### A8 — Vercel: deploy i nagłówki bezpieczeństwa — **S**

Usunięcie `scripts/vercel-ignore.sh` i `ignoreBuildStep`; nagłówki w `vercel.json`: `X-Content-Type-Options`, `Referrer-Policy`, `Permissions-Policy`, `X-Frame-Options`, CSP (self + fonts + flagcdn + supabase).
**DoD:** `vercel.json` bez skryptu autoryzacyjnego; nagłówki widoczne na deploju 🙋 (weryfikacja po pierwszym deployu z main).

### B1 — Vitest + pierwsze testy — **M**

`vitest.config.ts` (jsdom), skrypty `test`/`test:run`; testy: `shuffle`, `progress`, `analyticsService`, `gameStore`, `progressStore` (logika streak z `vi.setSystemTime`).
**DoD:** `npm run test:run` przechodzi; testy w CI (z A7).

### B2 — Prettier — **S**

`.prettierrc`, skrypt `format`, check w CI, jednorazowy format kodu w osobnym commicie.
**DoD:** `npm run format:check` czysty.

### C1 — Usunięcie zbędnych zależności — **S**

`vercel` z dependencies (psuje `npm install`), nieużywany `playwright` z devDependencies.
**DoD:** czyste `npm install` bez `--ignore-scripts`; `package.json` bez obu pakietów.

### C2 — Aktualizacje minor/patch — **S**

React 19.3, router 7.18, supabase-js 2.117, tailwind 4.3, zustand 5.0.15, globals, `@types/*`, Font Awesome 7.3, CLI supabase 2.120.
**DoD:** `npm outdated` puste dla minor/patch; testy i build zielone.

### C3 — Aktualizacje major toolingu — **M**

Vite 8, `@vitejs/plugin-react` 6, `vite-plugin-pwa` 2, ESLint 10 (+ `@eslint/js` 10, typescript-eslint 8.71, react-hooks 7.1, react-refresh 0.5.7). Weryfikacja konfiguracji po każdej zmianie.
**DoD:** lint/build/dev na nowych wersjach; ADR-0001 (stack 2026-10).

### C4 — `framer-motion` → `motion` — **S/M**

Pakiet `motion@14`, importy `motion/react`. **DoD:** brak `framer-motion` w drzewie zależności; animacje działają (przegląd PR).

### C5 — ADR: TypeScript 7 odroczony — **S**

ADR-0002: zostajemy na TS 5.9 do czasu wsparcia typescript-eslint. **DoD:** `docs/adr/0002*` istnieje.

### C6 — Howler → natywny `Audio` — **M**

Wrapper `sfxService` na HTMLAudioElement (4 dźwięki, mute, preloading); usunięcie howler + @types/howler; ADR-0003.
**DoD:** dźwięki działają, bundle mniejszy, brak howler w drzewie.

---

## Faza 1 — Stabilizacja kodu

### D1 — Dźwięki SFX: brakujące pliki — **S**

Wygenerowanie `click.wav`/`celebration.wav` (skryptem, deterministycznie) lub usunięcie martwych mappingów; obsługa błędów ładowania (bez leaku obiektów audio).
**DoD:** brak 404 na dźwięki; każdy efekt mapowany na istniejący plik.

### D2 — `Button`: usunięcie globalnego dźwięku klik i `isClickLocked` — **S**

**DoD:** klik dźwiękowy tylko tam, gdzie ma sens (opcja `sound`); brak blokady podwójnego kliknięcia awaryjnej logiką.

### D3 — ErrorBoundary + lazy loading tras — **M**

**DoD:** błąd renderu pokazuje ekran błędu z retry, nie biały ekran; `GameScreen`/`ResultsScreen` lazy; Suspense z fallbackiem.

### D4 — Usunięcie martwego kodu — **S**

`CardsFlowPages.tsx`, `SplashScreen.tsx`, legacy fallback w `useScenarios` (stary schemat), nieużywane eksporty.
**DoD:** brak ślepych importów; `tsc`/eslint czysto.

### D5 — `migrationService` bez destrukcyjnego resetu — **M**

Wersjonowanie stanu (rejestr migracji stanu) zamiast kasowania `pb_*`; migracja starych kluczy do nowych; **nigdy** nie czyścimy postępu użytkownika przy zmianie wersji.
**DoD:** test jednostkowy: upgrade wersji zachowuje gwiazdki/punkty/streak.

### D6 — Gwiazdki: jedno źródło prawdy — **S/M**

Stan gwiazdek w `progressStore` (nie pętla po localStorage w renderze); `useQuickProgress` reaktywny.
**DoD:** brak skanowania localStorage w ciele komponentu; test store'u.

### D7 — Wynik gry: jedno źródło prawdy — **S/M**

`gameStore` przechowuje wynik sesji (scenarioId, stars, score, lives) wyliczany raz; `ResultsScreen` czyta ze store'u.
**DoD:** wejście na `/results` po odświeżeniu nie pokazuje zmyślonych danych (redirect); usunięta duplikacja logiki gwiazdek.

### D8 — Dostępność (a11y) — **M**

Zoom włączony (`maximum-scale`/`user-scalable` usunięte), fiszka obsługiwana z klawiatury (role/tabIndex/Enter), `aria-label` nawigacji fiszek, poprawne etykiety suwaków, przegląd kontrastu tokenów.
**DoD:** nawigacja klawiaturą przez fiszki działa; axe-devtools bez błędów krytycznych (przegląd).

### D9 — Fonty self-host — **S**

`@fontsource-variable/nunito`, usunięcie Google Fonts z `index.html` i `@import` z `index.css`.
**DoD:** zero zewnętrznych żądań fontów; PWA działa offline z fontami.

### D10 — PWA cache: jedna strategia — **S/M**

REST Supabase `NetworkFirst` (zastąpienie `CacheFirst` 7-dniowego); usunięcie dublującego cache localStorage w `useWords`.
**DoD:** treści odświeżają się po deployu; offline dalej działa (fallback do cache).

### D11 — Klient Supabase: fail-fast — **S**

Brak placeholder URL/klucza; czytelny błąd konfiguracji.
**DoD:** brak envów ⇒ widoczny ekran/diagnostyka, nie ciche strzały na localhost.

---

## Faza 2 — Baza danych

### E0 — Weryfikacja stanu produkcji — **S** 🙋

Odebranie od Ciebie pliku `20261007203525_remote_schema.sql` (efekt Twojego `db pull`) + uruchomienie skryptu `scripts/db/verify.sql` (tylko odczyt: countery, sample, duplikaty) w SQL Editorze.
**DoD:** potwierdzone, że produkcja = migracje + znany drift; wyniki zapisane w `docs/DATABASE.md`.

### E1 — `supabase/config.toml` — **S**

Konfiguracja lokalnego stacka (free tier, porty default).
**DoD:** `supabase start` działa u Ciebie lokalnie 🙋; workflow opisany w SETUP.md.

### E2 — Baseline migracji od zera — **M** 🙋 (produkcja)

Jeden plik `0001_baseline.sql` ze świadomym, czystym schematem (zamiast 10 historycznych); na produkcji `supabase migration repair` wg instrukcji (Twoja akcja, po zatwierdzeniu). Stare pliki migracji usunięte.
**DoD:** `supabase db reset` buduje identyczną bazę lokalnie; `db push` na produkcji to no-op po repair.

### E3 — Schemat: języki, indeksy, emoji — **M**

CHECK na kodach języków (`en`/`es`/`pl`), indeks `(level, sort_order)` na scenarios, indeksy FK, kolumna `emoji` na `scenarios` (wycofuje `idEmojiMap` z kodu), spójne nazewnictwo.
**DoD:** migracja + aktualizacja `docs/DATABASE.md` (diagram, tabele, RLS, indeksy).

### E4 — Generator treści: naprawa — **M**

`scripts/generate-sql.mjs`: czyta właściwe pole (`question`), pełny escape, walidacja schematu bloków (zod), deterministyczne ID, sensowne nazwy plików wyjściowych.
**DoD:** regeneracja bloków przechodzi walidację; zero `'undefined'` w `question_text`.

### E5 — Treści: normalizacja — **M/L**

Kierunek nauki es→en (pytanie po hiszpańsku, odpowiedź angielska), opcje odpowiedzi dla `listening`, treści `image_match` (emoji), deduplikacja, TTS jako struktura (`data.tts: [{text, lang}]`) dla F3.
**DoD:** każdy scenariusz ma komplet pytań z opcjami; skrypt weryfikacyjny bez błędów; próbki przejrzane merytorycznie 🙋.

### E6 — Typy TS ze schematu — **S/M**

Skrypt `npm run db:types` (`supabase gen types`); `src/types/db.ts` generowany; ręczne typy usunięte.
**DoD:** importy typów z `types/db`; `tsc` zielone.

### E7 — Warstwa danych na nowym schemacie — **L**

`useWords` (join `word_translations`), `useScenarios` (emoji z bazy, język UI), `useGame` (usunięcie heurystyk ratunkowych: `isSpanishText`, regexy, naprawa mojibake), usunięcie `idEmojiMap`.
**DoD:** fiszki działają; `useGame.ts` skrócone o logikę ratunkową; testy selekcji pytań.

### E8 — `seed.sql` dla lokalnego dev — **S**

**DoD:** `supabase db reset` daje lokalną bazę z pełną treścią.

### E9 — `docs/DATABASE.md` rewrite — **M**

**DoD:** dokumentacja schematu, RLS, workflow migracji i treści aktualna i zgodna ze stanem repo.

---

## Faza 3 — TTS

### F1 — Moduł mowy: fundament — **M**

`speak/`: `getCapabilities()` (API, głosy per język), asynchroniczne ładowanie głosów (promise na `voiceschanged`), scoring głosów per język **bez fallbacku na `voices[0]`**, obsługa `onerror`.
**DoD:** API czyste i przetestowane; brak „pierwszego lepszego głosu".

### F2 — Segmentacja językowa + kolejka — **M**

Segmenter dzieli tekst na fragmenty `[{text, lang}]` (znaczniki z treści `data.tts`, cytaty, znaki hiszpańskie); kolejka utterance z `onend` chaining, cancel, pauza.
**DoD:** mieszane zdanie (es + en) czytane dwoma głosami; testy jednostkowe segmentera.

### F3 — Integracja z UI — **M**

`Listening`: stan odtwarzania z eventów (nie z timera), bez głosu EN ⇒ pytania listening wypadają z puli + widoczna informacja; brak TTS ⇒ banner w ustawieniach + fallback tekstowy.
**DoD:** brak cichych awarii; zachowanie spójne na Chrome/Firefox/Safari (przegląd 🙋).

### F4 — Głośność i prędkość TTS — **S**

`utterance.volume` z `volume.tts` (suwak działa), `rate` z `speechSpeed`.
**DoD:** oba suwaki mają realny efekt.

### F5 — Testy TTS — **S/M**

Segmenter, scoring głosów, capabilities (mock SpeechSynthesis w jsdom).
**DoD:** pokrycie logiki czystej > 90%.

---

## Faza 4 — Auth + synchronizacja

### G1 — Schemat auth — **M**

`profiles` (FK auth.users), `user_progress` (points, streak, last_active), `scenario_stars`, `word_stats`; RLS `auth.uid() = user_id`; indeksy.
**DoD:** migracja + polityki + dokumentacja; testy RLS w SQL.

### G2 — Supabase Auth w kliencie — **M**

Session context, `onAuthStateChange`, magic link + Google OAuth (konfiguracja w dashboardzie 🙋).
**DoD:** logowanie/logout działa; brak wpływu na tryb gościa.

### G3 — Ekran konta + modale — **M**

Ekran profilu (login/logout), modal zachęty („guarda tu racha") z przyciskiem „continuar sin cuenta".
**DoD:** przepływ gość→konto→gość bez utraty danych.

### G4 — Synchronizacja gość→konto — **M/L**

Przy pierwszym logowaniu: upload stanu lokalnego przez RPC (SECURITY DEFINER z walidacją `auth.uid()`), merge max-wins przy konflikcie; dalsze zapisy do bazy po zalogowaniu.
**DoD:** test scenariusza E2E ręczny 🙋 + testy jednostkowe merge.

### G5 — Funkcje tylko dla zalogowanych — **S/M**

Streak i statystyki słówek liczone z bazy po zalogowaniu; gość widzi je lokalnie z informacją o synchronizacji.
**DoD:** spójne wartości gość/konto na dwóch urządzeniach.

---

## Faza 5 — UX / Boxi / treści

### H1 — Boxi: system reakcji — **M**

Deklaratywna konfiguracja reakcji (poprawność, streak, typ następnego pytania, kamienie milowe); intermission skrócone, tap-to-skip, losowe celebracje.
**DoD:** reakcje sąsynchronizowane z przebiegiem gry; brak blokujących przerw dłuższych niż 1,5 s (konfigurowalne).

### H2 — Treści `image_match` — **S** (zależne od E5)

**DoD:** scenariusze zawierają pytania emoji z opcjami; komponent `ImageMatch` żyje.

### H3 — E2E smoke (Playwright) — **M** (⏸ opcjonalnie)

**DoD:** test: wejście → wybór scenariusza → odpowiedź → ekran wyników, zielony w CI.

---

## Faza 6 — Dokumentacja końcowa

### I1 — ADR-y — **M** (pisane na bieżąco przy decyzjach)

ADR-0001 stack 2026-10 · 0002 TS 7 odroczony · 0003 audio bez Howlera · 0004 architektura TTS · 0005 model auth gość→konto · 0006 deploy/branch protection · 0007 licencja MIT.
**DoD:** `docs/adr/` kompletny dla podjętych decyzji.

### I2 — `docs/ARCHITECTURE.md` rewrite — **M**

Routing, warstwy (pages/hooks/store/services), przepływ danych, decyzje.

### I3 — `docs/SETUP.md` rewrite — **S** (z E1)

### I4 — `docs/TESTING.md` — **S** (z B1)

### I5 — Sprzątanie starych docs — **S**

Usunięcie/aktualizacja `SCREENS.md`, `SERVICES.md`, `GAME_MECHANICS.md`, `DESIGN_SYSTEM.md`, `OVERVIEW.md`, `FUTURE_IDEAS.md` po powstaniu następców.

---

## Kolejność realizacji (roadmapa)

1. **F0:** A1 → A3 → A4 → A6 → B1 → C1 → A7 → A8 → A2 → A5 → C2 → C3 → C4 → C5 → C6 → B2
2. **F1:** D1 → D2 → D4 → D11 → D5 → D6 → D7 → D3 → D8 → D9 → D10
3. **F2:** E0 🙋 → E1 → E2 🙋 → E3 → E4 → E5 → E6 → E7 → E8 → E9
4. **F3:** F1 → F2 → F3 → F4 → F5
5. **F4:** G1 → G2 → G3 → G4 → G5
6. **F5:** H1 → H2 → (H3 ⏸)
7. **F6:** I1–I5 (na bieżąco + finalny przegląd)

## Otwarte kwestie (nieblokujące)

- 🙋 Plik `20261007203525_remote_schema.sql` z Twojego `db pull` — wypchnij na branch lub wklej (E0).
- 🙋 Potwierdzenie MIT po ujrzeniu LICENSE (A3) — zmiana to jeden commit.
- 🙋 Supabase Auth: włączenie magic link + Google w dashboardzie (G2) i ewentualne skonfigurowanie protection URLi.
- Vercel Hobby = 1 miejsce w zespole — dla Błażeja wystarczy workflow PR (merge do main deployuje), więc bez zmian planu.
