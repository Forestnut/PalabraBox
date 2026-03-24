# 📱 Screens Specification

## Screen List

| # | Screen | Route | Description |
| --- | --- | --- | --- |
| 1 | Splash Screen | `/` | Logo animation, auto-redirect |
| 2 | Main Menu | `/menu` | Play, Cards, Settings |
| 3 | Language Select | `/select-language` | English or Spanish |
| 4 | Level Select | `/select-level` | Principiante or Intermedio |
| 5 | Scenario Select | `/scenarios` | Grid of scenarios with locks/stars |
| 6 | Game Screen | `/game/:scenarioId` | Main gameplay (10 questions) |
| 7 | Results Screen | `/results` | Score, stars, next steps |
| 8 | Flashcard Deck | `/cards/:scenarioId` | Card viewer with flip |
| 9 | Settings | `/settings` | Sound, TTS, app info |

---

## 1. Splash Screen (`/`)

**Purpose:** Brand introduction, app loading.

```text
┌──────────────────────────────┐
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
└──────────────────────────────┘
```

**Elements:**

- Centered logo/mascot (📦 emoji as placeholder, SVG later)
- App name "PalabraBox" — large, bold
- Subtitle: "Aprende idiomas jugando" (Learn languages by playing)
- Optional: loading bar or spinner
- Background: `pb-bg` (#F0F5F1)
- Display duration: 1.5–2 seconds, then auto-navigate to `/menu`

**Entry animation:** Logo scales in from 0.9 to 1, fades from 0 to 1 (0.6s ease-out).

---

## 2. Main Menu (`/menu`)

**Purpose:** Central hub for all features.

```text
┌──────────────────────────────┐
│                     ⚙️       │
│                              │
│         ┌────────┐           │
│         │  📦    │           │
│         └────────┘           │
│       PalabraBox             │
│                              │
│   ┌────────────────────────┐ │
│   │   ▶  JUGAR             │ │  ← amber CTA
│   └────────────────────────┘ │
│                              │
│   ┌────────────────────────┐ │
│   │   🃏  TARJETAS          │ │  ← emerald
│   └────────────────────────┘ │
│                              │
│   ┌──────────────────────┐   │
│   │ 📊 Progreso rápido   │   │
│   │ Completado: 2/12     │   │
│   │ Puntos: 450          │   │
│   │ Racha: 🔥 3 días     │   │
│   └──────────────────────┘   │
│          v1.0                │
└──────────────────────────────┘
```

**Elements:**

- ⚙️ icon (top-right) → navigates to `/settings`
- Logo + "PalabraBox" header
- **JUGAR** button — primary (amber), large, full-width → `/select-language`
- **TARJETAS** button — secondary (emerald) → `/cards/select-language`
- Quick progress panel:
  - Completed scenarios: X/12
  - Total points
  - Streak: 🔥 X days (or "¡Empieza tu racha!" if 0)
- Version number (bottom center, small text)

---

## 3. Language Select (`/select-language`)

**Purpose:** Choose which language to learn.

```text
┌──────────────────────────────┐
│  ←                           │
│                              │
│   ¿Qué idioma quieres       │
│   aprender?                  │
│                              │
│   ┌──────────┐ ┌──────────┐ │
│   │   🇬🇧    │ │   🇪🇸    │ │
│   │ Inglés   │ │ Español  │ │
│   └──────────┘ └──────────┘ │
│                              │
└──────────────────────────────┘
```

**Elements:**

- Back button (←) in top-left
- Question: "¿Qué idioma quieres aprender?"
- Two large cards side by side: flag + language name
- On click: card highlights (amber border), brief 0.3s pause, navigate to `/select-level`
- Saves language to Zustand store

---

## 4. Level Select (`/select-level`)

**Purpose:** Choose difficulty level.

```text
┌──────────────────────────────┐
│  ←        🇬🇧 Inglés         │
│                              │
│   Selecciona tu nivel:       │
│                              │
│   ┌────────────────────────┐ │
│   │  ⭐ Principiante (A1)  │ │
│   │  Palabras básicas,     │ │
│   │  colores, números      │ │
│   │  Edad: 6-10 años       │ │
│   └────────────────────────┘ │
│                              │
│   ┌────────────────────────┐ │
│   │  ⭐⭐ Intermedio        │ │
│   │       (A2-B1)          │ │
│   │  Frases, diálogos,     │ │
│   │  situaciones reales    │ │
│   │  Edad: 11-15 años      │ │
│   └────────────────────────┘ │
│                              │
└──────────────────────────────┘
```

**Elements:**

- Back button + current language in header
- Two cards with level descriptions
- Principiante: amber left-border accent
- Intermedio: emerald left-border accent
- On click: saves level to store, navigates to `/scenarios`

---

## 5. Scenario Select (`/scenarios`)

**Purpose:** Choose a scenario to play.

```text
┌──────────────────────────────┐
│  ←    🇬🇧 Inglés · A1       │
│                              │
│  Completado: 1/3 · ⭐ 2     │
│  ████████░░░░░░░░░░  33%    │
│                              │
│   ┌──────────┐ ┌──────────┐ │
│   │  📦✨    │ │  📦      │ │
│   │ Colores  │ │ Números  │ │
│   │ ⭐⭐☆    │ │ Jugar ▶  │ │
│   │ 70pts    │ │          │ │
│   └──────────┘ └──────────┘ │
│                              │
│   ┌──────────┐               │
│   │  📦🔒   │               │
│   │ Animales │               │
│   │ Bloqueado│               │
│   └──────────┘               │
│                              │
└──────────────────────────────┘
```

**Elements:**

- Header: language + level + back button
- Mini progress panel: "Completado: X/Y · ⭐ Z" + percentage bar
- 2-column grid of scenario tiles

**Scenario tile states:**

- ✅ **Completed** (📦✨): Open box, stars shown, best score, can replay
- 🔓 **Available** (📦): Closed box, "Jugar ▶" button, clickable
- 🔒 **Locked** (📦🔒): Closed box with lock, "Bloqueado", grayed out, not clickable

**Unlock logic:**

- First scenario: always unlocked
- Others: require ≥1 star (≥50% score) on the previous scenario

---

## 6. Game Screen (`/game/:scenarioId`)

**Purpose:** Core gameplay — answer 10 questions.

```text
┌──────────────────────────────┐
│  ❤️❤️🩶   Colores   3/10  30│
│  ████████████░░░░░░░░  30%   │
│                              │
│   ¿Cómo se dice "rojo"      │
│   en inglés?                 │
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
└──────────────────────────────┘
```

**Layout (top to bottom):**

1. **Game Header (fixed):**
   - Left: Hearts ❤️ (active) / 🩶 (lost)
   - Center: Scenario name
   - Right: Question number (3/10) + Score (30 pts)

2. **Progress Bar:**
   - Full width, gradient `pb-emerald → pb-amber`
   - Smooth CSS transition on update

3. **Question Area (center):**
   - Question text (large, bold, centered)
   - For Listening: 🔊 "Escuchar" button
   - For Image Match: large emoji on top

4. **Answer Options (bottom):**
   - 4 full-width tiles, stacked vertically
   - Box-style with shadows, min 52px height
   - `gap-3` between tiles

**After answering:**

- Correct: green bg, ✅ icon, bounce animation, correct sound, 1.2s delay → next
- Wrong: red bg on chosen + green bg on correct, ❌ icon, shake animation, wrong sound, 1.5s delay → next, lose 1 heart
- All answers disabled during feedback
- 0 hearts → navigate to Results with game_over status

---

## 7. Results Screen (`/results`)

**Purpose:** Show score, stars, and next actions.

**Success variant (≥50%):**

```text
┌──────────────────────────────┐
│         ┌────────┐           │
│         │  📦✨  │           │
│         └────────┘           │
│   ¡Escenario completado!     │
│      ⭐  ⭐  ☆               │
│   ┌────────────────────┐     │
│   │ Puntuación: 70/100 │     │
│   │ Correctas:  7/10   │     │
│   │ Vidas: ❤️❤️🩶       │     │
│   └────────────────────┘     │
│   [ 🔄  REPETIR           ] │
│   [ ▶  SIGUIENTE          ] │
│   [ 📋  ESCENARIOS        ] │
└──────────────────────────────┘
```

**Game Over variant (0 hearts):**

```text
┌──────────────────────────────┐
│         ┌────────┐           │
│         │  📦😢  │           │
│         └────────┘           │
│     ¡Se acabó el juego!      │
│   Puntuación: 30/100         │
│   Correctas: 3/10            │
│   [ 🔄  INTENTAR DE NUEVO ] │
│   [ 📋  ESCENARIOS        ] │
└──────────────────────────────┘
```

**Elements:**

- Box animation (open + stars for success, closed + sad for game over)
- Stars: ⭐ (≥50%), ⭐⭐ (≥70%), ⭐⭐⭐ (≥90%)
- Stats card: score, correct answers, remaining lives
- Confetti animation at ≥70% score (canvas-confetti)
- Buttons:
  - REPETIR / INTENTAR DE NUEVO → replay same scenario
  - SIGUIENTE → next scenario (only shown if unlocked)
  - ESCENARIOS → back to scenario list

**On render:** save progress to localStorage (best score, stars, streak).

---

## 8. Flashcard Deck (`/cards/:scenarioId`)

**Purpose:** Study vocabulary with flipping cards.

```text
┌──────────────────────────────┐
│  ←    Colores · Inglés       │
│                              │
│   ┌────────────────────────┐ │
│   │                        │ │
│   │         house          │ │ ← FRONT: word
│   │          🔊            │ │ ← TTS button
│   │    Toca para girar     │ │
│   │                        │ │
│   └────────────────────────┘ │
│                              │
│       ←  3 / 15  →          │ ← navigation
│                              │
│   [ ↩️  VOLVER AL MENÚ     ] │
└──────────────────────────────┘
```

**After flip:**

```text
│   │        casa            │ │ ← BACK: translation
│   │         🏠             │ │ ← emoji (if available)
│   │          🔊            │ │ ← TTS for translation
│   │    Toca para girar     │ │
```

**Functionality:**

- Tap card → 3D flip animation (rotateY 0→180)
- Front: foreign word + 🔊 TTS button
- Back: translation + emoji + 🔊 TTS
- Navigation: ← → arrows (or swipe on mobile)
- Counter: "3 / 15"
- Data comes from `words` table filtered by scenario category

**Flashcard flow** uses the same Language/Level/Scenario selection screens as the game flow.

---

## 9. Settings (`/settings`)

**Purpose:** App preferences and information.

```text
┌──────────────────────────────┐
│  ←       Ajustes             │
│                              │
│   IDIOMA DE LA APP           │
│   🇪🇸 Español        ✅     │
│   🇵🇱 Polski      Próxim.  │
│                              │
│   SONIDO                     │
│   Efectos de sonido          │
│   ──────●──────────── 80%    │
│                              │
│   PRONUNCIACIÓN              │
│   Volumen TTS                │
│   ────────●──────────  60%   │
│   Velocidad TTS              │
│   ──●──────────────── 30%    │
│   Lento · Normal · Rápido   │
│                              │
│   INFORMACIÓN                │
│   PalabraBox v1.0            │
│   Jakub Laskowski & Błażej Goliszek    │
│   Prácticas Arrabal          │
│   Málaga 2026                │
└──────────────────────────────┘
```

**Sections:**

1. **Idioma de la app**: Spanish active (✅), Polish grayed out with "Próximamente"
2. **Efectos de sonido**: Volume slider 0–100% → controls Howler.js sounds
3. **Volumen TTS**: Slider 0–100% → controls speech volume (0% = disabled)
4. **Velocidad TTS**: 3-position slider: Lento (0.6) / Normal (0.9) / Rápido (1.2)
5. **Información**: App version, team names, internship context

All settings persist in `localStorage` under key `palabrabox-settings`.
