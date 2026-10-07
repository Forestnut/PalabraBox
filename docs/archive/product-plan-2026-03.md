

# 📦 PalabraBox — Finalny Plan Projektu

---

## Spis treści

1. [Opis projektu](#1-opis-projektu)
2. [Koncept „Box" — motyw przewodni](#2-koncept-box--motyw-przewodni)
3. [Grupa docelowa i poziomy trudności](#3-grupa-docelowa-i-poziomy-trudności)
4. [Design, paleta kolorów, typografia](#4-design-paleta-kolorów-typografia)
5. [Wszystkie ekrany aplikacji — szczegółowy opis](#5-wszystkie-ekrany-aplikacji--szczegółowy-opis)
6. [Mechaniki pytań — szczegółowy opis](#6-mechaniki-pytań--szczegółowy-opis)
7. [System fiszek (Tarjetas)](#7-system-fiszek-tarjetas)
8. [Nauka wymowy — TTS](#8-nauka-wymowy--tts)
9. [System postępu i punktacji](#9-system-postępu-i-punktacji)
10. [Technologie — dokładne omówienie](#10-technologie--dokładne-omówienie)
11. [Schemat bazy danych](#11-schemat-bazy-danych)
12. [Struktura projektu](#12-struktura-projektu)
13. [Konfiguracja środowiska — od zera](#13-konfiguracja-środowiska--od-zera)
14. [Plan 10 dni — szczegółowy harmonogram](#14-plan-10-dni--szczegółowy-harmonogram)
15. [Podział ról](#15-podział-ról)
16. [Priorytetyzacja funkcji (MVP vs Later)](#16-priorytetyzacja-funkcji-mvp-vs-later)
17. [Pomysły na przyszłość](#17-pomysły-na-przyszłość)

---

## 1. Opis projektu

### Czym jest PalabraBox?

**PalabraBox** (Palabra = słowo po hiszpańsku, Box = pudełko) to interaktywna gra webowa do nauki **języka angielskiego i hiszpańskiego**. Aplikacja jest skierowana do dzieci i młodzieży w wieku **6–15 lat**. Interfejs jest po **hiszpańsku** (z placeholderem na przyszłe tłumaczenia).

Motyw przewodni to **pudełko/karton** — gracz „otwiera pudełka" ze słówkami, scenariuszami i wiedzą. Pudełko to metafora odkrywania nowych słów i umiejętności językowych.

### Jak działa gra — flow użytkownika

```
Pantalla de carga (splash screen z logo 📦)
        ↓
   Menú principal
   (Jugar / Tarjetas / Ajustes)
        ↓
  Seleccionar idioma
  (🇬🇧 Inglés / 🇪🇸 Español)
        ↓
  Seleccionar nivel
  (⭐ Principiante A1 / ⭐⭐ Intermedio A2-B1)
        ↓
  Seleccionar escenario
  ("Colores" / "Números" / "Animales" / ...)
  (z gwiazdkami i kłódkami)
        ↓
  ┌─── PANTALLA DE JUEGO ───┐
  │ Barra de progreso        │
  │ Corazones (vidas)        │
  │ Puntuación               │
  │                          │
  │  [PREGUNTA]              │
  │                          │
  │  [RESPUESTAS]            │
  └──────────────────────────┘
        ↓
  (10 preguntas por escenario)
        ↓
  Pantalla de resultados
  (Estrellas 1-3 / Puntuación / Repetir / Siguiente)
```

### Dodatkowy flow — Fiszki (Tarjetas)

```
Menú principal → Tarjetas
        ↓
  Seleccionar idioma + nivel
        ↓
  Seleccionar escenario
        ↓
  ┌─── MODO TARJETAS ───┐
  │                      │
  │   ┌──────────────┐   │
  │   │              │   │
  │   │    house     │   │ ← kliknij żeby odwrócić
  │   │      🔊      │   │
  │   │              │   │
  │   └──────────────┘   │
  │                      │
  │   ← 3/15 →           │ ← swipe lub strzałki
  │                      │
  └──────────────────────┘
```

---

## 2. Koncept „Box" — motyw przewodni

### Filozofia

Nazwa **PalabraBox** łączy hiszpańskie „Palabra" (słowo) z angielskim „Box" (pudełko). Motyw pudełka przewija się przez całą aplikację:

### Gdzie pojawia się „Box"

| Element | Zastosowanie motywu pudełka |
|---------|---------------------------|
| **Logo** | Stylizowane pudełko 📦 z literą „P" lub słowem „PB" wyłaniającym się z otwartego kartonu |
| **Maskotka** | Mały, uśmiechnięty kartonik z oczami i rączkami — pojawia się na splash screenie, w pustych stanach, przy gratulacjach. Prosty, geometryczny, narysowany w CSS/SVG — nie wymaga grafika |
| **Kafelki scenariuszy** | Wyglądają jak pudełka/kartony — lekko trójwymiarowe (cień na dole i prawej stronie), „otwierają się" po kliknięciu (animacja pokrywki) |
| **Karty odpowiedzi** | Kafelki z zaokrąglonymi rogami wyglądające jak małe pudełeczka |
| **Fiszki (Tarjetas)** | Karty odwracają się jak wkładanie/wyjmowanie słówka z pudełka |
| **Ekran wyników** | „¡Has abierto la caja del conocimiento!" (Otworzyłeś pudełko wiedzy!) |
| **Ukończenie scenariusza** | Animacja — pudełko się otwiera i wylatują z niego gwiazdki/confetti |
| **Zablokowany scenariusz** | Zamknięte pudełko z kłódką 🔒 |
| **Odblokowany, nieukończony** | Zamknięte pudełko bez kłódki (gotowe do otwarcia) |
| **Ukończony scenariusz** | Otwarte pudełko ze gwiazdkami ⭐ na wierzchu |

### Maskotka — „Boxi"

Prosta maskotka którą można zrobić w CSS/SVG bez grafika:

```
    ┌──────────┐    ← pokrywka (trochę przekrzywiona gdy jest szczęśliwy)
    │  📦      │
    │  ◉  ◉   │    ← oczy (duże, przyjazne)
    │    ‿     │    ← uśmiech
    │          │
    └──────────┘
     ╱        ╲     ← małe rączki (opcjonalne)
```

**Gdzie pojawia się Boxi:**
- Splash screen — Boxi się otwiera (animacja)
- Pusty ekran postępu — Boxi mówi „¡Empieza a jugar!" (Zacznij grać!)
- Poprawna odpowiedź — Boxi jest szczęśliwy (pokrywka się podnosi)
- Błędna odpowiedź — Boxi jest smutny (pokrywka opada)
- Game over — Boxi jest zamknięty i smutny
- Wynik ⭐⭐⭐ — Boxi skacze z radości

**Ważne:** Maskotka to **nice-to-have**, nie blokuje MVP. Można ją dodać jako emoji placeholder 📦 i później zamienić na SVG.

---

## 3. Grupa docelowa i poziomy trudności

### Podział wiekowy

| Cecha | Młodsze dzieci (6–10 lat) | Starsza młodzież (11–15 lat) |
|-------|---------------------------|------------------------------|
| **Poziom** | Principiante (A1) | Intermedio (A2–B1) |
| **Typy pytań** | Obrazki, quiz, słuchanie | Układanie zdań, uzupełnianie luk, słuchanie |
| **Tematyka** | Kolory, zwierzęta, jedzenie, liczby | Podróże, zakupy, sytuacje życiowe |
| **Złożoność** | Pojedyncze słowa, proste frazy | Całe zdania, krótkie dialogi |
| **UI** | Większe przyciski, więcej emoji | Mniejsze elementy, więcej tekstu |

### Poziom Principiante (A1)
- **Słownictwo:** podstawowe 200–300 słów
- **Kategorie:** kolory, liczby 1–20, zwierzęta, jedzenie, rodzina
- **Typy pytań:** Multiple choice, Image match, Listening
- **Mechanika:** 3 serca, 10 pytań na scenariusz

### Poziom Intermedio (A2–B1)
- **Słownictwo:** 500–800 słów + frazy
- **Kategorie:** podróże, kawiarnia, lotnisko, zakupy
- **Typy pytań:** Wszystkie z Principiante + Fill in the blank + Drag & Drop (Word Order)
- **Mechanika:** 3 serca, 10 pytań na scenariusz

---

## 4. Design, paleta kolorów, typografia

### Paleta kolorów

Bazując na Twoich kolorach z proporcjami 60/30/10:

```
Dark (60%):        #080C08  — ciemny prawie-czarny zielony (tła, nagłówki, tekst główny)
Medium Green (30%): #56876D  — stonowany zielony (karty, sekcje, tła drugorzędne)
Deep Green:        #04724D  — głęboki szmaragdowy (przyciski, akcenty, linki)
Accent (10%):      #FFA42C  — amber/pomarańczowy (CTA, wyróżnienia, ważne elementy)

Dodatkowe kolory funkcyjne:
Success:           #10B981  — jasnozielony (poprawna odpowiedź)
Error:             #EF4444  — czerwony (błędna odpowiedź)
Background:        #F0F5F1  — bardzo jasny szaro-zielony (tło główne stron)
Surface:           #FFFFFF  — biały (karty, kafelki)
Text on dark:      #F0F5F1  — jasny tekst na ciemnych tłach
Text light:        #6B7B71  — szaro-zielony (tekst drugorzędny)
```

### Jak używać kolorów

| Element | Kolor | Kod |
|---------|-------|-----|
| Tło strony | Jasny szaro-zielony | `bg-[#F0F5F1]` |
| Nagłówki, tekst główny | Ciemny | `text-[#080C08]` |
| Karty, kafelki | Biały z cieniem | `bg-white shadow-md` |
| Główny przycisk (CTA) | Amber/pomarańczowy | `bg-[#FFA42C] text-white` |
| Przyciski drugorzędne | Głęboki zielony | `bg-[#04724D] text-white` |
| Pasek postępu | Szmaragd → amber gradient | `from-[#04724D] to-[#FFA42C]` |
| Tło sekcji/nagłówka gry | Stonowany zielony | `bg-[#56876D]` |
| Hover na kartach | Lekki zielony | `hover:bg-[#56876D]/10` |
| Poprawna odpowiedź | Zielony | `bg-[#10B981]` |
| Błędna odpowiedź | Czerwony | `bg-[#EF4444]` |
| Zablokowany scenariusz | Szary | `bg-gray-200 opacity-60` |

### Konfiguracja Tailwind

```ts
// tailwind.config.ts
import type { Config } from 'tailwindcss'

export default {
  content: ['./index.html', './src/**/*.{js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        'pb-dark': '#080C08',
        'pb-green': '#56876D',
        'pb-emerald': '#04724D',
        'pb-amber': '#FFA42C',
        'pb-bg': '#F0F5F1',
        'pb-success': '#10B981',
        'pb-error': '#EF4444',
        'pb-text-light': '#6B7B71',
      },
      fontFamily: {
        sans: ['Nunito', 'system-ui', 'sans-serif'],
      },
      borderRadius: {
        'box': '12px',      // zaokrąglenie "pudełkowe"
        'box-lg': '16px',
      },
      boxShadow: {
        'box': '0 4px 0 0 rgba(8, 12, 8, 0.15), 0 2px 8px rgba(8, 12, 8, 0.08)',
        'box-hover': '0 6px 0 0 rgba(8, 12, 8, 0.15), 0 4px 12px rgba(8, 12, 8, 0.12)',
        'box-pressed': '0 2px 0 0 rgba(8, 12, 8, 0.15), 0 1px 4px rgba(8, 12, 8, 0.08)',
      },
    },
  },
  plugins: [],
} satisfies Config
```

**Cienie `shadow-box`** dają kafelkom efekt "uniesionego pudełka" — cień na dole symuluje trójwymiarowość kartonu. Po kliknięciu (`shadow-box-pressed`) cień się zmniejsza — pudełko "opada".

### Typografia

**Font: Nunito** (Google Fonts)
- Zaokrąglony, ciepły, przyjazny dla dzieci
- Czytelny na małych ekranach
- Wagi: 400 (Regular), 600 (SemiBold), 700 (Bold), 800 (ExtraBold)

```html
<!-- index.html -->
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
```

**Rozmiary tekstu:**

| Element | Klasa Tailwind | Przykład |
|---------|---------------|---------|
| Tytuł ekranu | `text-3xl font-extrabold` | "Seleccionar idioma" |
| Tekst pytania | `text-xl font-bold` | "¿Cómo se dice 'gato'?" |
| Odpowiedzi | `text-lg font-semibold` | "cat" |
| Tekst drugorzędny | `text-sm text-pb-text-light` | "Principiante · A1" |
| Wynik | `text-2xl font-extrabold` | "80/100" |

### Styl komponentów — "pudełkowy"

Każdy kafelek/karta w aplikacji ma wyglądać jak mini pudełko:

```tsx
// Bazowy styl "pudełkowy"
<div className="
  bg-white 
  rounded-box 
  shadow-box 
  border-2 border-pb-dark/5
  transition-all duration-150
  hover:shadow-box-hover hover:-translate-y-0.5
  active:shadow-box-pressed active:translate-y-0.5
">
  {/* content */}
</div>
```

Ten styl daje efekt:
- Lekko uniesiona karta (cień na dole)
- Przy hoverze: karta unosi się bardziej
- Przy kliknięciu: karta "opada" (wciśnięcie)
- Subtelna ramka dodaje "krawędź kartonu"

---

## 5. Wszystkie ekrany aplikacji — szczegółowy opis

### 5.1 Splash Screen (Pantalla de carga)

```
┌──────────────────────────────┐
│                              │
│                              │
│         ┌────────┐           │
│         │  📦    │           │
│         │ Boxi   │           │
│         └────────┘           │
│                              │
│       PalabraBox             │
│   Aprende idiomas jugando    │
│                              │
│     ████████░░░░ 60%         │
│                              │
│                              │
└──────────────────────────────┘
```

**Elementy:**
- Logo/maskotka Boxi na środku (animacja: pudełko się otwiera)
- Nazwa "PalabraBox" — duży, bold
- Podtytuł: "Aprende idiomas jugando" (Ucz się języków grając)
- Pasek ładowania (opcjonalny — lub spinner)
- Tło: `pb-bg` (#F0F5F1)
- Czas wyświetlania: 1.5–2 sekundy

**Animacja wejścia (Framer Motion):**
```tsx
<motion.div
  initial={{ y: 30, opacity: 0, scale: 0.9 }}
  animate={{ y: 0, opacity: 1, scale: 1 }}
  transition={{ duration: 0.6, ease: "easeOut" }}
>
  {/* Logo + tekst */}
</motion.div>
```

---

### 5.2 Menú Principal (Menu główne)

```
┌──────────────────────────────┐
│                     ⚙️       │
│                              │
│         ┌────────┐           │
│         │  📦    │           │
│         └────────┘           │
│       PalabraBox             │
│                              │
│   ┌────────────────────────┐ │
│   │   ▶  JUGAR             │ │  ← amber (#FFA42C)
│   └────────────────────────┘ │
│                              │
│   ┌────────────────────────┐ │
│   │   🃏  TARJETAS          │ │  ← emerald (#04724D)
│   └────────────────────────┘ │
│                              │
│   ┌──────────────────────┐   │
│   │ 📊 Progreso rápido   │   │  ← mały panel postępu
│   │ Completado: 2/12     │   │
│   │ Puntos: 450          │   │
│   │ Racha: 🔥 3 días     │   │
│   └──────────────────────┘   │
│                              │
│          v1.0                │
└──────────────────────────────┘
```

**Elementy:**
- **⚙️ Ajustes** — ikona zębatki w prawym górnym rogu → nawiguje do ustawień
- **Logo Boxi + PalabraBox** — na górze
- **JUGAR** — główny przycisk, kolor amber (`pb-amber`), duży, wyraźny
- **TARJETAS** — przycisk fiszek, kolor emerald (`pb-emerald`)
- **Progreso rápido** — mały panel postępu (podsumowanie):
  - Ile scenariuszy ukończono / łącznie
  - Łączne punkty
  - Streak (ile dni z rzędu) z ikoną ognia 🔥
- **v1.0** — wersja na samym dole (drobny tekst)

**Interakcje:**
- JUGAR → `/select-language`
- TARJETAS → `/cards/select-language`
- ⚙️ → `/settings`

---

### 5.3 Seleccionar Idioma (Wybór języka)

```
┌──────────────────────────────┐
│  ←                           │
│                              │
│   ¿Qué idioma quieres       │
│   aprender?                  │
│                              │
│   ┌──────────┐ ┌──────────┐ │
│   │          │ │          │ │
│   │   🇬🇧    │ │   🇪🇸    │ │
│   │          │ │          │ │
│   │ Inglés   │ │ Español  │ │
│   │          │ │          │ │
│   └──────────┘ └──────────┘ │
│                              │
│                              │
└──────────────────────────────┘
```

**Elementy:**
- Strzałka wstecz ← w lewym górnym rogu
- Pytanie: "¿Qué idioma quieres aprender?" (Jakiego języka chcesz się uczyć?)
- Dwie duże karty obok siebie (na telefonie również obok siebie, lub jedna pod drugą jeśli ekran bardzo wąski)
- Każda karta: flaga + nazwa języka
- Styl: `shadow-box`, przy hover `shadow-box-hover`
- Po kliknięciu: karta się podświetla (border amber), krótka pauza 0.3s, przejście dalej

---

### 5.4 Seleccionar Nivel (Wybór poziomu)

```
┌──────────────────────────────┐
│  ←        🇬🇧 Inglés         │
│                              │
│   Selecciona tu nivel:       │
│                              │
│   ┌────────────────────────┐ │
│   │  ⭐ Principiante (A1)  │ │
│   │                        │ │
│   │  Palabras básicas,     │ │
│   │  colores, números,     │ │
│   │  animales              │ │
│   │                        │ │
│   │  Edad: 6-10 años       │ │
│   └────────────────────────┘ │
│                              │
│   ┌────────────────────────┐ │
│   │  ⭐⭐ Intermedio        │ │
│   │       (A2-B1)          │ │
│   │                        │ │
│   │  Frases, diálogos,     │ │
│   │  situaciones reales    │ │
│   │                        │ │
│   │  Edad: 11-15 años      │ │
│   └────────────────────────┘ │
│                              │
└──────────────────────────────┘
```

**Elementy:**
- Strzałka wstecz + aktualny język w nagłówku
- Dwie karty z opisami poziomów
- Przycisk Principiante: border-left amber (aktywny, zachęcający)
- Przycisk Intermedio: border-left emerald

---

### 5.5 Seleccionar Escenario (Wybór scenariusza)

```
┌──────────────────────────────┐
│  ←    🇬🇧 Inglés · A1       │
│                              │
│  Completado: 1/3 · ⭐ 2     │
│  ████████░░░░░░░░░░  33%    │
│                              │
│   ┌──────────┐ ┌──────────┐ │
│   │  📦✨    │ │  📦      │ │
│   │ Colores  │ │ Números  │ │
│   │ ⭐⭐☆    │ │          │ │
│   │ 70pts    │ │ Jugar ▶  │ │
│   └──────────┘ └──────────┘ │
│                              │
│   ┌──────────┐               │
│   │  📦🔒   │               │
│   │ Animales │               │
│   │ Bloqueado│               │
│   │          │               │
│   └──────────┘               │
│                              │
└──────────────────────────────┘
```

**Elementy:**
- Nagłówek: język + poziom + strzałka wstecz
- **Mini panel postępu**: "Completado: 1/3 · ⭐ 2" + pasek procentowy
- Grid kafelków 2 kolumny
- **Stany scenariuszy:**
  - **Ukończony** (📦✨): otwarte pudełko z efektem, gwiazdki, wynik. Można zagrać ponownie
  - **Dostępny** (📦): zamknięte pudełko bez kłódki, przycisk "Jugar ▶"
  - **Zablokowany** (📦🔒): zamknięte pudełko z kłódką, tekst "Bloqueado", szare/przyciemnione, nie da się kliknąć
- **Logika odblokowywania (Opcja C):**
  - Pierwszy scenariusz: zawsze odblokowany
  - Kolejne: wymagają minimum 1 gwiazdki (≥50% wyniku) w poprzednim

**Interakcje:**
- Kliknięcie ukończonego scenariusza → gra (ponownie)
- Kliknięcie dostępnego → gra
- Kliknięcie zablokowanego → nic (lub krótki shake + tooltip "Completa el escenario anterior")

---

### 5.6 Pantalla de Juego (Ekran gry — GŁÓWNY EKRAN)

```
┌──────────────────────────────┐
│  ❤️❤️🩶   Colores   3/10  30│
│  ████████████░░░░░░░░  30%   │
│                              │
│                              │
│   ¿Cómo se dice "rojo"      │
│   en inglés?                 │
│                              │
│                              │
│   ┌────────────────────────┐ │
│   │        blue            │ │
│   └────────────────────────┘ │
│   ┌────────────────────────┐ │
│   │        red    ✅       │ │
│   └────────────────────────┘ │
│   ┌────────────────────────┐ │
│   │        green           │ │
│   └────────────────────────┘ │
│   ┌────────────────────────┐ │
│   │        yellow          │ │
│   └────────────────────────┘ │
│                              │
└──────────────────────────────┘
```

**Layout (od góry do dołu):**

1. **Game Header (stały na górze):**
   - **Lewy róg:** Serca — ❤️ kolorowe (aktywne), 🩶 szare (stracone)
   - **Środek:** Nazwa scenariusza (np. "Colores")
   - **Prawy róg:** Numer pytania (3/10) + Wynik (30 pts)

2. **Pasek postępu:**
   - Pod headerem, pełna szerokość
   - Gradient: `from-pb-emerald to-pb-amber`
   - Wypełnia się od lewej do prawej
   - Animacja płynna (CSS transition)

3. **Obszar pytania (środek ekranu):**
   - Tekst pytania — duży, bold, wyśrodkowany
   - Przy pytaniach Listening: przycisk 🔊 "Escuchar"
   - Przy pytaniach Image Match: obrazek/emoji na górze

4. **Opcje odpowiedzi (dół ekranu):**
   - 4 kafelki, pełna szerokość, jeden pod drugim
   - Styl: `shadow-box`, białe tło, duży tekst
   - Min. wysokość: 52px (łatwe do kliknięcia palcem)
   - Odstępy: `gap-3` między kafelkami

**Stany odpowiedzi (po kliknięciu):**

| Stan | Wygląd | Czas trwania |
|------|--------|-------------|
| Domyślny | Białe tło, ciemny tekst, `shadow-box` | — |
| Hover | Lekkie przesunięcie w górę, `shadow-box-hover` | — |
| Wybrana poprawna | Zielone tło (`pb-success`), biały tekst, ikona ✅ | 1.2s |
| Wybrana błędna | Czerwone tło (`pb-error`), biały tekst, ikona ❌ + poprawna się podświetla na zielono | 1.5s |
| Zablokowana | Wszystkie kafelki `pointer-events-none`, opacity na niewybranych | Podczas animacji |

**Animacje odpowiedzi:**
- **Poprawna:** kafelek lekko się powiększa (`scale: 1.03`), krótki bounce
- **Błędna:** kafelek się trzęsie (`x: [0, -6, 6, -6, 6, 0]`), serce "wylatuje" i zmienia się na szare
- **Przejście do następnego pytania:** fade out pytania + fade in nowego (0.3s)

---

### 5.7 Pantalla de Resultados (Ekran wyników)

```
┌──────────────────────────────┐
│                              │
│         ┌────────┐           │
│         │  📦✨  │           │  ← pudełko się otwiera, wylatują gwiazdki
│         └────────┘           │
│                              │
│   ¡Escenario completado!     │
│                              │
│      ⭐  ⭐  ☆               │
│                              │
│   ┌────────────────────┐     │
│   │ Puntuación: 70/100 │     │
│   │ Correctas:  7/10   │     │
│   │ Vidas: ❤️❤️🩶       │     │
│   └────────────────────┘     │
│                              │
│   ┌────────────────────────┐ │
│   │  🔄  REPETIR           │ │
│   └────────────────────────┘ │
│   ┌────────────────────────┐ │
│   │  ▶  SIGUIENTE          │ │  ← tylko jeśli odblokowano następny
│   └────────────────────────┘ │
│   ┌────────────────────────┐ │
│   │  📋  ESCENARIOS        │ │
│   └────────────────────────┘ │
│                              │
└──────────────────────────────┘
```

**Elementy:**
- Animacja pudełka otwierającego się + gwiazdki wylatujące (przy ≥50%)
- Confetti (przy ⭐⭐⭐) — prosta animacja z canvas-confetti
- Gwiazdki: ⭐ (≥50%), ⭐⭐ (≥70%), ⭐⭐⭐ (≥90%)
- Statystyki w karcie:
  - Puntuación (wynik): 70/100
  - Correctas (poprawne): 7/10
  - Vidas (życia): ile serc zostało
- Przyciski:
  - REPETIR (Powtórz) — ten sam scenariusz od nowa
  - SIGUIENTE (Następny) — następny scenariusz (widoczny tylko gdy odblokowano)
  - ESCENARIOS — powrót do listy scenariuszy

**Przy Game Over (0 serc):**
```
┌──────────────────────────────┐
│                              │
│         ┌────────┐           │
│         │  📦😢  │           │  ← zamknięte smutne pudełko
│         └────────┘           │
│                              │
│     ¡Se acabó el juego!      │
│     (Game Over)              │
│                              │
│   Puntuación: 30/100         │
│   Correctas: 3/10            │
│                              │
│   ┌────────────────────────┐ │
│   │  🔄  INTENTAR DE NUEVO │ │  ← Spróbuj ponownie
│   └────────────────────────┘ │
│   ┌────────────────────────┐ │
│   │  📋  ESCENARIOS        │ │
│   └────────────────────────┘ │
│                              │
└──────────────────────────────┘
```

---

### 5.8 Modo Tarjetas (Tryb fiszek)

```
┌──────────────────────────────┐
│  ←    Colores · Inglés       │
│                              │
│                              │
│   ┌────────────────────────┐ │
│   │                        │ │
│   │                        │ │
│   │         house          │ │  ← PRZÓD: słowo w języku obcym
│   │                        │ │
│   │          🔊            │ │  ← przycisk wymowy
│   │                        │ │
│   │    Toca para girar     │ │  ← "Kliknij żeby odwrócić"
│   │                        │ │
│   └────────────────────────┘ │
│                              │
│       ←  3 / 15  →          │  ← nawigacja między kartami
│                              │
│   ┌────────────────────────┐ │
│   │  ↩️  VOLVER AL MENÚ     │ │
│   └────────────────────────┘ │
│                              │
└──────────────────────────────┘
```

**Po kliknięciu karty (odwrócenie):**
```
┌──────────────────────────────┐
│  ←    Colores · Inglés       │
│                              │
│                              │
│   ┌────────────────────────┐ │
│   │                        │ │
│   │        casa            │ │  ← TYŁ: tłumaczenie
│   │                        │ │
│   │         🏠             │ │  ← emoji/obrazek (jeśli dostępny)
│   │                        │ │
│   │          🔊            │ │  ← wymowa tłumaczenia
│   │                        │ │
│   │    Toca para girar     │ │
│   │                        │ │
│   └────────────────────────┘ │
│                              │
│       ←  3 / 15  →          │
│                              │
└──────────────────────────────┘
```

**Funkcjonalność:**
- Karta się odwraca (animacja flip 3D w CSS/Framer Motion)
- **Przód:** słowo w języku obcym + przycisk 🔊 (TTS)
- **Tył:** tłumaczenie (na język pytania) + emoji/obrazek + przycisk 🔊
- Nawigacja: strzałki ← → lub swipe na telefonie
- Licznik: "3 / 15" (aktualna karta / łączna ilość)
- Skąd dane: z tabeli `words` filtrowane po scenariuszu/kategorii

**Animacja odwracania:**
```tsx
<motion.div
  animate={{ rotateY: isFlipped ? 180 : 0 }}
  transition={{ duration: 0.4 }}
  style={{ transformStyle: 'preserve-3d' }}
>
  {/* Przód i tył karty */}
</motion.div>
```

---

### 5.9 Ajustes (Ustawienia)

```
┌──────────────────────────────┐
│  ←       Ajustes             │
│                              │
│   IDIOMA DE LA APP           │
│   ┌────────────────────────┐ │
│   │  🇪🇸 Español     ✅    │ │
│   │  🇵🇱 Polski   Próxim. │ │  ← "Próximamente" (Wkrótce)
│   └────────────────────────┘ │
│                              │
│   SONIDO                     │
│   Efectos de sonido          │
│   ──────●──────────── 80%    │  ← slider głośności efektów
│                              │
│   PRONUNCIACIÓN              │
│   Volumen TTS                │
│   ────────●──────────  60%   │  ← slider głośności TTS
│                              │
│   Velocidad TTS              │
│   ──●──────────────── 30%    │  ← slider szybkości TTS
│   Lento ·  Normal  · Rápido │
│                              │
│   INFORMACIÓN                │
│   ┌────────────────────────┐ │
│   │ PalabraBox v1.0        │ │
│   │ Desarrollado por:      │ │
│   │ Jakub Laskowski & [Kolega]       │ │
│   │ Málaga 2025            │ │
│   │                        │ │
│   │ Prácticas en Arrabal   │ │
│   └────────────────────────┘ │
│                              │
└──────────────────────────────┘
```

**Funkcjonalności:**
1. **Idioma de la app (Język aplikacji):**
   - Español: aktywne (✅)
   - Polski: placeholder z etykietą "Próximamente" (wkrótce), wyszarzone, nieklikalne
   - Przygotowane pod przyszłe tłumaczenie (i18n-ready w kodzie)

2. **Efectos de sonido (Efekty dźwiękowe):**
   - Slider 0–100%
   - Kontroluje głośność: click, correct, wrong, level-complete
   - Wartość zapisywana w localStorage

3. **Volumen TTS (Głośność wymowy):**
   - Slider 0–100%
   - Kontroluje głośność SpeechSynthesis
   - 0% = wymowa wyłączona

4. **Velocidad TTS (Szybkość wymowy):**
   - Slider z 3 pozycjami: Lento (0.6) / Normal (0.9) / Rápido (1.2)
   - Kontroluje `utterance.rate` w SpeechSynthesis API

5. **Información (Informacje):**
   - Nazwa, wersja, autorzy (Jakub Laskowski & Błażej Goliszek)
   - Kontekst: praktyki w Maladze, Arrabal

**Zapisywanie ustawień:**
```ts
// Wszystko w localStorage pod jednym kluczem
const settings = {
  language: 'es',           // na razie zawsze 'es'
  soundVolume: 0.8,         // 0-1
  ttsVolume: 0.6,           // 0-1
  ttsSpeed: 0.9,            // 0.6, 0.9, lub 1.2
}
localStorage.setItem('palabrabox-settings', JSON.stringify(settings))
```

---

## 6. Mechaniki pytań — szczegółowy opis

### 6.1 Multiple Choice (Selección múltiple)

**Poziomy:** Principiante + Intermedio
**Opis:** 4 kafelki, jedna poprawna odpowiedź

**Przykład (nauka angielskiego):**
```
Pregunta: "¿Cómo se dice 'rojo' en inglés?"
Opciones: [blue] [red ✅] [green] [yellow]
```

**Przykład (nauka hiszpańskiego):**
```
Pregunta: "¿Cómo se dice 'cat' en español?"
Opciones: [perro] [gato ✅] [pájaro] [pez]
```

**Logika komponentu:**
1. Otrzymuje `question: Question` jako props
2. Miesza odpowiedzi: `[correct_answer, ...wrong_answers]` → `shuffleArray()`
3. Renderuje 4 kafelki
4. Po kliknięciu:
   - Ustawia `selectedAnswer`
   - Blokuje dalsze klikanie (`disabled = true`)
   - Podświetla wybraną (zielono lub czerwono)
   - Jeśli błędna → pokazuje poprawną na zielono
   - Gra dźwięk (correct/wrong)
   - Po 1.2s (poprawna) lub 1.5s (błędna) → wywołuje `onAnswer(isCorrect)`

**Props:**
```ts
interface QuestionComponentProps {
  question: Question
  onAnswer: (isCorrect: boolean) => void
  language: 'english' | 'spanish'
}
```

---

### 6.2 Image Match (Coincidencia de imagen)

**Poziomy:** Principiante
**Opis:** Duży obrazek/emoji na górze, 4 opcje tekstowe pod spodem

**Przykład:**
```
Imagen: 🐱 (duży emoji, text-7xl)
Pregunta: "¿Qué animal es este?"
Opciones: [dog] [cat ✅] [bird] [fish]
```

**Różnica vs Multiple Choice:**
- Na górze jest duży obrazek/emoji
- Reszta logiki identyczna
- Jeśli `question.image_url` jest ustawiony → `<img>`, jeśli nie → emoji z `question.question_text`

---

### 6.3 Listening (Escucha)

**Poziomy:** Principiante + Intermedio
**Opis:** Gracz odsłuchuje słowo/zdanie i wybiera poprawne tłumaczenie

**Przykład (Principiante):**
```
[🔊 Escuchar] → TTS czyta: "green"
Pregunta: "¿Qué significa esta palabra?"
Opciones: [rojo] [azul] [verde ✅] [amarillo]
```

**Przykład (Intermedio):**
```
[🔊 Escuchar] → TTS czyta: "I would like a coffee, please"
Pregunta: "¿Qué significa esta frase?"
Opciones: [Me gustaría un café, por favor ✅] [Quiero un té] [No me gusta el café] [El café es caro]
```

**Logika:**
1. Na górze: duży przycisk 🔊 "Escuchar"
2. Kliknięcie → `speak(question.question_text_tts, language)`
3. Podczas odtwarzania: przycisk pulsuje (animacja), tekst zmienia się na "Reproduciendo..."
4. Gracz może kliknąć wielokrotnie
5. Pod spodem: 4 opcje (jak Multiple Choice)

---

### 6.4 Fill in the Blank (Completar la frase)

**Poziomy:** Intermedio
**Opis:** Zdanie z luką, gracz wybiera słowo

**Przykład:**
```
Frase: "I ___ to school every day."
Opciones: [go ✅] [eat] [sleep] [run]
```

**Wyświetlanie:**
```
┌──────────────────────────────┐
│                              │
│   Completa la frase:         │
│                              │
│   "I _______ to school      │
│    every day."               │
│                              │
│   ┌──────┐ ┌──────┐         │
│   │  go  │ │  eat │         │
│   └──────┘ └──────┘         │
│   ┌──────┐ ┌──────┐         │
│   │ sleep│ │  run │         │
│   └──────┘ └──────┘         │
│                              │
└──────────────────────────────┘
```

**Logika:**
- Zdanie z `___` (placeholder luki)
- 4 opcje jako mniejsze kafelki (grid 2x2)
- Po wybraniu: słowo "wskakuje" w lukę (animacja)
- Feedback: zielone/czerwone jak w Multiple Choice

---

### 6.5 Drag & Drop / Word Order (Ordenar palabras)

**Poziomy:** Intermedio
**Opis:** Słowa w losowej kolejności, gracz przeciąga je w poprawną kolejność

**Przykład:**
```
Pista: "Me gusta comer pizza" (tłumaczenie/podpowiedź)
Palabras desordenadas: [pizza] [like] [eating] [I]
Respuesta correcta: [I] [like] [eating] [pizza]
```

**Wyświetlanie:**
```
┌──────────────────────────────┐
│                              │
│   Ordena las palabras:       │
│                              │
│   Pista: "Me gusta           │
│   comer pizza"               │
│                              │
│   Tu frase:                  │
│   ┌──┐ ┌────────┐ ┌──┐      │  ← zona donde se construye
│   │I │ │ eating │ │  │      │     la frase
│   └──┘ └────────┘ └──┘      │
│                              │
│   Palabras:                  │
│   ┌──────┐ ┌──────┐         │  ← palabras disponibles
│   │ pizza│ │ like │         │
│   └──────┘ └──────┘         │
│                              │
│   ┌────────────────────────┐ │
│   │  ✓  COMPROBAR          │ │  ← sprawdź odpowiedź
│   └────────────────────────┘ │
│   ┌────────────────────────┐ │
│   │  ↩️  REINICIAR          │ │  ← wyczyść i zacznij od nowa
│   └────────────────────────┘ │
│                              │
└──────────────────────────────┘
```

**Logika (z @dnd-kit):**
1. Słowa w losowej kolejności na dole ("Palabras disponibles")
2. Strefa budowania zdania na górze ("Tu frase")
3. Gracz przeciąga słowa z dołu do góry (lub klika — fallback)
4. Może zmieniać kolejność w strefie budowania
5. Przycisk "COMPROBAR" (Sprawdź) → porównanie z `correct_answer`
6. Przycisk "REINICIAR" (Resetuj) → słowa wracają na dół
7. Podpowiedź (hint) z tłumaczeniem jest widoczna cały czas

**Fallback bez drag & drop:**
Jeśli `@dnd-kit` będzie za trudny, implementujemy klikanie:
- Gracz klika słowo na dole → słowo przesuwa się na górę (na koniec zdania)
- Kliknięcie słowa na górze → wraca na dół
- Ta sama logika sprawdzania

**Ten fallback jest oznaczony w planie dnia 5 jako backup plan.**

---

## 7. System fiszek (Tarjetas)

### Skąd biorą się fiszki?

Fiszki używają danych z tabeli `words` w Supabase. Każde słówko ma:
- `word` — słowo w języku obcym
- `translation_es` — tłumaczenie hiszpańskie (lub `translation_en` jeśli uczymy się hiszpańskiego)
- `category` — kategoria (pokrywająca się ze scenariuszem)
- `image_url` — obrazek/emoji (opcjonalny)

### Flow fiszek

```
Menú → TARJETAS → Seleccionar idioma → Seleccionar nivel → Seleccionar escenario → Modo tarjetas
```

### Funkcjonalności fiszek

| Funkcja | Opis | Priorytet |
|---------|------|-----------|
| Przeglądanie kart | Strzałki ←→ lub swipe | 🔴 MVP |
| Odwracanie karty | Klik → flip animation | 🔴 MVP |
| TTS na przodzie | 🔊 wymowa słowa obcego | 🔴 MVP |
| TTS na tyle | 🔊 wymowa tłumaczenia | 🟡 Ważne |
| Licznik | "3 / 15" | 🔴 MVP |
| Emoji/obrazek na tyle | Wizualna podpowiedź | 🟢 Nice-to-have |

---

## 8. Nauka wymowy — TTS

### Implementacja

Używamy **Web Speech API (SpeechSynthesis)** — wbudowane w przeglądarkę, darmowe, bez limitu.

```ts
// services/speechService.ts

export function speak(
  text: string,
  language: 'en' | 'es',
  rate: number = 0.9,
  volume: number = 1.0
): Promise<void> {
  return new Promise((resolve, reject) => {
    if (!('speechSynthesis' in window)) {
      reject(new Error('TTS not supported'))
      return
    }

    window.speechSynthesis.cancel()

    const utterance = new SpeechSynthesisUtterance(text)
    utterance.lang = language === 'en' ? 'en-US' : 'es-ES'
    utterance.rate = rate
    utterance.volume = volume
    utterance.pitch = 1.0

    utterance.onend = () => resolve()
    utterance.onerror = (e) => reject(e)

    window.speechSynthesis.speak(utterance)
  })
}
```

### Gdzie używamy TTS

| Miejsce | Co czyta | Język |
|---------|---------|-------|
| Pytanie Listening | Słowo/zdanie do odgadnięcia | Język nauki (en/es) |
| Fiszka — przód | Słowo w języku obcym | Język nauki |
| Fiszka — tył | Tłumaczenie | Język interfejsu (es) |
| SpeakButton (🔊) przy odpowiedziach | Słowo na kafelku | Język nauki |
| Ekran wyników — powtórka słówek | Słowa z ukończonego scenariusza | Język nauki |

### Ustawienia TTS

Pobierane z `localStorage` (ekran Ajustes):
```ts
const settings = getSettings()
speak(text, language, settings.ttsSpeed, settings.ttsVolume)
```

---

## 9. System postępu i punktacji

### Punktacja

| Akcja | Punkty |
|-------|--------|
| Poprawna odpowiedź | +10 pts |
| Błędna odpowiedź | 0 pts (tracisz serce) |
| Maksimum za scenariusz (10 pytań) | 100 pts |

### System żyć (vidas)

- Start: **3 serca** ❤️❤️❤️
- Błędna odpowiedź: **-1 serce**
- 0 serc: **Game Over** → ekran przegranej
- Nie ma sposobu na odzyskanie serc w trakcie scenariusza

### Gwiazdki (estrellas)

Przyznawane na ekranie wyników na podstawie % poprawnych odpowiedzi:

| Wynik | Gwiazdki | Warunek odblokowania następnego |
|-------|----------|-------------------------------|
| < 50% (0–4/10) | ☆☆☆ (0 gwiazdek) | ❌ Nie odblokowuje |
| ≥ 50% (5–6/10) | ⭐☆☆ (1 gwiazdka) | ✅ Odblokowuje następny |
| ≥ 70% (7–8/10) | ⭐⭐☆ (2 gwiazdki) | ✅ |
| ≥ 90% (9–10/10) | ⭐⭐⭐ (3 gwiazdki) | ✅ |

**Uwaga:** Jeśli gracz ma Game Over (0 serc), wynik jest liczony na podstawie odpowiedzi udzielonych przed game over.

### Postęp — co zapisujemy w localStorage

```ts
interface UserProgress {
  completedScenarios: {
    scenarioId: string
    language: 'english' | 'spanish'
    level: 'beginner' | 'intermediate'
    bestScore: number      // najlepszy wynik (0-100)
    stars: number          // 0-3
    completedAt: string    // ISO date
  }[]
  totalScore: number       // suma najlepszych wyników ze wszystkich scenariuszy
  streak: {
    count: number          // ile dni z rzędu
    lastPlayedDate: string // "2025-01-15"
  }
}
```

### Gdzie wyświetlamy postęp

1. **Menú principal — mini panel:**
   ```
   Completado: 4/12 escenarios
   Puntos: 350
   Racha: 🔥 3 días
   ```

2. **Seleccionar escenario — przy każdym kafelku:**
   - Gwiazdki (⭐⭐☆)
   - Najlepszy wynik (70 pts)
   - Pasek procentowy na górze ("Completado: 2/3 · ⭐ 5")

### Logika streak (racha)

```ts
function updateStreak(): void {
  const today = new Date().toISOString().split('T')[0]  // "2025-01-15"
  const progress = getProgress()

  if (progress.streak.lastPlayedDate === today) {
    // Już grał dzisiaj — nic nie zmieniaj
    return
  }

  const yesterday = new Date(Date.now() - 86400000).toISOString().split('T')[0]

  if (progress.streak.lastPlayedDate === yesterday) {
    // Grał wczoraj — kontynuuj streak
    progress.streak.count += 1
  } else {
    // Nie grał wczoraj — resetuj streak
    progress.streak.count = 1
  }

  progress.streak.lastPlayedDate = today
  saveProgress(progress)
}
```

---

## 10. Technologie — dokładne omówienie

### React + TypeScript + Vite

**React** — biblioteka do budowania UI z komponentów. Każdy element ekranu (przycisk, karta, pytanie) to osobny komponent React.

**TypeScript** — JavaScript z typami. Eliminuje błędy na etapie pisania kodu (zamiast na produkcji).

**Vite** — narzędzie budujące. Start projektu w <1s, natychmiastowy hot reload.

**Tworzenie projektu:**
```bash
npm create vite@latest palabrabox -- --template react-ts
```

---

### Tailwind CSS

Utility-first CSS. Style pisane bezpośrednio w JSX:
```tsx
<button className="bg-pb-amber text-white font-bold py-3 px-6 rounded-box shadow-box
                   hover:shadow-box-hover hover:-translate-y-0.5
                   active:shadow-box-pressed active:translate-y-0.5
                   transition-all duration-150">
  Jugar
</button>
```

---

### Zustand (state management)

Globalny store z danymi gry:

```ts
// store/gameStore.ts
import { create } from 'zustand'

interface GameState {
  // Wybory gracza
  language: 'english' | 'spanish'
  level: 'beginner' | 'intermediate'

  // Stan gry
  score: number
  lives: number
  currentQuestionIndex: number
  questions: Question[]
  status: 'idle' | 'playing' | 'game_over' | 'completed'
  answers: { questionId: string; isCorrect: boolean }[]

  // Akcje
  setLanguage: (lang: 'english' | 'spanish') => void
  setLevel: (level: 'beginner' | 'intermediate') => void
  startGame: (questions: Question[]) => void
  answerQuestion: (isCorrect: boolean, questionId: string) => void
  nextQuestion: () => void
  resetGame: () => void
}

export const useGameStore = create<GameState>((set, get) => ({
  language: 'english',
  level: 'beginner',
  score: 0,
  lives: 3,
  currentQuestionIndex: 0,
  questions: [],
  status: 'idle',
  answers: [],

  setLanguage: (language) => set({ language }),
  setLevel: (level) => set({ level }),

  startGame: (questions) => set({
    questions,
    score: 0,
    lives: 3,
    currentQuestionIndex: 0,
    status: 'playing',
    answers: [],
  }),

  answerQuestion: (isCorrect, questionId) => set((state) => ({
    score: isCorrect ? state.score + 10 : state.score,
    lives: isCorrect ? state.lives : state.lives - 1,
    status: state.lives - (isCorrect ? 0 : 1) <= 0 ? 'game_over' : state.status,
    answers: [...state.answers, { questionId, isCorrect }],
  })),

  nextQuestion: () => set((state) => {
    const nextIndex = state.currentQuestionIndex + 1
    if (nextIndex >= state.questions.length) {
      return { status: 'completed', currentQuestionIndex: nextIndex }
    }
    return { currentQuestionIndex: nextIndex }
  }),

  resetGame: () => set({
    score: 0,
    lives: 3,
    currentQuestionIndex: 0,
    status: 'idle',
    answers: [],
  }),
}))
```

---

### Framer Motion (animacje)

Używamy umiarkowanie — subtelne, przyjemne animacje bez przesady:

```tsx
// Przejście między stronami
<AnimatePresence mode="wait">
  <motion.div
    key={location.pathname}
    initial={{ opacity: 0, y: 20 }}
    animate={{ opacity: 1, y: 0 }}
    exit={{ opacity: 0, y: -20 }}
    transition={{ duration: 0.25 }}
  >
    {children}
  </motion.div>
</AnimatePresence>

// Shake przy błędnej odpowiedzi
<motion.div animate={isWrong ? { x: [0, -6, 6, -6, 6, 0] } : {}} transition={{ duration: 0.4 }}>

// Bounce przy poprawnej
<motion.div animate={isCorrect ? { scale: [1, 1.05, 1] } : {}} transition={{ duration: 0.3 }}>

// Flip karty (fiszki)
<motion.div animate={{ rotateY: isFlipped ? 180 : 0 }} transition={{ duration: 0.4 }}>
```

**Lista animacji w MVP:**
1. Przejście między stronami (fade + slide)
2. Poprawna odpowiedź (bounce)
3. Błędna odpowiedź (shake)
4. Strata serca (fade out + zmiana koloru)
5. Pasek postępu (płynne wypełnianie)
6. Flip karty (fiszki)
7. Wejście elementów na ekranie wyników (staggered)

**NIE robimy:**
- Złożonych animacji cząsteczek
- Animacji maskotki (poza prostym emoji)
- Skomplikowanych przejść 3D

---

### Howler.js (dźwięki)

```ts
// services/audioService.ts
import { Howl } from 'howler'

const sounds = {
  correct: new Howl({ src: ['/sounds/correct.mp3'], volume: 0.7 }),
  wrong: new Howl({ src: ['/sounds/wrong.mp3'], volume: 0.7 }),
  click: new Howl({ src: ['/sounds/click.mp3'], volume: 0.5 }),
  levelComplete: new Howl({ src: ['/sounds/level-complete.mp3'], volume: 0.8 }),
  gameOver: new Howl({ src: ['/sounds/game-over.mp3'], volume: 0.6 }),
}

export function playSound(name: keyof typeof sounds) {
  const settings = getSettings()
  const sound = sounds[name]
  sound.volume(settings.soundVolume)
  sound.play()
}
```

**Pliki dźwiękowe do pobrania (5 plików z mixkit.co):**
1. `correct.mp3` — szukaj "correct answer ding"
2. `wrong.mp3` — szukaj "wrong buzzer soft"
3. `click.mp3` — szukaj "button click"
4. `level-complete.mp3` — szukaj "achievement unlock"
5. `game-over.mp3` — szukaj "game over soft"

---

### Supabase

```ts
// lib/supabase.ts
import { createClient } from '@supabase/supabase-js'

export const supabase = createClient(
  import.meta.env.VITE_SUPABASE_URL,
  import.meta.env.VITE_SUPABASE_ANON_KEY
)
```

**Zapytania których potrzebujemy:**
```ts
// Pobierz scenariusze dla danego języka i poziomu
const { data: scenarios } = await supabase
  .from('scenarios')
  .select('*')
  .eq('language', 'english')
  .eq('level', 'beginner')
  .order('sort_order')

// Pobierz pytania do scenariusza
const { data: questions } = await supabase
  .from('questions')
  .select('*')
  .eq('scenario_id', scenarioId)
  .order('sort_order')

// Pobierz słówka do fiszek (dla danej kategorii)
const { data: words } = await supabase
  .from('words')
  .select('*')
  .eq('language', 'english')
  .eq('level', 'beginner')
  .eq('category', 'colors')
```

---

### React Router v6

```tsx
// App.tsx
<BrowserRouter>
  <Routes>
    <Route path="/" element={<SplashScreen />} />
    <Route path="/menu" element={<MainMenu />} />
    <Route path="/select-language" element={<LanguageSelect />} />
    <Route path="/select-level" element={<LevelSelect />} />
    <Route path="/scenarios" element={<ScenarioSelect />} />
    <Route path="/game/:scenarioId" element={<GameScreen />} />
    <Route path="/results" element={<ResultsScreen />} />
    <Route path="/cards/select-language" element={<CardsLanguageSelect />} />
    <Route path="/cards/select-level" element={<CardsLevelSelect />} />
    <Route path="/cards/select-scenario" element={<CardsScenarioSelect />} />
    <Route path="/cards/:scenarioId" element={<CardsDeck />} />
    <Route path="/settings" element={<SettingsScreen />} />
  </Routes>
</BrowserRouter>
```

---

### vite-plugin-pwa

```ts
// vite.config.ts
VitePWA({
  registerType: 'autoUpdate',
  manifest: {
    name: 'PalabraBox — Aprende idiomas jugando',
    short_name: 'PalabraBox',
    description: 'Juego interactivo para aprender inglés y español',
    theme_color: '#080C08',
    background_color: '#F0F5F1',
    display: 'standalone',
    orientation: 'portrait',
    icons: [
      { src: '/icon-192.png', sizes: '192x192', type: 'image/png' },
      { src: '/icon-512.png', sizes: '512x512', type: 'image/png', purpose: 'any maskable' },
    ],
  },
})
```

---

## 11. Schemat bazy danych

```sql
-- ========================================
-- TABELA: words (słówka — do fiszek i pytań)
-- ========================================
CREATE TABLE words (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  word TEXT NOT NULL,
  language TEXT NOT NULL CHECK (language IN ('english', 'spanish')),
  level TEXT NOT NULL CHECK (level IN ('beginner', 'intermediate')),
  category TEXT NOT NULL,
  translation_es TEXT NOT NULL,
  translation_en TEXT,
  image_emoji TEXT,
  audio_text TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- ========================================
-- TABELA: scenarios (scenariusze)
-- ========================================
CREATE TABLE scenarios (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  title_display TEXT NOT NULL,
  language TEXT NOT NULL CHECK (language IN ('english', 'spanish')),
  level TEXT NOT NULL CHECK (level IN ('beginner', 'intermediate')),
  description TEXT,
  emoji TEXT,
  category TEXT NOT NULL,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT NOW()
);

-- ========================================
-- TABELA: questions (pytania)
-- ========================================
CREATE TABLE questions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  scenario_id UUID REFERENCES scenarios(id) ON DELETE CASCADE,
  type TEXT NOT NULL CHECK (type IN (
    'multiple_choice', 'image_match', 'listening', 'fill_blank', 'word_order'
  )),
  question_text TEXT NOT NULL,
  question_text_tts TEXT,
  correct_answer TEXT NOT NULL,
  wrong_answers TEXT[] NOT NULL,
  hint TEXT,
  image_emoji TEXT,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Indeksy
CREATE INDEX idx_words_lang_level ON words(language, level);
CREATE INDEX idx_words_category ON words(category);
CREATE INDEX idx_scenarios_lang_level ON scenarios(language, level);
CREATE INDEX idx_questions_scenario ON questions(scenario_id);
```

**Uwagi:**
- Używamy `image_emoji` (np. "🐱") zamiast `image_url` — prostsze, zero hostingu obrazków
- `translation_es` jest wymagane (bo interfejs po hiszpańsku), `translation_en` opcjonalne
- `category` w `words` łączy słówka ze scenariuszami (np. category='colors' → scenariusz "Colores")
- `title_display` w `scenarios` to tytuł wyświetlany w UI (np. "Colores y Formas"), `title` to ID tekstowe

---

## 12. Struktura projektu

```
palabrabox/
├── public/
│   ├── icon-192.png
│   ├── icon-512.png
│   ├── favicon.ico
│   └── sounds/
│       ├── correct.mp3
│       ├── wrong.mp3
│       ├── click.mp3
│       ├── level-complete.mp3
│       └── game-over.mp3
│
├── src/
│   ├── components/
│   │   ├── ui/
│   │   │   ├── Button.tsx
│   │   │   ├── Card.tsx
│   │   │   ├── ProgressBar.tsx
│   │   │   ├── Hearts.tsx
│   │   │   ├── Stars.tsx
│   │   │   ├── Modal.tsx
│   │   │   ├── Slider.tsx
│   │   │   └── SpeakButton.tsx
│   │   │
│   │   ├── layout/
│   │   │   ├── PageTransition.tsx
│   │   │   ├── BackButton.tsx
│   │   │   ├── GameHeader.tsx
│   │   │   └── ScreenWrapper.tsx
│   │   │
│   │   ├── questions/
│   │   │   ├── QuestionRenderer.tsx
│   │   │   ├── MultipleChoice.tsx
│   │   │   ├── ImageMatch.tsx
│   │   │   ├── Listening.tsx
│   │   │   ├── FillBlank.tsx
│   │   │   └── WordOrder.tsx
│   │   │
│   │   ├── cards/
│   │   │   ├── FlashCard.tsx
│   │   │   └── CardDeck.tsx
│   │   │
│   │   └── game/
│   │       ├── AnswerFeedback.tsx
│   │       ├── ScenarioCard.tsx
│   │       └── BoxiMascot.tsx
│   │
│   ├── pages/
│   │   ├── SplashScreen.tsx
│   │   ├── MainMenu.tsx
│   │   ├── LanguageSelect.tsx
│   │   ├── LevelSelect.tsx
│   │   ├── ScenarioSelect.tsx
│   │   ├── GameScreen.tsx
│   │   ├── ResultsScreen.tsx
│   │   ├── CardsFlowPages.tsx
│   │   └── SettingsScreen.tsx
│   │
│   ├── store/
│   │   ├── gameStore.ts
│   │   └── settingsStore.ts
│   │
│   ├── services/
│   │   ├── speechService.ts
│   │   ├── audioService.ts
│   │   └── progressService.ts
│   │
│   ├── hooks/
│   │   ├── useGame.ts
│   │   ├── useScenarios.ts
│   │   ├── useWords.ts
│   │   └── useSpeech.ts
│   │
│   ├── lib/
│   │   └── supabase.ts
│   │
│   ├── types/
│   │   └── index.ts
│   │
│   ├── utils/
│   │   ├── shuffleArray.ts
│   │   ├── calculateStars.ts
│   │   └── cn.ts
│   │
│   ├── App.tsx
│   ├── main.tsx
│   └── index.css
│
├── .env.local
├── .gitignore
├── index.html
├── package.json
├── tailwind.config.ts
├── tsconfig.json
├── vite.config.ts
└── README.md
```

---

## 13. Konfiguracja środowiska — od zera

### Krok 1: Node.js
```bash
node -v   # wymagane ≥ 18
npm -v
```

### Krok 2: Projekt
```bash
npm create vite@latest palabrabox -- --template react-ts
cd palabrabox
npm install
```

### Krok 3: Biblioteki
```bash
# Tailwind
npm install -D tailwindcss @tailwindcss/vite

# Routing + state
npm install react-router-dom zustand

# Animacje
npm install framer-motion

# Audio
npm install howler
npm install -D @types/howler

# Drag & drop
npm install @dnd-kit/core @dnd-kit/sortable @dnd-kit/utilities

# Supabase
npm install @supabase/supabase-js

# PWA
npm install -D vite-plugin-pwa

# Confetti (opcjonalnie)
npm install canvas-confetti
npm install -D @types/canvas-confetti
```

### Krok 4: Konfiguracja plików

**`src/index.css`:**
```css
@import "tailwindcss";
```

**`vite.config.ts`:** (z sekcji technologie)

**`tailwind.config.ts`:** (z sekcji design)

**`.env.local`:**
```
VITE_SUPABASE_URL=https://xxx.supabase.co
VITE_SUPABASE_ANON_KEY=eyJ...
```

### Krok 5: Supabase
1. supabase.com → nowy projekt
2. SQL Editor → wklejenie schematu tabel
3. Settings → API → skopiowanie URL i klucza

### Krok 6: Git + GitHub
```bash
git init
git remote add origin https://github.com/USER/palabrabox.git
git checkout -b dev
git add .
git commit -m "chore: initial setup"
git push -u origin dev
```

### Krok 7: Vercel
```bash
npm install -g vercel
vercel login
vercel
# Dodaj env variables w Vercel Dashboard
```

### Krok 8: VSCode Extensions
- ESLint
- Prettier
- Tailwind CSS IntelliSense
- GitLens
- ES7+ React snippets

---

## 14. Plan 10 dni — szczegółowy harmonogram

---

### DZIEŃ 1 — Setup i fundament

#### Cel: Projekt działa lokalnie, Supabase ma tabele z testowymi danymi, puste strony z routingiem, Tailwind skonfigurowany z paletą PalabraBox.

#### Jakub Laskowski — Backend & dane (4-5h)

**1. Supabase setup (2h):**
- Utworzenie konta i projektu na supabase.com
- Uruchomienie SQL (tworzenie tabel words, scenarios, questions)
- Wrzucenie testowych danych:
  - 1 scenariusz angielski beginner ("Colors") z 5 pytaniami
  - 5 słówek do tabeli words (red, blue, green, yellow, black)
- Przetestowanie zapytań w SQL Editor

**2. Klient Supabase + typy (2h):**
- `src/lib/supabase.ts` — klient Supabase
- `src/types/index.ts` — wszystkie interfejsy:
  ```ts
  Word, Scenario, Question, QuestionType,
  Language, Level, GameState, UserProgress,
  Settings
  ```
- Prosty test: komponent testowy pobierający dane z Supabase → console.log
- Plik `.env.local` z kluczami

**3. Store (30min):**
- `src/store/settingsStore.ts` — ustawienia (głośność, TTS)
- Odczyt/zapis z localStorage

#### Kolega — Frontend & config (4-5h)

**1. Inicjalizacja (1h):**
- `npm create vite@latest palabrabox -- --template react-ts`
- Instalacja WSZYSTKICH bibliotek (pełna lista)
- Sprawdzenie że `npm run dev` działa

**2. Tailwind + design system (1.5h):**
- `tailwind.config.ts` z paletą PalabraBox (pb-dark, pb-green, pb-emerald, pb-amber, pb-bg)
- Customowe shadow-box, rounded-box
- Import fonta Nunito w `index.html`
- `src/index.css` z `@import "tailwindcss"`
- Test: strona z kolorami palety i fontami — upewnienie się że wszystko wygląda dobrze

**3. React Router (1h):**
- `App.tsx` z BrowserRouter i Routes
- Puste komponenty dla WSZYSTKICH stron (placeholder z nazwą strony):
  ```
  SplashScreen, MainMenu, LanguageSelect, LevelSelect,
  ScenarioSelect, GameScreen, ResultsScreen,
  CardsLanguageSelect, CardsLevelSelect, CardsScenarioSelect, CardsDeck,
  SettingsScreen
  ```
- Nawigacja między nimi (przyciski "Siguiente" na każdej stronie)

**4. PWA + utils (30min):**
- `vite.config.ts` z VitePWA
- Placeholder ikony (192px i 512px) — mogą być proste kolorowe kwadraty z "PB"
- `src/utils/cn.ts`, `shuffleArray.ts`, `calculateStars.ts`

**5. GitHub (30min):**
- Utworzenie repo `palabrabox`
- Push pierwszego commita
- Dodanie kolegi jako collaborator

#### Razem na koniec dnia (30min):
- Sprawdzenie: `npm run dev` działa u obu
- Połączenie kodu (merge)
- Sprawdzenie: nawigacja działa, Supabase odpowiada (dane w konsoli)

#### ✅ Deliverable dnia 1:
- Projekt działa lokalnie
- Tailwind z paletą PalabraBox
- Routing z pustymi stronami
- Supabase z tabelami i testowymi danymi
- Typy TypeScript gotowe
- Repo na GitHubie

---

### DZIEŃ 2 — Menu, nawigacja i Zustand

#### Cel: Gracz widzi menu główne, może wybrać język i poziom. Store trzyma wybory. Ekrany wyglądają ładnie z designem PalabraBox.

#### Jakub Laskowski — Store & logika (4-5h)

**1. Zustand gameStore (2h):**
- `src/store/gameStore.ts` z pełną implementacją:
  - Pola: language, level, score, lives, currentQuestionIndex, questions, status, answers
  - Akcje: setLanguage, setLevel, startGame, answerQuestion, nextQuestion, resetGame
- Pełna typizacja TypeScript
- Test: ręczne wywołanie akcji w konsoli przeglądarki

**2. Services (2h):**
- `src/services/speechService.ts` — TTS (speak, isSpeechSupported)
- `src/services/audioService.ts` — Howler.js setup (na razie z placeholder dźwiękami lub bez plików — samo przygotowanie kodu)
- `src/services/progressService.ts` — localStorage (saveProgress, getProgress, updateStreak)
- Test TTS: przycisk "Mów" → czyta "Hola, bienvenido a PalabraBox"

**3. Hooks — szkielety (30min):**
- `src/hooks/useScenarios.ts` — pobieranie scenariuszy z Supabase (szablon)
- `src/hooks/useGame.ts` — szablon hooka gry

#### Kolega — UI ekranów (4-5h)

**1. Komponenty bazowe UI (2h):**
- `Button.tsx`:
  - Warianty: primary (amber), secondary (emerald), ghost (przezroczysty), danger (czerwony)
  - Rozmiary: sm, md, lg
  - Styl pudełkowy: `shadow-box`, hover, active
  ```tsx
  <Button variant="primary" size="lg" onClick={...}>Jugar</Button>
  ```
- `Card.tsx`:
  - Biała karta z shadow-box
  - Opcjonalny onClick, hover effect
  - Props: className pass-through dla customizacji
- `BackButton.tsx`:
  - Ikona ← + `useNavigate(-1)`
  - Pozycja: lewy górny róg

**2. SplashScreen (30min):**
- Logo 📦 + "PalabraBox" + "Aprende idiomas jugando"
- Auto-redirect do /menu po 2 sekundach
- Animacja wejścia (Framer Motion: fade + scale)

**3. MainMenu (1h):**
- Logo + nazwa
- Przycisk JUGAR (amber, duży)
- Przycisk TARJETAS (emerald)
- Mini panel postępu (na razie placeholder dane)
- Ikona ⚙️ w prawym górnym rogu

**4. LanguageSelect (30min):**
- "¿Qué idioma quieres aprender?"
- Dwie karty: 🇬🇧 Inglés, 🇪🇸 Español
- Kliknięcie → zapis do store + nawigacja do /select-level

**5. LevelSelect (30min):**
- Nagłówek z wybranym językiem
- Dwie karty z opisami: Principiante / Intermedio
- Kliknięcie → zapis do store + nawigacja do /scenarios

#### Razem na koniec dnia (30min):
- Podłączenie store do ekranów (LanguageSelect zapisuje, LevelSelect czyta)
- Przetestowanie flow: Splash → Menu → Język → Poziom → (placeholder scenariuszy)
- Animacje przejść (PageTransition z AnimatePresence)

#### ✅ Deliverable dnia 2:
- Ładne menu główne z designem PalabraBox
- Wybór języka i poziomu z zapisem w store
- Splash screen z animacją
- Bazowe komponenty UI (Button, Card)
- TTS działa (test)
- Services gotowe (speech, audio, progress)

---

### DZIEŃ 3 — Ekran scenariuszy i silnik gry

#### Cel: Gracz wybiera scenariusz, wchodzi do ekranu gry z działającym silnikiem (pasek postępu, serca, punkty). Na razie pytania to placeholder.

#### Jakub Laskowski — Silnik gry (4-5h)

**1. Hook useScenarios (1h):**
- Pobieranie scenariuszy z Supabase (filtrowane po language + level ze store)
- Loading state, error state
- Cache (useState — raz pobrane, nie pobieraj ponownie)

**2. Hook useGame (3h):**
```ts
function useGame(scenarioId: string) {
  // 1. Pobierz pytania z Supabase
  // 2. Przetasuj kolejność (shuffleArray)
  // 3. Dla każdego pytania przetasuj odpowiedzi
  // 4. Zwróć:
  return {
    currentQuestion,    // aktualne pytanie
    questionNumber,     // np. 3
    totalQuestions,     // np. 10
    score,              // np. 30
    lives,              // np. 2
    status,             // 'loading' | 'playing' | 'game_over' | 'completed'
    progress,           // 0-100 (procent)
    handleAnswer,       // (isCorrect: boolean) => void
    handleNext,         // () => void — następne pytanie
  }
}
```
- Podłączenie do Zustand store
- Obsługa game over (lives <= 0)
- Obsługa completed (wszystkie pytania odpowiedziane)

**3. Logika odblokowywania scenariuszy (30min):**
- Funkcja `isScenarioUnlocked(scenarioId, allScenarios, progress)`
- Pierwszy scenariusz (sort_order = 1): zawsze odblokowany
- Kolejne: sprawdzenie czy poprzedni ma ≥ 1 gwiazdkę w progressService

#### Kolega — UI ekranów gry (4-5h)

**1. ScenarioSelect (2h):**
- Pobieranie scenariuszy z hooka useScenarios
- Grid 2 kolumny
- 3 stany kafelków:
  - Ukończony: 📦✨ + gwiazdki + wynik
  - Dostępny: 📦 + "Jugar ▶"
  - Zablokowany: 📦🔒 + "Bloqueado" + szary
- Mini panel postępu na górze: "Completado: 1/3 · ⭐ 2" + pasek
- Loading state (skeleton)
- Podłączenie do progressService

**2. GameScreen — layout (2h):**
- GameHeader:
  - Hearts (serca — ❤️ aktywne, 🩶 stracone)
  - Nazwa scenariusza (środek)
  - Numer pytania "3/10" + Wynik "30" (prawy)
- ProgressBar pod headerem (gradient pb-emerald → pb-amber)
- Obszar na pytanie (na razie: tekst placeholder)
- Obsługa stanów: loading → playing → game_over / completed
- Modal Game Over: "¡Se acabó el juego!" + przyciski

**3. Komponent Hearts (30min):**
- Przyjmuje `lives: number` i `maxLives: number`
- Renderuje ❤️ i 🩶
- Animacja straty serca (serce się zmniejsza i zmienia kolor)

**4. Komponent ProgressBar (30min):**
- Przyjmuje `progress: number` (0-100)
- Gradient fill
- `transition-all duration-500` dla płynnego wypełniania

#### Razem na koniec dnia (30min):
- Podłączenie useGame do GameScreen
- Test flow: Scenariusze → kliknij → GameScreen z headerem + paskiem
- Placeholder przycisk "Respuesta correcta" / "Respuesta incorrecta" → zmiana punktów i żyć
- Test Game Over (kliknij 3x "incorrecta")

#### ✅ Deliverable dnia 3:
- Ekran scenariuszy z gwiazdkami i kłódkami
- GameScreen z działającym silnikiem (serca, pasek, punkty)
- Game Over modal
- Logika odblokowywania scenariuszy

---

### DZIEŃ 4 — Multiple Choice i Image Match

#### Cel: Pierwsze prawdziwe pytania działają. Gracz odpowiada, dostaje feedback, gra liczy punkty i życia.

#### Jakub Laskowski — Multiple Choice (4-5h)

**1. QuestionRenderer (30min):**
```tsx
// Komponent który na podstawie question.type renderuje odpowiedni komponent
function QuestionRenderer({ question, onAnswer, language }: Props) {
  switch (question.type) {
    case 'multiple_choice': return <MultipleChoice ... />
    case 'image_match':     return <ImageMatch ... />
    case 'listening':       return <Listening ... />
    case 'fill_blank':      return <FillBlank ... />
    case 'word_order':      return <WordOrder ... />
  }
}
```

**2. MultipleChoice.tsx (3h):**
- Treść pytania na górze
- 4 kafelki odpowiedzi (shadow-box style)
- Logika:
  1. Shuffle odpowiedzi
  2. Kliknięcie → ustawienie selectedAnswer + disabled
  3. Podświetlenie: poprawna=zielona, błędna=czerwona + poprawna=zielona
  4. Dźwięk correct/wrong
  5. Timer 1.2-1.5s → onAnswer(isCorrect)
- Animacja: bounce (correct) / shake (wrong)

**3. Podłączenie do GameScreen (1h):**
- GameScreen renderuje QuestionRenderer z aktualnym pytaniem
- onAnswer → handleAnswer z useGame
- Po odpowiedzi: auto przejście do następnego pytania (handleNext po delay)
- Po ostatnim pytaniu → ResultsScreen

**4. Dodanie testowych danych (30min):**
- 10 pytań multiple_choice do scenariusza "Colors" w Supabase
- Sprawdzenie że ładują się poprawnie

#### Kolega — Image Match + AnswerCard (4-5h)

**1. AnswerCard.tsx — reużywalny kafelek odpowiedzi (1.5h):**
```tsx
interface AnswerCardProps {
  text: string
  state: 'default' | 'selected_correct' | 'selected_wrong' | 'revealed_correct' | 'disabled'
  onClick: () => void
}
```
- Style dla każdego stanu:
  - default: biały, shadow-box, hover effect
  - selected_correct: zielone tło, biały tekst, ikona ✅
  - selected_wrong: czerwone tło, biały tekst, ikona ❌
  - revealed_correct: zielone tło (pokaż poprawną gdy gracz wybrał błędną)
  - disabled: opacity-50, pointer-events-none
- Animacje Framer Motion

**2. ImageMatch.tsx (2h):**
- Duży emoji na górze (question.image_emoji → np. `<span className="text-7xl">🐱</span>`)
- Pod spodem: "¿Qué es esto?" / "What is this?"
- 4 kafelki AnswerCard
- Ta sama logika co MultipleChoice (może nawet współdzielić kod)

**3. AnswerFeedback.tsx (1h):**
- Overlay który pojawia się po odpowiedzi
- Poprawna: krótki ✅ z tekstem "¡Correcto!" (zielony)
- Błędna: krótki ❌ z tekstem "Incorrecto" + "La respuesta era: X" (czerwony)
- Auto-hide po 1.2-1.5s

**4. SpeakButton.tsx (30min):**
- Mały przycisk 🔊
- Kliknięcie → speak(text, language)
- Pulsowanie podczas odtwarzania
- Dodanie do MultipleChoice i ImageMatch (obok poprawnej odpowiedzi po udzieleniu odpowiedzi)

#### Razem na koniec dnia (30min):
- Pełny test: Scenariusz → 10 pytań → odpowiadanie → punkty → serca
- Sprawdzenie animacji i dźwięków
- Poprawki UX na podstawie wrażeń z grania

#### ✅ Deliverable dnia 4:
- MultipleChoice działa z feedbackiem i animacjami
- ImageMatch działa
- AnswerCard reużywalny
- Dźwięki correct/wrong
- SpeakButton z TTS

---

### DZIEŃ 5 — Listening, Fill-in-the-Blank, Word Order

#### Cel: Wszystkie 5 typów pytań zaimplementowane. Word Order z drag & drop (lub fallback klikanie).

#### Jakub Laskowski — Listening + Fill Blank (4-5h)

**1. Listening.tsx (2.5h):**
- Duży przycisk "🔊 Escuchar"
- Kliknięcie → `speak(question.question_text_tts, language)`
- Animacja pulsowania podczas odtwarzania
- Tekst pod przyciskiem: "¿Qué significa esta palabra/frase?"
- 4 kafelki AnswerCard z tłumaczeniami
- Możliwość wielokrotnego odsłuchania
- Test: pytania listening w Supabase

**2. FillBlank.tsx (2h):**
- Wyświetlanie zdania z `_______` (luką)
- Pod spodem: grid 2x2 z 4 opcjami (mniejsze kafelki)
- Po wybraniu: słowo animuje się do luki (Framer Motion: element przesuwa się z grida do pozycji luki)
- Feedback: zielone/czerwone jak w MultipleChoice
- Test: pytania fill_blank w Supabase

**3. Dodanie pytań Listening + FillBlank do Supabase (30min):**
- Minimum 3 pytania listening + 3 fill_blank do testowego scenariusza

#### Kolega — Word Order + integracja (4-5h)

**1. WordOrder.tsx z @dnd-kit (3.5h):**
- Dwa obszary:
  - Góra ("Tu frase:"): strefa budowania zdania (droppable)
  - Dół ("Palabras:"): dostępne słowa (draggable)
- Hint widoczny: tłumaczenie zdania
- Przycisk "Comprobar" (Sprawdź) → porównanie z correct_answer
- Przycisk "Reiniciar" (Resetuj) → słowa wracają na dół
- Feedback: poprawna → zielona ramka, błędna → czerwona + shake

**⚠️ FALLBACK (jeśli drag & drop za trudny po 2h):**
Zamiana na klikanie:
- Słowa na dole jako kafelki
- Kliknięcie → słowo przesuwa się na górę (dodaje się do zdania)
- Kliknięcie słowa na górze → wraca na dół
- Reszta logiki taka sama

**2. Integracja wszystkich typów pytań (1h):**
- QuestionRenderer obsługuje wszystkie 5 typów
- Mieszany scenariusz testowy: różne typy pytań w jednym scenariuszu
- Sprawdzenie przejść między typami (fade animation)

**3. Dodanie pytań word_order do Supabase (30min):**
- Minimum 3 pytania word_order

#### Razem na koniec dnia (30min):
- Test pełnego scenariusza z mieszanymi typami pytań
- Sprawdzenie edge cases: szybkie klikanie, TTS podczas przejścia pytań

#### ✅ Deliverable dnia 5:
- Wszystkie 5 typów pytań działa
- TTS w pytaniach listening
- Drag & drop (lub fallback klikanie) w word order
- Mieszane scenariusze

---

### DZIEŃ 6 — Content + Ekran wyników

#### Cel: Baza ma pełny content (12 scenariuszy, ~120 pytań). Ekran wyników działa z gwiazdkami i zapisem postępu.

#### Jakub Laskowski — Content angielski + postęp (4-5h)

**1. Content angielski — Beginner (1.5h):**

| Scenariusz | Pytania | Typy |
|-----------|---------|------|
| Colors (🎨) | 10 | 4x multiple_choice, 3x image_match, 3x listening |
| Numbers (🔢) | 10 | 4x multiple_choice, 3x listening, 3x image_match |
| Animals (🐾) | 10 | 3x multiple_choice, 4x image_match, 3x listening |

**2. Content angielski — Intermedio (1.5h):**

| Scenariusz | Pytania | Typy |
|-----------|---------|------|
| At the Café (☕) | 10 | 3x multiple_choice, 2x listening, 2x fill_blank, 3x word_order |
| At the Airport (✈️) | 10 | 3x multiple_choice, 2x listening, 3x fill_blank, 2x word_order |
| Shopping (🛍️) | 10 | 2x multiple_choice, 3x listening, 3x fill_blank, 2x word_order |

**3. Słówka do fiszek — angielski (30min):**
- Minimum 10-15 słówek per kategoria (colors, numbers, animals, cafe, airport, shopping)
- Tabela `words` w Supabase

**4. Zapis postępu w progressService (1h):**
- Po ukończeniu scenariusza: zapisz wynik, gwiazdki do localStorage
- Logika: porównaj z bestScore, zapisz lepszy
- updateStreak() po każdej ukończonej grze
- Podłączenie do ResultsScreen

#### Kolega — Content hiszpański + ResultsScreen (4-5h)

**1. Content hiszpański — Principiante (1.5h):**

| Scenariusz | Pytania | Typy |
|-----------|---------|------|
| Colores (🎨) | 10 | 4x multiple_choice, 3x image_match, 3x listening |
| Números (🔢) | 10 | 4x multiple_choice, 3x listening, 3x image_match |
| Animales (🐾) | 10 | 3x multiple_choice, 4x image_match, 3x listening |

**2. Content hiszpański — Intermedio (1.5h):**

| Scenariusz | Pytania | Typy |
|-----------|---------|------|
| En la Cafetería (☕) | 10 | 3x multiple_choice, 2x listening, 2x fill_blank, 3x word_order |
| En el Aeropuerto (✈️) | 10 | 3x multiple_choice, 2x listening, 3x fill_blank, 2x word_order |
| De Compras (🛍️) | 10 | 2x multiple_choice, 3x listening, 3x fill_blank, 2x word_order |

**3. ResultsScreen (1.5h):**
- Layout z sekcji 5.7:
  - Pudełko animacja (📦✨ lub 📦😢)
  - "¡Escenario completado!" lub "¡Se acabó el juego!"
  - Gwiazdki (Stars component)
  - Statystyki: Puntuación, Correctas, Vidas
  - Przyciski: Repetir / Siguiente / Escenarios
- "Siguiente" widoczny tylko gdy odblokowano następny scenariusz
- Confetti przy ≥70% (canvas-confetti)
- Zapis postępu przy wyświetleniu ekranu

#### Razem na koniec dnia (30min):
- Przejście pełnego scenariusza → ekran wyników → zapis
- Sprawdzenie: wynik zapisuje się, gwiazdki pojawiają się na liście scenariuszy
- Sprawdzenie: odblokowywanie następnego scenariusza działa

#### ✅ Deliverable dnia 6:
- 12 scenariuszy, ~120 pytań w Supabase
- ~60-90 słówek do fiszek
- Ekran wyników z gwiazdkami i confetti
- Zapis postępu w localStorage
- Odblokowywanie scenariuszy działa

---

### DZIEŃ 7 — Fiszki (Tarjetas) + Audio

#### Cel: Tryb fiszek działa. Dźwięki są podłączone.

#### Jakub Laskowski — Audio (3-4h)

**1. Pobranie dźwięków (30min):**
- Wejście na [mixkit.co/free-sound-effects/](https://mixkit.co/free-sound-effects/)
- Pobranie 5 plików (max po 2-3 sekundy):
  - correct, wrong, click, level-complete, game-over
- Konwersja do MP3 (jeśli potrzebne)
- Wrzucenie do `public/sounds/`

**2. AudioService — podłączenie (1.5h):**
- Inicjalizacja Howler.js z prawdziwymi plikami
- Podłączenie do gameStore: poprawna odpowiedź → playCorrect(), błędna → playWrong()
- Podłączenie do przycisków: playClick()
- Podłączenie do ResultsScreen: playLevelComplete() lub playGameOver()
- Podłączenie do ustawień: głośność z settingsStore

**3. TTS — podłączenie do ustawień (1h):**
- speechService czyta szybkość i głośność z settingsStore
- Test: zmiana ustawień → zmiana TTS

**4. Hook useWords (30min):**
- Pobieranie słówek z Supabase filtrowane po language + level + category
- Zwracanie: words, loading, error

#### Kolega — Fiszki (3-4h)

**1. FlashCard.tsx (2h):**
- Karta z animacją flip (Framer Motion rotateY)
- Przód:
  - Słowo w języku obcym (duży font)
  - SpeakButton 🔊
  - Tekst: "Toca para girar" (kliknij żeby odwrócić)
- Tył:
  - Tłumaczenie
  - Emoji (jeśli dostępne)
  - SpeakButton 🔊 (tłumaczenie)
  - Tekst: "Toca para girar"
- Styl pudełkowy (shadow-box)

**2. CardDeck.tsx (1.5h):**
- Pobieranie słówek przez useWords
- Nawigacja ← → (przyciski lub klawiatura)
- Licznik "3 / 15"
- Przycisk "Volver al menú" (Wróć do menu)
- Animacja przejścia między kartami (slide)

**3. Flow fiszek — strony (30min):**
- CardsLanguageSelect, CardsLevelSelect, CardsScenarioSelect
- Mogą reużywać komponenty z flow gry (LanguageSelect, LevelSelect)
- Różnica: nawigują do `/cards/:scenarioId` zamiast `/game/:scenarioId`

#### Razem na koniec dnia (30min):
- Test fiszek: wybrać scenariusz → przeglądać karty → flip → TTS
- Test dźwięków: gra ze wszystkimi dźwiękami
- Sprawdzenie głośności ustawień

#### ✅ Deliverable dnia 7:
- Tryb fiszek działa (flip, nawigacja, TTS)
- Dźwięki podłączone w całej grze
- Ustawienia TTS działają

---

### DZIEŃ 8 — Ustawienia, postęp w menu, responsywność

#### Cel: Ekran ustawień działa. Menu główne pokazuje postęp. Gra wygląda dobrze na telefonie.

#### Jakub Laskowski — Ustawienia + postęp w menu (4h)

**1. SettingsScreen (2h):**
- Sekcja "Idioma de la app":
  - 🇪🇸 Español (aktywne, ✅)
  - 🇵🇱 Polski (wyszarzone, "Próximamente")
- Sekcja "Sonido":
  - Slider głośność efektów (0-100%)
  - Podłączony do settingsStore → audioService
- Sekcja "Pronunciación":
  - Slider głośność TTS (0-100%)
  - Slider szybkość TTS (Lento / Normal / Rápido)
  - Podłączony do settingsStore → speechService
- Sekcja "Información":
  - PalabraBox v1.0
  - Autorzy (Jakub Laskowski & Błażej Goliszek)
  - Prácticas en Arrabal, Málaga 2025
- Komponent Slider.tsx (reużywalny)

**2. Postęp w MainMenu (1.5h):**
- Panel "Progreso rápido":
  - "Completado: X/12 escenarios"
  - "Puntos totales: XXX"
  - "Racha: 🔥 X días" (lub "¡Empieza tu racha!" jeśli 0)
- Dane z progressService
- Ładny styl: karta z pb-green/10 tłem, ikony

**3. Postęp w ScenarioSelect (30min):**
- Pasek "Completado: 2/3 · ⭐ 5" na górze
- Gwiazdki i wynik przy każdym ukończonym scenariuszu
- Sprawdzenie że odblokowywanie działa poprawnie

#### Kolega — Responsywność + polish (4h)

**1. Testy responsywności KAŻDEGO ekranu (3h):**

Chrome DevTools → Ctrl+Shift+M → przetestować na:
- iPhone SE (375px)
- iPhone 14 (390px)
- Samsung Galaxy (360px)
- iPad (768px)
- Desktop (1440px)

**Checklist per ekran:**
- [ ] SplashScreen — logo widoczne, tekst czytelny
- [ ] MainMenu — przyciski pełna szerokość na mobile
- [ ] LanguageSelect — karty obok siebie (lub pod sobą na < 350px)
- [ ] LevelSelect — karty nie wychodzą poza ekran
- [ ] ScenarioSelect — grid 2 kolumny, kafelki czytelne
- [ ] GameScreen — serca, wynik, pasek widoczne. Kafelki odpowiedzi pełna szerokość, min 48px wysokości
- [ ] ResultsScreen — gwiazdki czytelne, przyciski widoczne
- [ ] CardsDeck — karta nie wychodzi poza ekran, strzałki dostępne
- [ ] SettingsScreen — slidery działają dotykiem

**Poprawki:**
```tsx
// Wrapper na każdą stronę
<div className="w-full max-w-lg mx-auto px-4 py-6 min-h-screen">
  {children}
</div>

// Kafelki odpowiedzi — min rozmiar dotykowy
<button className="min-h-12 w-full ...">

// Grid scenariuszy
<div className="grid grid-cols-2 gap-3 sm:gap-4">
```

**2. PageTransition (30min):**
- Wrapper AnimatePresence na wszystkie strony
- Fade + slide (y: 20 → 0)
- Czas: 0.25s

**3. ScreenWrapper.tsx (30min):**
- Komponent opakowujący każdą stronę
- Max width, padding, min-height
- BackButton (opcjonalny)
- Tytuł (opcjonalny)

#### Razem na koniec dnia (30min):
- Sprawdzenie PWA na telefonie: otwórz → "Dodaj do ekranu głównego" → działa?
- Sprawdzenie: ustawienia zapisują się po zamknięciu i otwarciu gry
- Sprawdzenie: postęp wyświetla się poprawnie w menu i scenariuszach

#### ✅ Deliverable dnia 8:
- Ustawienia działają (głośność, TTS, informacje)
- Postęp widoczny w menu i scenariuszach
- Gra wygląda dobrze na telefonie
- PWA instalowalna

---

### DZIEŃ 9 — Testy, bugfixy, polerowanie

#### Cel: Gra działa bezbłędnie. Zero crashy, zero bugów, wszystko dopracowane.

#### Testy do przeprowadzenia (RAZEM, 4-5h):

**Test 1: Pełne przejścia (1h)**
4 kombinacje, każdą od początku do końca:
- [ ] 🇬🇧 Inglés + Principiante → scenariusz 1 → 10 pytań → wynik
- [ ] 🇬🇧 Inglés + Intermedio → scenariusz 1 → 10 pytań → wynik
- [ ] 🇪🇸 Español + Principiante → scenariusz 1 → 10 pytań → wynik
- [ ] 🇪🇸 Español + Intermedio → scenariusz 1 → 10 pytań → wynik

**Test 2: Edge cases (1h)**
- [ ] Podwójne kliknięcie w odpowiedź → nie liczy dwa razy
- [ ] Game Over → Intentar de nuevo → gra resetuje się poprawnie
- [ ] Przycisk wstecz przeglądarki → nie crashuje
- [ ] Odświeżenie strony w trakcie gry → wraca do menu (nie crash)
- [ ] TTS nie dostępne → przycisk 🔊 nie crashuje, graceful fallback
- [ ] Supabase error → error message, nie biały ekran
- [ ] Pusta baza → komunikat "No hay escenarios disponibles"

**Test 3: Fiszki (30min)**
- [ ] Przeglądanie kart → flip działa
- [ ] TTS na przodzie i tyle → czyta poprawnym językiem
- [ ] Nawigacja ← → → nie wychodzi poza zakres
- [ ] Pierwsza karta → ← nie robi nic
- [ ] Ostatnia karta → → nie robi nic (lub wraca do 1)

**Test 4: Responsywność (30min)**
- [ ] iPhone SE (375px) — wszystko widoczne
- [ ] iPad (768px) — layout sensowny
- [ ] Desktop (1440px) — wycentrowane, nie za szerokie

**Test 5: Dźwięk i TTS (30min)**
- [ ] Dźwięk correct/wrong gra
- [ ] TTS angielski działa
- [ ] TTS hiszpański działa
- [ ] Ustawienie głośności na 0 → cisza
- [ ] Zmiana szybkości TTS → faktycznie zmienia

**Test 6: Postęp (30min)**
- [ ] Ukończ scenariusz → gwiazdki się pojawiają
- [ ] Ukończ z ≥50% → następny odblokowany
- [ ] Ukończ z <50% → następny NIE odblokowany
- [ ] Zamknij przeglądarkę → otwórz → postęp zapisany
- [ ] Lepszy wynik nadpisuje gorszy
- [ ] Streak działa (symuluj zmianę daty w localStorage)

#### Bugfixy i polish (RAZEM, 2-3h):
- Poprawienie literówek w pytaniach
- Poprawienie alignmentu UI
- Poprawa animacji które się "zacinają"
- Dodanie loading states gdzie brakuje
- Sprawdzenie kontrastu kolorów (czytelność)
- Poprawienie tekstów hiszpańskich (sprawdzenie gramatyki)
- Dodanie `key` props tam gdzie React ostrzega
- Usunięcie `console.log` debugujących

#### ✅ Deliverable dnia 9:
- Zero znanych bugów
- Gra przetestowana we wszystkich kombinacjach
- Responsywność sprawdzona
- Clean code (no console.log, no warnings)

---

### DZIEŃ 10 — Deploy, dokumentacja, prezentacja

#### Cel: Gra online, dokumentacja kompletna, demo gotowe.

#### Zadania (RAZEM, 4-5h):

**1. Final build (30min):**
```bash
npm run build
```
- Zero błędów TypeScript
- Zero błędów budowania
- Sprawdzenie rozmiaru `dist/` (powinien być < 5MB)

**2. Deploy na Vercel (30min):**
```bash
vercel --prod
```
- Dodanie env variables w Vercel Dashboard:
  - `VITE_SUPABASE_URL`
  - `VITE_SUPABASE_ANON_KEY`
- Sprawdzenie pod publicznym linkiem (np. palabrabox.vercel.app)
- Test na telefonie po deployu

**3. PWA check (15min):**
- Otwarcie na Androidzie → "Dodaj do ekranu głównego" → ikona
- Otwarcie przez ikonę → pełnoekranowy tryb
- Sprawdzenie: Manifest, Service Worker w DevTools → Application

**4. README.md (1.5h):**
```markdown
# 📦 PalabraBox — Aprende idiomas jugando

Juego interactivo para aprender inglés y español.
Diseñado para niños y jóvenes de 6 a 15 años.

## 🎮 Jugar ahora
[palabrabox.vercel.app](https://palabrabox.vercel.app)

## 📱 Instalar en el móvil
Abre el enlace → "Añadir a pantalla de inicio"

## 🛠️ Tecnologías
- React + TypeScript + Vite
- Tailwind CSS
- Supabase (PostgreSQL)
- Framer Motion
- Web Speech API (TTS)
- Howler.js
- Zustand

## 📝 Cómo añadir contenido nuevo
1. Entra en [supabase.com](https://supabase.com) → tu proyecto
2. Abre Table Editor
3. Selecciona la tabla `scenarios` → Insert Row
4. Selecciona la tabla `questions` → Insert Row
5. ¡El contenido está disponible inmediatamente!

## 📝 Cómo añadir un nuevo escenario
1. Añade un registro en `scenarios` con title, language, level, emoji, category, sort_order
2. Añade 10 registros en `questions` con scenario_id del nuevo escenario
3. Añade palabras en `words` con la misma category (para tarjetas)

## 👥 Equipo
- Jakub Laskowski — game engine, Supabase, TTS, audio
- [Kolega] — UI/UX, animaciones, responsividad

## 📍 Contexto
Prácticas en Arrabal, Málaga 2025

## 📄 Licencia
MIT
```

**5. Przygotowanie demo (1h):**

Scenariusz prezentacji (5-10 minut):
1. Otwarcie gry na telefonie (PWA — z ikony na ekranie głównym)
2. Splash screen → Menu główne
3. Jugar → Inglés → Principiante
4. Scenariusze — pokazać gwiazdki i kłódki
5. Zagrać 3-4 pytania live (różne typy: quiz, obrazek, listening)
6. Pokazać ekran wyników z gwiazdkami
7. Wrócić → Tarjetas → pokazać fiszki z flipem i TTS
8. Ajustes → pokazać slidery dźwięku i TTS
9. Przełączenie na Español
10. Dashboard Supabase → pokazać jak dodawać nowe pytania (1 minuta)

**Ustalenie:**
- Kto prowadzi demo? (np. Jakub Laskowski pokazuje grę, Błażej Goliszek pokazuje Supabase)
- Laptop + telefon do demonstracji
- Upewnić się że internet działa (backup: nagranie screencast)

**6. Opcjonalnie: screencast (30min):**
- Nagranie 2-minutowego filmiku z gry
- OBS Studio (darmowy) lub wbudowany screen recorder
- Przydatne do portfolio

#### ✅ Deliverable dnia 10:
- ✅ Gra dostępna pod publicznym linkiem
- ✅ PWA instalowalna na telefonie
- ✅ README kompletne
- ✅ Demo gotowe
- ✅ Instrukcja dodawania contentu (dla Arrabal)

---

## 15. Podział ról

| Obszar | Jakub Laskowski | Błażej Goliszek |
|--------|-------|--------|
| Supabase (tabele, klient, zapytania) | ✅ | |
| Typy TypeScript | ✅ | |
| Zustand stores (game, settings) | ✅ | |
| Game engine (useGame hook) | ✅ | |
| TTS / speechService | ✅ | |
| Audio / audioService | ✅ | |
| progressService (localStorage) | ✅ | |
| MultipleChoice, Listening, FillBlank | ✅ | |
| Ustawienia (SettingsScreen) | ✅ | |
| Komponenty UI (Button, Card, Hearts...) | | ✅ |
| Ekrany menu (MainMenu, Language, Level) | | ✅ |
| ScenarioSelect | | ✅ |
| ResultsScreen | | ✅ |
| ImageMatch, WordOrder | | ✅ |
| Fiszki (FlashCard, CardDeck) | | ✅ |
| Animacje Framer Motion | | ✅ |
| Responsywność | | ✅ |
| PWA | | ✅ |
| PageTransition, ScreenWrapper | | ✅ |
| Content — angielski | ✅ | |
| Content — hiszpański | | ✅ |
| Testy | RAZEM | RAZEM |
| Deploy | RAZEM | RAZEM |
| README | RAZEM | RAZEM |
| Demo | RAZEM | RAZEM |

---

## 16. Priorytetyzacja funkcji (MVP vs Later)

### 🔴 MVP (Must-Have — musi być gotowe)

To jest absolutne minimum żeby gra działała i wyglądała dobrze na prezentacji:

| # | Funkcja | Dzień |
|---|---------|-------|
| 1 | Setup projektu (Vite, Tailwind, Supabase, Router) | 1 |
| 2 | Zustand store | 2 |
| 3 | Menu główne | 2 |
| 4 | Wybór języka | 2 |
| 5 | Wybór poziomu | 2 |
| 6 | Ekran scenariuszy (z kłódkami) | 3 |
| 7 | GameScreen (header, serca, pasek, wynik) | 3 |
| 8 | Multiple Choice (quiz) | 4 |
| 9 | Image Match (obrazek + quiz) | 4 |
| 10 | Listening (TTS + quiz) | 5 |
| 11 | Fill in the Blank | 5 |
| 12 | Content (min 6 scenariuszy, 60 pytań) | 6 |
| 13 | Ekran wyników (gwiazdki, statystyki) | 6 |
| 14 | Zapis postępu (localStorage) | 6 |
| 15 | Dźwięki (correct, wrong, click) | 7 |
| 16 | Responsywność na telefonie | 8 |
| 17 | Deploy na Vercel | 10 |
| 18 | README | 10 |

**Po ukończeniu MVP gra jest:**
- Grywalna (4 typy pytań)
- Ładna (design PalabraBox)
- Funkcjonalna (wybór języka/poziomu/scenariusza, punkty, serca, gwiazdki)
- Deployowana (link online)
- Responsywna (telefon + desktop)

### 🟡 Ważne (Should-Have — dodajemy po MVP)

| # | Funkcja | Dzień | Czas |
|---|---------|-------|------|
| 19 | Word Order (drag & drop) | 5 | 3-4h |
| 20 | Animacje odpowiedzi (bounce, shake) | 4-5 | wplecione |
| 21 | Fiszki (Tarjetas) | 7 | 3-4h |
| 22 | Ustawienia (slidery, TTS) | 8 | 2h |
| 23 | Postęp w menu + scenariuszach | 8 | 2h |
| 24 | PWA | 1+8 | 1h |
| 25 | Pełny content (12 scenariuszy, 120 pytań) | 6 | wplecione |
| 26 | Game Over modal | 3 | 30min |
| 27 | Animacje przejść między stronami | 2+8 | 1h |
| 28 | Confetti na ekranie wyników | 6 | 30min |
| 29 | SpeakButton 🔊 przy odpowiedziach | 4 | 30min |

### 🟢 Nice-to-Have (dodajemy jeśli jest czas)

| # | Funkcja | Czas | Priorytet |
|---|---------|------|-----------|
| 30 | Maskotka Boxi (SVG/CSS) | 2-3h | Niski |
| 31 | Animacja pudełka otwierającego się | 1-2h | Niski |
| 32 | Streak display (🔥 3 días) | 1h | Średni |
| 33 | Splash screen animacja | 30min | Niski |
| 34 | Ciemny motyw (dark mode) | 2h | Niski |
| 35 | Swipe na fiszkach | 1h | Średni |

---

## 17. Pomysły na przyszłość

Rzeczy do dodania PO praktykach lub jeśli zostanie czas:

### 🔐 Logowanie użytkowników (Priorytet: WYSOKI na przyszłość)
- Logowanie przez Google (Supabase Auth — darmowe)
- Postęp zapisywany w Supabase zamiast localStorage
- Gracz może kontynuować na innym urządzeniu
- **Trudność:** 3/10 — Supabase ma gotowy moduł Auth
- **Czas:** 4-6h

### 🏆 Leaderboard — tabela wyników (Priorytet: ŚREDNI)
```sql
CREATE TABLE scores (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  player_name TEXT NOT NULL,
  scenario_id UUID REFERENCES scenarios(id),
  score INTEGER NOT NULL,
  stars INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);
```
- Po ukończeniu scenariusza: modal "¿Cómo te llamas?" → zapis
- Top 10 per scenariusz
- **Trudność:** 2/10
- **Czas:** 2-3h

### 🌙 Tryb ciemny / Dark Mode (Priorytet: NISKI)
- Toggle w ustawieniach
- Tailwind `dark:` klasy
- Zapisywanie w localStorage
- **Trudność:** 2/10
- **Czas:** 2-3h

### 🌐 Wielojęzyczny interfejs / i18n (Priorytet: ŚREDNI)
- Interfejs w 3 językach: ES, PL, EN
- Plik z tłumaczeniami (JSON per język)
- Context/hook do zmiany języka
- **Trudność:** 3/10
- **Czas:** 4-6h (tłumaczenie wszystkich tekstów)

### 📖 Tryb powtórki po scenariuszu (Priorytet: ŚREDNI)
- Po wyniku: przycisk "Repasar palabras" (Powtórz słówka)
- Lista wszystkich słówek z scenariusza z TTS
- Podświetlenie słówek których gracz nie znał
- **Trudność:** 2/10
- **Czas:** 2-3h

### 🏅 System odznak / Achievements (Priorytet: NISKI)
- "Primera partida!" (Pierwsza gra)
- "10 escenarios completados!"
- "100% en un escenario!"
- "Racha de 7 días!"
- **Trudność:** 2/10
- **Czas:** 3-4h

### 📊 Zaawansowane statystyki (Priorytet: NISKI)
- Procent poprawnych odpowiedzi per typ pytania
- Najczęściej mylone słówka
- Wykres postępu w czasie
- **Trudność:** 4/10
- **Czas:** 4-6h

### 🎓 Poziom zaawansowany B1+ (Priorytet: ŚREDNI)
- Nowy poziom: "Avanzado"
- Dłuższe teksty, dialogi, gramatyka
- Nowe typy pytań: tłumaczenie zdań, uzupełnianie dialogów
- **Trudność:** 2/10 (technicznie proste — dodanie contentu)
- **Czas:** 4-8h (głównie content)

### 🔊 Nagrywanie głosu / Speech Recognition (Priorytet: NISKI)
- Gracz mówi słowo → przeglądarka sprawdza wymowę
- Web Speech API SpeechRecognition
- **Trudność:** 5/10 (API jest niestabilne w niektórych przeglądarkach)
- **Czas:** 4-6h

### 👥 Tryb wieloosobowy / Multiplayer (Priorytet: NISKI)
- Dwóch graczy na jednym urządzeniu
- Naprzemienne odpowiadanie na pytania
- Kto więcej punktów → wygrywa
- **Trudność:** 4/10
- **Czas:** 6-8h

### 📱 Natywna aplikacja mobilna (Priorytet: NISKI)
- React Native lub Capacitor
- Publikacja w Google Play / App Store
- **Trudność:** 6/10
- **Czas:** 2-3 tygodnie

### 🤖 AI-generowane pytania (Priorytet: NISKI)
- Integracja z OpenAI API
- Automatyczne generowanie nowych pytań na podstawie istniejących
- **Trudność:** 4/10
- **Czas:** 4-6h
- **Koszt:** OpenAI API jest płatne (ale ma darmowy tier)

---

### Priorytet dodawania nowych funkcji (kolejność)

Jeśli po ukończeniu MVP (dzień 8-9) zostanie czas:

1. **Fiszki (Tarjetas)** — jeśli nie zrobione w dzień 7
2. **Word Order (drag & drop)** — jeśli nie zrobione w dzień 5
3. **Pełny content** (12 scenariuszy) — jeśli mniej niż 12
4. **Ustawienia** — jeśli nie zrobione w dzień 8
5. **Maskotka Boxi** — jeśli jest czas
6. **Leaderboard** — prosty, efektowny na demo
7. **Logowanie** — najważniejsze na przyszłość

---

> **Zasada:** Lepiej mieć 6 scenariuszy z 4 typami pytań działającymi PERFEKCYJNIE, niż 12 scenariuszy z 5 typami i bugami. Jakość > ilość. Skończony projekt > ambitny niedokończony.