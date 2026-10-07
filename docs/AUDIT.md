# Audyt projektu PalabraBox — Etap 1

**Data:** 2026-10-07
**Zakres:** repozytorium (Git/GitHub), kod frontendu, baza Supabase (na podstawie migracji i kodu), system TTS, funkcjonalność.
**Metoda:** przegląd całego kodu i konfiguracji, uruchomienie aplikacji lokalnie (dev + build), `tsc`, `eslint`, odczyt ustawień GitHuba przez API, sprawdzenie aktualnych wersji pakietów w rejestrze npm (stan na 2026-10-07).

> ⚠️ **Ograniczenie:** z tego środowiska nie ma dostępu sieciowego do `*.supabase.co` (dozwolone są tylko GitHub/npm/PyPI). Stan **produkcyjnej** bazy oceniam na podstawie migracji w `supabase/migrations/`, skryptów i kodu — faktyczny stan zdalnej bazy wymaga potwierdzenia (pytania w §7).

---

## 1. Stan repozytorium

### 1.1. Historia Git i branche

- `main` zawiera **jeden commit** — `904aeae "Wrzutka"` (2026-06-05), będący squashem całej historii projektu. Oryginalna historia (kilkaset commitów, w tym poprawne Conventional Commits) zachowała się na zdalnych branchach:
  - `origin/blaze` — 327 commitów poza main; drzewo plików różni się od main o **1 linię w README** (czyli main ≈ finalny stan blaze),
  - `origin/jacob` — 123 commity poza main; snapshot starszy (2026-03-26), brak ~16 tys. linii, które main ma,
  - `origin/copilot/vscode-mn4hr331-whe0` — checkpoint z 2026-03-24 (stale),
  - `origin/docs/project-audit` — wskazuje ten sam commit co main (pusty/kopia).
- Wniosek: historia została zgnieciona do jednego commita; branche `jacob`, `copilot/...`, `docs/project-audit` są przestarzałe. Do decyzji: czy zachować oryginalną historię (np. jako tag przed squaszem), czy zaakceptować obecny stan i posprzątać branche.

### 1.2. Struktura katalogów i pliki zbędne

Katalog `src/` jest w miarę sensowny (pages/components/hooks/store/services/utils/types), ale reszta repo to śmietnik:

| Śmieć                                                                                                                                         | Problem                                                                                                                                                                                                         |
| --------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `.playwright-mcp/*.yml`                                                                                                                       | zrzuty sesji Playwright MCP wplecione w repo                                                                                                                                                                    |
| `audit_artifacts/`                                                                                                                            | artefakty dawnego audytu (PNG, snapshoty). `.gitignore` próbuje je ignorować, ale **pliki są już śledzone**, więc ignorowanie nie działa                                                                        |
| `test-dupes.cjs`, `test-useGame.cjs`, `test-useGame2.cjs`, `test-scenarios.cjs`, `test-wordorder.cjs`, `test-playwright.mjs`, `test-results/` | jednorazowe skrypty debugowe w rootcie, zero wartości jako testy                                                                                                                                                |
| `check.mjs`, `delete.sql`                                                                                                                     | skrypt debugowy i ad-hoc SQL do kasowania wierszy po wartości tekstowej — niebezpieczny śmietnik                                                                                                                |
| `audit_report_es.md`                                                                                                                          | **pusty plik (0 B)**; w historii (`jacob`) istnieje jego skorumpowana wersja (UTF-16 + mojibake) — stary raport z audytu jest nienaprawialny                                                                    |
| `PLAN.md` (2711 linii), `improvement_plan.md`, `TODO.md`, `docs/TASKS.md`, `docs/TASKS2.md`                                                   | pięć nakładających się, przestarzałych dokumentów planistycznych; brak jednoznacznego źródła prawdy                                                                                                             |
| `designs/` (1,9 MB)                                                                                                                           | 13 katalogów z HTML-owymi makietami ekranów (mieszana nomenklatura polsko-hiszpańska: `listening_s_uchanie`, `uzupe_nianie_luk_luki`) — do decyzji: przenieść do folderu `design/` jako referencja, albo usunąć |
| `.env.vercel`, `.env.vercel.prod`                                                                                                             | **pliki środowiskowe wcommittowane do repo** (szczegóły w §1.3)                                                                                                                                                 |
| `.agents/rules/GEMINI.md`, `.github/instructions/system-instructions.instructions.md`                                                         | instrukcje dla agentów AI, które każą traktować przestarzały `docs/TASKS.md` jako „źródło prawdy" — będą kolidować z nowym porządkiem                                                                           |
| `.github/prompts/pelny-audyt-aplikacji-es.prompt.md`                                                                                          | prompt użyty do dawnego audytu — do usunięcia/zarchiwizowania                                                                                                                                                   |
| `src/**/.gitkeep` × 8                                                                                                                         | puste znaczniki katalogów zbędne, gdy katalogi mają pliki                                                                                                                                                       |

### 1.3. Pliki wrażliwe

- **`.env.vercel` i `.env.vercel.prod` są wcommittowane** i zawierają:
  - `VITE_SUPABASE_URL` = adres produkcyjnego projektu (`vdfgmujjkyhirlfwycwe.supabase.co`),
  - `VITE_SUPABASE_ANON_KEY` = klucz `sb_publishable_...` — wg obecnej nomenklatury Supabase to **klucz publiczny** (odpowiednik dawnego anon key), więc nie jest to sekret, ale nie powinien żyć w plikach w repo,
  - `VERCEL_OIDC_TOKEN` — tokeny OIDC Vercel (dev i prod). **Zdekodowane: wystawione 2026-03-30, wygasły po 12 h** — realnego zagrożenia brak, ale wzorzec „wcommittowany token" musi zniknąć, bo kolejny raz może to być live sekret.
- `check.mjs` czyta `.env` z dysku i loguje klucze — skrypt do usunięcia.
- Poza tymi plikami **nie znaleziono sekretów w kodzie ani w historii** (brak `sb_secret_`, `service_role`, trwałych tokenów).
- Rekomendacja (do planu): usunąć pliki z repo, dodać `/\.env.*/` (poza `.env.example`) do `.gitignore`, rotacja kluczy niekonieczna (publishable), ale wypada odświeżyć w panelu przy okazji.

### 1.4. `.gitignore`

- Plik jest **uszkodzony binarnie** (końcówka zawiera bajty UTF-16/null-e — widoczne jako `a\0u\0d\0i\0t\0...`), przez co git traktuje go częściowo jak binarny; wpisy na końcu (dot. `audit_artifacts/`) są nieskuteczne.
- Brakuje: `.env.vercel*`, `test-results/`, `.playwright-mcf/`, `*.tsbuildinfo` (build info leci do `node_modules/.tmp`, więc akceptowalnie), `coverage/`, `/tmp`.
- Zbędne wpisy: `lerna-debug.log`, `dist-ssr`, `*.suo` itd. — szablonowe resztki.

### 1.5. GitHub i CI/CD

- Repo: `Forestnut/PalabraBox`, **publiczne**, bez LICENSE (problem dla publicznego repo!), bez opisu, issues włączone, wiki/discussions wyłączone.
- **Brak**: workflows GitHub Actions, Dependabot, szablonów issue/PR, CONTRIBUTING, CODEOWNERS.
- **Branch protection `main`: nieodczytywalny** używanym tokenem integracji (API zwraca 403 także dla listy sekretów Actions) — nie potrafię potwierdzić, czy jakakolwiek ochrona istnieje (pytanie §7).
- Merge: wszystkie metody dozwolone, `deleteBranchOnMerge: false` (przy porządku warto włączyć auto-delete).
- Deploy: Vercel z `main` (`vercel.json`: `deploymentEnabled: {main: true, "*": false}`) + **`scripts/vercel-ignore.sh`** — skrypt pomija build, jeśli autorem commita nie jest `Forestnut`. To kruchy „zabezpieczacz": po zmianie workflow (PR-y mergowane przez innych autorów/boty) **deploy cicho zniknie**; do usunięcia lub przepisania.
- `vercel.json` ustawia cache-control dla `/assets` i `/sounds`, ale **brak nagłówków bezpieczeństwa** (CSP, `X-Content-Type-Options`, `Referrer-Policy`, `Permissions-Policy`).
- README: odwołuje się do nieistniejącego pliku `public/PalabraBoxHappy.png` (zepsuty obrazek), instrukcja setupu częściowo nieaktualna (brak wzmianki o migracjach CLI, o brakujących plikach dźwiękowych).

---

## 2. Stan kodu

### 2.1. Zdrowie bazowe (zweryfikowane lokalnie)

- `npx tsc -b` — **0 błędów**; `npx eslint .` — **0 błędów**; `npm run build` — **przechodzi** (bundle: `index` 432 kB, `supabase` 173 kB, `animation` 126 kB; precache PWA ~1 MB).
- **`npm install` wysypuje się domyślnie**: `vercel` (^50) siedzi w **dependencies** i jego postinstall próbuje pobrać binarkę CLI z GitHub Releases. To zły pakiet na dependency aplikacji webowej (do usunięcia z deps; ewentualnie `npx vercel@latest` ad hoc).
- Brak **jakichkolwiek testów** (żadnego runera w konfiguracji; pliki `test-*.cjs` to skecze, nie testy). Playwright 1.58 jest devDependency, ale nie ma configu ani testów.

### 2.2. Wersje bibliotek (repo vs rejestr npm, 2026-10-07)

| Pakiet                              | W repo                       | Latest    | Uwagi                                                                                            |
| ----------------------------------- | ---------------------------- | --------- | ------------------------------------------------------------------------------------------------ |
| `vite`                              | 7.0.0                        | **8.3.3** | 1 wersja główna za                                                                               |
| `typescript`                        | 5.9.3                        | **7.0.2** | TS 7 = przeportowanie na Go („tsgo"); migracja nieodzowna, ale ryzykowna — wymaga ADR            |
| `eslint` / `@eslint/js`             | 9.39.4                       | **10.12** | 1 wersja główna za                                                                               |
| `typescript-eslint`                 | 8.56.1                       | 8.71.1    | pod ESLint 10 potrzebna wersja kompatybilna                                                      |
| `vite-plugin-pwa`                   | 1.2.0                        | **2.0.0** | major                                                                                            |
| `@vitejs/plugin-react`              | 5.0.0                        | **6.1.2** | major                                                                                            |
| `framer-motion`                     | 12.38.0                      | 14.0.0    | pakiet przemianowany na **`motion`** — rebrand + 2 majory za                                     |
| `react` / `react-dom`               | 19.2.4                       | 19.3.0    | drobne                                                                                           |
| `react-router-dom`                  | 7.13.1                       | 7.18.4    | drobne                                                                                           |
| `@supabase/supabase-js`             | 2.99.2                       | 2.117.3   | drobne                                                                                           |
| `tailwindcss` / `@tailwindcss/vite` | 4.2.1                        | 4.3.3     | drobne                                                                                           |
| `zustand`                           | 5.0.12                       | 5.0.15    | OK                                                                                               |
| `@dnd-kit/*`                        | core 6.3.1 / sortable 10.0.0 | równe     | OK, aktywnie używane                                                                             |
| `canvas-confetti`                   | 1.9.4                        | 1.9.4     | OK                                                                                               |
| `howler`                            | 2.2.4                        | 2.2.4     | **ostatnia publikacja 2023-09 — biblioteka uśpiona**; do rozważenia zastąpienie natywnym `Audio` |
| `vercel`                            | ^50.35.0                     | 62.7.0    | **nie powinno być w dependencies** (patrz §2.1)                                                  |
| `playwright`                        | 1.58.2                       | 1.63.0    | nieużywany devDep (brak testów)                                                                  |
| `supabase` (CLI)                    | 2.81.3                       | 2.120.0   | OK jako devDep, ale jego postinstall bywa kruchy                                                 |

Wnioski: stack (React 19 + Vite + Tailwind 4 + Zustand + Supabase) jest zasadniczo zgodny z dobrymi praktykami 2026; wymagane są: aktualizacje major (Vite 8, ESLint 10, plugin-react 6, PWA 2), migracja `framer-motion`→`motion`, decyzja ADR o TS 7, usunięcie `vercel` z deps i rozstrzygnięcie losu Howlera.

### 2.3. Przestarzałe wzorce, martwy kod, duplikacje, bugi

**Krytyczne (funkcjonalność):**

1. **Fiszki są zepsute względem obecnego schematu bazy.** `useWords.ts` odpytuje `words` z filtrami `.eq('language', ...)` i polega na kolumnach `word, translation_es, translation_en, image_emoji` — po migracji `20260327100000_refactor_schema.sql` tabela `words` ma już tylko `(id, base_key, category, level)`, a tłumaczenia służą w `word_translations`. Zapytanie zwróci błąd 400 („column words.language does not exist") → ekran „No se encontraron tarjetas" / błąd. `types/index.ts` (`Word`, `Scenario`, `Question`) opisuje **stary** schemat.
2. **Brakujące dźwięki**: `audioService` mapuje `click` i `celebration` na pliki `/sounds/click.mp3`, `/sounds/celebration.mp3`, których **nie ma** w `public/sounds/` (są tylko `correct.mp3`, `wrong.mp3`). Każdy klik w `Button` (= każdy przycisk w aplikacji) generuje 404 + tworzony jest przy każdej próbie nowy obiekt `Howl` (leak). Efekt: klik i fanfary są **cicho martwe**.
3. **`question_text` w bazie to często literalny string `'undefined'`** — generator `scripts/generate-sql.mjs` czyta `question.question_text`, a JSON treści ma pole `question` (bez `_text`); `escapeSql(undefined)` wstawia `'undefined'` do SQL. Dlatego `useGame.ts` ma cały podsystem ratunkowy (heurystyka `isSpanishText`, regexy „How do you say…", naprawa mojibake `Âż→¿`), który odbudowuje teksty pytań **w runtime**. To najpoważniejszy dług techniczny: logika prezentacji danych powinna żyć w danych, nie w kodzie klienckim.
4. **Kierunek nauki w treściach jest odwrócony/niespójny.** Aplikacja deklaruje naukę **angielskiego dla Hiszpanów**, ale w blokach treści `word_order` buduje zdania **po hiszpańsku** („Form the sentence: I went to the store yesterday" → poprawna odpowiedź `["Fui","a la tienda","ayer"]`), a `listening` ma `audio_text` po hiszpańsku z angielską odpowiedzią. Refaktoryzująca migracja dodatkowo ustawiła wszystkim pytaniom `source_language='es', target_language='en'` (bug w migracji — patrz §3.3). Zawartość wymaga audytu merytorycznego i decyzji, co jest źródłem prawdy.
5. **Pytania `listening` z bloków nie mają opcji odpowiedzi** (`data` = tylko `correct` + `audio_text`) → `useGame` dosztukowuje distraktory z innych pytań, a w ostateczności **`'option 1', 'option 2', 'option 3'` jako widoczne odpowiedzi**.

**Ważne (jakość/utrzymanie):** 6. `useGame.ts` (424 linie) — monolit: fetch + 5 strategii fallbacku distraktorów + deduplikacja + selekcja 10 pytań + nawigacja + zapis gwiazdek. Do rozbicia na moduły (fetch/normalizacja/selekcja), po naprawie danych większość fallbacków znika. 7. `useScenarios.ts`: `translationLanguage = 'en'` **zahardkodowane** — tytuły scenariuszy pobierane są wyłącznie po angielsku w aplikacji, której UI jest po hiszpańsku (a tłumaczenia `es` w bazie są!). Do decyzji: język tytułów = język UI (es) — zakładam, że tak. 8. `useScenarios.ts` trzyma **31 UUID-ów scenariuszy z emoji w kodzie** (`idEmojiMap`) — dane w kodzie zamiast w bazie (kolumna `emoji` została wyrzucona z tabeli `scenarios` podczas refaktoru). 9. `App.tsx` + `migrationService.ts`: przy zmianie `pb_app_version` (hardcode `'1.0.0'`) aplikacja **kasuje cały localStorage `pb_*` i `palabrabox_*` (czyli gwiazdki i postęp!) oraz wyrejestrowywuje SW i cache**. Każda zmiana wersji = reset postępów użytkownika. Do przeprojektowania (wersjonowanie stanu zamiast formatowania dysku). 10. `lib/supabase.ts`: fallback `'http://localhost:54321'` + `'placeholder-key-to-prevent-crash'` — brak envów w produkcji objawia się cichymi strzałami na localhost z przeglądarki użytkownika. Lepiej: twardy, widoczny błąd konfiguracji. 11. `ResultsScreen.tsx`: `useState({score: store.score, ...})` — snapshot stanu w momencie montażu; wejście na `/results` bez końca gry pokazuje zera; **logika gwiazdek zdublowana** względem `useGame` (dwie definicje prawdy). 12. `useQuickProgress.ts`: liczenie `ownedStars` pętlą po całym localStorage **w ciele renderu** (niereaktywne, nieefektywne). 13. `GameScreen.tsx`: `boxiTimeoutRef` bez czyszczenia w unmount (wyciek timera); `status==='finished'` i „no questions" to martwe stany pośrednio nieosiągalne w praktyce. 14. Martwy kod: `CardsFlowPages.tsx` (3 puste strony niepodpięte do routingu), `SplashScreen.tsx` (nieużywany — rolę splash pełni `LoaderOverlay`), legacy fallback w `useScenarios` (po `drop_legacy_columns` nie ma już schematu z kolumną `language` na `scenarios`), pole `question_text_tts` w bazie nigdy nie wypełniane przez generator. 15. `Button.tsx`: `isClickLocked` + async `handleClick` — nadmiarowy mechanizm; `audioService.play('click')` odpalany globalnie przy każdym przycisku (patrz bug #2). 16. Brak **ErrorBoundary**; brak lazy-loadingu tras; fonty Google ładowane **dwukrotnie** (`<link>` w `index.html` + `@import` w `index.css` — ten drugi blokuje render CSS). 17. `PWA`: runtime caching `CacheFirst` na REST Supabase (`words|scenarios|questions`) przez **7 dni** — treści aktualizują się z opóźnieniem tygodnia; koliduje to też z debugowaniem. Zalecane `NetworkFirst`/`StaleWhileRevalidate`. 18. Literówka w `supabase/migrations/20260324000000_add_missing_questions.sql` — plik zawiera tylko komentarze (świadomie pusty, „migration" nic nie robi).

### 2.4. Wydajność

- Brak `React.lazy`/route-level code splitting; framer-motion (126 kB) i dnd-kit (49 kB) ładowane zawsze, choć dnd-kit używa tylko `WordOrder`.
- Cache odpowiedzi Supabase: dwa nieskoordynowane mechanizmy (PWA workbox + ręczny localStorage w `useWords`, plus `scenariosCache` in-memory) — trzy warstwy z różnymi TTL.
- `useGame` pobiera **wszystkie** pytania scenariusza bez `order`/limit i kurkuje je na kliencie — na razie OK (75 pyt./scenariusz), ale selekcja pytań nadaje się do widoku RPC w bazie przy większej treści.

### 2.5. Dostępność (a11y)

- `index.html`: `maximum-scale=1.0, user-scalable=no` — **blokuje zoom** (poważny anty-wzorzec a11y, szczególnie dla dzieci 6–15 lat i słabowidzących).
- `FlashCard`: klikalny `div` bez `role="button"`/`tabIndex`/obsługi klawiatury (fiszka nieodwracalna z klawiatury).
- `CardsDeck`: strzałki prev/next bez `aria-label` (same ikony).
- Suwaki głośności w `SettingsScreen` — brak powiązania `label`→`input` (`htmlFor`/`id`), brak `aria-valuetext`.
- `aria-*` występuje w zaledwie 3 plikach (`BackButton`, `MainMenu`, `SettingsScreen`).
- Pozytywnie: `SelectableCard` ma `role`/`tabIndex`/`onKeyDown`; `ScenarioCard` ma `focus-visible`; `html lang="es"` ustawione poprawnie.
- Brak testów kontrastu (kolory `pb-text-light #6B7B71` na białym ~4.0:1 — na granicy WCAG AA dla małego tekstu).

---

## 3. Stan bazy Supabase

### 3.1. Schemat (zgodnie z migracjami)

Tabele w `public` po wszystkich migracjach:

| Tabela                  | Kolumny (istotne)                                                                                                                                                                              | Relacje                                          | Indeksy                                              |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------ | ---------------------------------------------------- |
| `scenarios`             | `id uuid PK`, `category`, `level` (CHECK beginner/intermediate), `sort_order`                                                                                                                  | 1—N `questions`, `scenario_translations`         | tylko PK; **brak indeksu na (`level`,`sort_order`)** |
| `scenario_translations` | `scenario_id FK`, `language`, `title`, `description`                                                                                                                                           | FK ON DELETE CASCADE                             | UNIQUE(`scenario_id`,`language`)                     |
| `words`                 | `id uuid PK`, `base_key` UNIQUE, `category`, `level`                                                                                                                                           | 1—N `word_translations`, 0—N `questions.word_id` | UNIQUE(`base_key`)                                   |
| `word_translations`     | `word_id FK`, `language`, `text`, `audio_text`                                                                                                                                                 | FK ON DELETE CASCADE                             | UNIQUE(`word_id`,`language`)                         |
| `questions`             | `id`, `scenario_id FK NOT NULL`, `word_id?`, `type` (CHECK 5 typów), `question_text NOT NULL`, `question_text_tts?`, `hint?`, `sort_order`, `data jsonb`, `source_language`, `target_language` | FK do `scenarios` ON DELETE CASCADE              | `idx_questions_scenario` (jeden)                     |

**Brak**: funkcji, triggerów, widoków, tabel użytkownika/postępu (auth nie istnieje w bazie), `updated_at`, bundle z `base_key`/`language` nie ma odrębnych indeksów FK (`word_translations.word_id`, `scenario_translations.scenario_id` — Postgres nie tworzy automatycznie indeksów na FK).

### 3.2. RLS

- Włączone na wszystkich 5 tabelach; polityki: `FOR SELECT TO public USING (true)` — publiczny odczyt treści, zapis tylko przez `service_role`.
- **Ocena**: dla obecnego MVP (treści publiczne, brak kont) to poprawne i bezpieczne. Brak polityk INSERT/UPDATE/DELETE = anon nie nadpisze treści. Ryzyko pojawi się przy auth — wtedy postęp użytkownika musi dostać polityki `auth.uid() = user_id`.

### 3.3. Migracje — problemy

1. Historia migracji opowiada o bolesnej ewolucji: init (plaski schemat) → pusta „add_missing_questions" → **refactor_schema** (denormalizacja do tłumaczeń, drop starych tabel) → 6 bloków treści generowanych skryptem → `drop_legacy_columns_from_scenarios`.
2. `20260327100000_refactor_schema.sql` zawiera **buga logicznego**: `UPDATE questions SET source_language/target_language … FROM scenarios s WHERE q.scenario_id = s.id` wykonany **po** przemapowaniu `scenario_id` na scenariusze angielskie — wszystkie pytania dostały `es→en` niezależnie od rzeczywistego kierunku. W samym pliku zostały nawet komentarze autora („no, wait, we already updated scenario_id to English ones!") — dowód improwizacji na żywo.
3. **Brak `supabase/config.toml`** — projekt nie jest w pełni uruchamialny przez `supabase start`/`db reset` z repo (CLI wymaga config). Lokalny develop bazy jest praktycznie niemożliwy do odtworzenia 1:1.
4. `seed.sql` jest celowo no-op (treść w migracjach) — podejście spójne, ale nieudokumentowane w DATABASE.md.
5. Generator `scripts/generate-sql.mjs`: czyta złe pole (bug #3 z §2.3), buduje UUID z MD5 (deterministyczne — ok dla idempotencji), **nie escape'uje** `"` i nie obsługuje `null`; domyślna ścieżka wyjściowa `20260327000000_*.sql` sortowałaby się **przed** migracją schematu (stąd ręcznie przemianowane pliki 11xxxx–16xxxx).
6. Brak polityk migracji w repo (kto/ kiedy pushuje na produkcję), brak `supabase db pull` snapshotu stanu produkcyjnego.

### 3.4. Dane treściowe (źródło: `scripts/content_blocks/*.json`)

- Zakres: **27 scenariuszy** (18 beginner + 9 intermediate), **366 pytań**, **212 słów**.
- Typy pytań w blokach: tylko `multiple_choice`, `listening`, `fill_blank`, `word_order` — **`image_match` nie ma ani jednego pytania** w nowych treściach (komponent `ImageMatch` jest martwy dla nowych bloków; może działać na starych pytaniach z init-seeda, o ile przetrwały refaktor — do potwierdzenia w produkcji).
- Jakość danych: patrz §2.3 pkt 3–5 (`'undefined'` w `question_text`, brak opcji w `listening`, odwrócony kierunek, mojibake w starych rekordach).
- Nie wiadomo, co **faktycznie** siedzi w produkcji (stare pytania z init + bloki? duplikaty?) — potrzebny odczyt z produkcji (pytanie §7).

---

## 4. System czytania na głos (TTS)

### 4.1. Jak działa dziś

- Implementacja: `src/services/speechService.ts` — singleton nad **Web Speech API** (`window.speechSynthesis`), bez zależności zewnętrznych (dobrze: zero kosztów, offline).
- Wybór głosu (`selectVoice(lang)`): priorytet „Google/Neural/Natural" → „Google" → „Microsoft" → dowolny dokładny `lang` → prefix języka → **`voices[0]` (dowolny głos w systemie)**. Cache wyboru per język; `onvoiceschanged` + retry 500 ms (obejście na Firefoksa).
- Wywołania w aplikacji:
  - `Listening.tsx` — czyta `question_text_tts || correct_answer` głosem `en-US` (język liczony z `scenarioLanguage`, który jest **zahardkodowany na `'english'`** w `useGame`); animacja „odtwarzania" jest **odmierzana timerem** `text.length * 80 ms`, a nie stanem API;
  - `WordOrder.tsx` — po poprawnej odpowiedzi czyta złożone zdanie (`en-US`/`es-ES` wg tej samej heurystyki);
  - `FlashCard.tsx` — awers: `audio_text || word` w języku karty, rewers: tłumaczenie w drugim języku (jedyna placesówka z realną zmianą języka głosu).
- Ustawienia: `speechSpeed` (0.5–1.5) przekazywane do `utterance.rate` — działa. **`volume.tts` (suwak „Voz del Lector") jest martwy** — `utterance.volume` nigdy nie jest ustawiane, SpeechSynthesis nie przechodzi przez Howlera, więc suwak nic nie robi.

### 4.2. Dlaczego „wszystko czyta jednym akcentem"

1. **Jedna polityka głosu na całe wypowiedź** — `speak(text, lang)` ustawia jeden `utterance.lang`/`voice` na cały tekst. Zdania mieszane (np. hiszpańskie polecenie z angielskim słowem: „¿Cómo se dice 'apple'?") są czytane jednym głosem: hiszpańskim (wówczas „apple" brzmi po hiszpańsku) albo angielskim (wówczas cała reszta jest kaleczona). Nie ma żadnego segmentowania tekstu po językach.
2. **Fallback `voices[0]`** — na systemach bez głosu dla żądanego języka (typowo: Windows bez language packów, część Androidów/Linuxów) `selectVoice` zwraca **pierwszy lepszy głos**, więc hiszpański i angielski czyta ten sam (np. polski lub hiszpański) głos. To bezpośrednia przyczyna „jednego akcentu dla wszystkiego".
3. `scenarioLanguage` jest i tak na sztywno `'english'`, więc `Listening` zawsze prosi o `en-US` — hiszpańskie odpowiedzi/opcje bywają czytane angielskim głosem.

### 4.3. Braki wsparcia i degradacja

- **Brak feature detection w UI**: gdy `speechSynthesis` nie istnieje (np. starsze Firefox Android, niektóre WebView), konstruktor serwisu loguje tylko `console.warn`; `speak()` natychmiast wywołuje `onEnd`. W `Listening` użytkownik klika „play", widzi animację… i nic nie słyszy (cicha awaria). Zero komunikatu, zero alternatywy.
- Gdy głosy ładują się asynchronicznie, pierwszy `speak` może wyjść głosem domyślnym (race z `getVoices()`).
- Brak obsługi: kolejki segmentów (wymaganej do mieszania języków — `speechSynthesis` nie pozwala zmienić głosu w trakcie utterance; trzeba łańcucha utterance z `onend`), pauzy/wznawiania, `onerror` z powodem, limitów długości tekstu (Chrome ucina długie utterance), odblokowania audio na iOS (pierwszy `speak` musi być w gestii użytkownika).
- `stop()` woła `cancel()` — ok, ale brak wyciszenia trwającej mowy przy zmianie ekranu (nawigacja nie stopuje TTS — mowa się dogadza po wyjściu z gry… akurat `cancel` w każdym `speak` łagodzi).

### 4.4. Rekomendowany kierunek (do planu)

- Warstwa TTS jako osobny moduł: `getCapabilities()` (API obecne? głosy dla `en`? dla `es`?), `speakSegments(segments: {text, lang}[])` z kolejką utterance i wyborem głosu per segment, `onerror`→degradacja.
- Segmentacja językowa tekstu (np. po „¿Cómo se dice 'X'?" — fragment cytowany w języku docelowym, reszta w języku UI); dla fiszek — już dziś naturalnie dwujęzyczne.
- UI: jawny stan „TTS niedostępny w tej przeglądarce" + alternatywa (np. pokazanie tekstu z transkrypcją zamiast odsłuchu), przycisk stop, zastosowanie suwaka głośności (`utterance.volume`).
- Testy jednostkowe segmentera + capability detectora (jsdom z mockiem SpeechSynthesis).

---

## 5. Funkcje: zachować / poprawić / usunąć

| Funkcja                                                            | Stan                                                                   | Decyzja (propozycja)                                                                      |
| ------------------------------------------------------------------ | ---------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| Flow gry: wybór języka → poziom → scenariusz → gra → wyniki        | działa                                                                 | **zachować**; uporządkować routing                                                        |
| 5 typów pytań (MC, image_match, listening, fill_blank, word_order) | działają, ale dane padły (image_match bez treści, listening bez opcji) | **zachować**; naprawić dane + selekcję pytań                                              |
| Życia (3), punkty, gwiazdki, streak, XP/poziom                     | działa; logika gwiazdek zdublowana; reset postępu przy zmianie wersji  | **zachować, poprawić** (jedno źródło prawdy; wersjonowanie bez kasowania)                 |
| Blokada scenariuszy do zdobycia gwiazdek                           | działa                                                                 | **zachować**                                                                              |
| Fiszki 3D flip + personalizacja po najgorszych wynikach            | **zepsute** (schemat bazy)                                             | **naprawić** (query po `word_translations`)                                               |
| TTS (Web Speech)                                                   | działa częściowo; jeden akcent, brak degradacji                        | **przebudować** (§4.4)                                                                    |
| Efekty dźwiękowe (Howler)                                          | 2 z 4 plików istnieją                                                  | **naprawić** (dodać pliki lub usunąć mapping; rozważyć zastąpienie Howlera)               |
| PWA (manifest, SW, offline cache)                                  | działa; strategia cache myląca                                         | **zachować, poprawić** (strategie cache, self-host fontów)                                |
| Ustawienia (głośność, prędkość TTS)                                | suwak TTS martwy                                                       | **naprawić**                                                                              |
| Mascotka „Boxi" + komunikaty między pytaniami                      | działa                                                                 | **zachować** (intermission do decyzji UX — każda odpowiedź = przerwa)                     |
| Confetti na wynikach                                               | działa                                                                 | **zachować**                                                                              |
| Wybór języka nauki (polski „próximamente")                         | UI-zabawka; baza i treści tylko EN                                     | **zachować EN; decyzja czy zostawić disabled PL**                                         |
| `CardsFlowPages.tsx`, `SplashScreen.tsx`                           | martwy kod                                                             | **usunąć**                                                                                |
| `migrationService` (kasowanie stanu)                               | groźny hack                                                            | **przeprojektować**                                                                       |
| `scripts/generate-sql.mjs` + `content_blocks`                      | buggowany pipeline treści                                              | **naprawić** (walidacja schematem, poprawne pole `question`, escape, deterministyczne ID) |
| Integracja Vercel (`vercel-ignore.sh`, `vercel` w deps)            | kruche                                                                 | **usunąć/przepisać**                                                                      |

---

## 6. Bezpieczeństwo (przekrój)

- **Sekrety**: brak live-sekretów w kodzie; wcommittowane `.env.vercel*` do usunięcia (§1.3). Anon/publishable key w kliencie — zgodne z przeznaczeniem; bezpieczeństwo oparte na RLS.
- **RLS**: poprawne dla publicznych treści; do rozszerzenia przy auth.
- **Nagłówki**: brak CSP i podstawowych nagłówków w `vercel.json` — do dodania (uwaga na `unsafe-inline` stylów Tailwind/Framer i fonty).
- **Zależności**: `npm audit` nie uruchamiany (install z `--ignore-scripts`); brak Dependabota; Howler 2.2.4 (2023) bez łat poprawek bezpieczeństwa — niskie ryzyko (lokalne audio), ale argument za natywnym `Audio`.
- **Walidacja wejścia**: brak formularzy poza settings; docelowo (auth, sync) konieczna walidacja po stronie serwera (RLS + ewentualne RPC).
- **Abuse**: publiczna baza na free tier — Read-only anon + brak rate limitów po stronie Supabase (da się skonfigurować w dashboardie); PWA cache łagodzi.

---

## 7. Pytania do właściciela (blokujące plan)

1. **Produkcyjna baza**: czy `main`/migracje są jedynym źródłem prawdy, czy w produkcji są ręczne zmiany? Czy mogę prosić o wynik `npx supabase db pull` (lub eksport schematu + countery tabel) — z tego środowiska nie widzę Supabase? Czy stara treść z init-seeda (kolory/zwierzęta/jedzenie, image_match) ma zostać, czy startujemy treściowo od bloków?
2. **Kierunek nauki**: potwierdź proszę model produktu — „Hiszpan uczy się angielskiego" (UI po hiszpańsku, pytanie po hiszpańsku, odpowiedź/tło po angielsku). Obecne treści często robią odwrotnie. Czy przygotować migrację normalizującą kierunek (source=es, target=en) i wyciąć / poprawić odwrócone pytania?
3. **Historia Git**: czy squashed „Wrzutka" na main to zamierzone? Mogę (a) zaakceptować obecny stan i posprzątać branche `jacob`/`copilot/...`/`docs/project-audit` (po zachowaniu tagu), albo (b) odtworzyć pełną historię z `blaze` — wymaga force-push na main i Twojej zgody.
4. **GitHub**: czy jest jakakolwiek branch protection na `main` (nie mogę odczytać przez API — token integracji dostaje 403; tak samo nie widzę sekretów Actions, zakładam że brak CI)? Czy mogę skonfigurować protection + CI + Dependabot + szablony, gdy dostanę zgodę?
5. **Vercel**: czy deploy z main przez `vercel-ignore.sh` (tylko autor Forestnut) jest nadal pożądany? Po zmianie workflow zablokuje deploye z PR-ów innych autorów.
6. **TTS**: czy zgadzasz się na podejście z §4.4 (segmentacja po języku + feature detection + jawna degradacja)? Czy w `Listening` akceptowalny jest fallback „pokaż tekst, gdy nie ma głosu" (ryzyko: uczymy słuchania — fallback osłabia sens zadania; alternatywa: blokada scenariuszy listeningowych bez głosu EN)?
7. **Auth i synchronizacja**: potwierdź zakres etapu auth — gość (localStorage) → konto (Supabase Auth, np. magic link/Google) z migracją postępu po rejestracji. Czy przewidujemy też ranking/tablice wyników (wpływ na model danych)?
8. **Treści `image_match`**: usunąć typ pytań do czasu posiadania treści/emoji, czy wygenerować distraktory z bazy słów (obecny komponent obsługuje emoji zamiast obrazów)?
9. **LICENSE**: repo jest publiczne bez licencji — jaką licencję nadać (MIT? CC-BY-NC dla treści?)?
10. **Intermission po każdej odpowiedzi** (komunikat Boxi między pytaniami): zachować, czy pokazywać tylko po błędzie/serii (UX)?

---

_Audytor: agent Arena.ai (Etap 1). Dokument utworzony bez zmian w kodzie, bazie i ustawieniach repozytorium; jedyny artefakt lokalny: nieśledzony `.env.local` (wartości już publiczne z repo) na potrzeby podglądu deweloperskiego._
