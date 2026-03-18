# 🎮 Game Mechanics

## Overview

Each game session consists of exactly **10 questions** per scenario. The player starts with **3 lives (hearts)** and earns **10 points per correct answer** (max 100 per scenario).

## Question Types

PalabraBox has 5 question types. The first 4 are part of MVP, Word Order is a stretch goal.

### 1. Multiple Choice (Selección múltiple)

**Levels:** Principiante + Intermedio

The core question type — a text question with 4 answer options.

**Example (learning English):**

```text
Question: "¿Cómo se dice 'rojo' en inglés?"
Options:  [blue] [red ✅] [green] [yellow]
```

**Example (learning Spanish):**

```text
Question: "¿Cómo se dice 'cat' en español?"
Options:  [perro] [gato ✅] [pájaro] [pez]
```

**Logic:**

1. Shuffle answers: `[correct_answer, ...wrong_answers]` → `shuffleArray()`
2. Render 4 answer tiles (full width, stacked)
3. On click → disable all options, show feedback (green/red), play sound
4. After delay (1.2s correct, 1.5s wrong) → call `onAnswer(isCorrect)`

---

### 2. Image Match (Coincidencia de imagen)

**Levels:** Principiante only

A large emoji/image on top, 4 text options below.

**Example:**

```text
Image:    🐱 (large, text-7xl)
Question: "¿Qué animal es este?"
Options:  [dog] [cat ✅] [bird] [fish]
```

**Logic:**

Same as Multiple Choice, but with an emoji/image displayed prominently above the question. Uses `question.image_emoji` field.

---

### 3. Listening (Escucha)

**Levels:** Principiante + Intermedio

The player hears a word/phrase via TTS and selects the correct translation.

**Example (Principiante):**

```text
[🔊 Escuchar] → TTS reads: "green"
Question: "¿Qué significa esta palabra?"
Options:  [rojo] [azul] [verde ✅] [amarillo]
```

**Example (Intermedio):**

```text
[🔊 Escuchar] → TTS reads: "I would like a coffee, please"
Question: "¿Qué significa esta frase?"
Options:  [Me gustaría un café, por favor ✅] [Quiero un té] ...
```

**Logic:**

1. Big 🔊 "Escuchar" button at top
2. Click → `speak(question.question_text_tts, language)` via Web Speech API
3. Button pulses during playback, text changes to "Reproduciendo..."
4. Player can click multiple times to re-listen
5. 4 answer options below (same as Multiple Choice)

---

### 4. Fill in the Blank (Completar la frase)

**Levels:** Intermedio only

A sentence with a gap, player selects the missing word.

**Example:**

```text
Sentence: "I ___ to school every day."
Options:  [go ✅] [eat] [sleep] [run]
```

**Display:**

- Sentence with `_______` placeholder (styled differently)
- 2×2 grid of word options (smaller tiles)
- On correct selection: word "jumps" into the gap (animation)

---

### 5. Word Order (Ordenar palabras) — Stretch Goal

**Levels:** Intermedio only

Words in random order, player arranges them into a correct sentence.

**Example:**

```text
Hint:    "Me gusta comer pizza" (translation/hint)
Words:   [pizza] [like] [eating] [I]
Answer:  [I] [like] [eating] [pizza]
```

**Display:**

- Top zone: "Tu frase" — where the sentence is built
- Bottom zone: "Palabras" — available words
- "Comprobar" button → check answer
- "Reiniciar" button → reset words

**Implementation:**

Use `@dnd-kit` for drag & drop. **Fallback:** click-to-place (click word on bottom → moves to top, click on top → moves back).

---

## Scoring System

| Action | Points |
| --- | --- |
| Correct answer | +10 |
| Wrong answer | 0 (lose 1 heart) |
| Max per scenario (10 questions) | 100 |

## Lives System (Vidas)

- Start each scenario with **3 hearts** ❤️❤️❤️
- Wrong answer → **-1 heart**
- 0 hearts → **Game Over** (immediate end, navigate to Results)
- **No way to recover hearts** during a scenario

## Stars System (Estrellas)

Stars are awarded based on percentage of correct answers:

| Score | Stars | Unlocks next? |
| --- | --- | --- |
| < 50% (0–4/10) | ☆☆☆ (0) | ❌ No |
| ≥ 50% (5–6/10) | ⭐☆☆ (1) | ✅ Yes |
| ≥ 70% (7–8/10) | ⭐⭐☆ (2) | ✅ Yes |
| ≥ 90% (9–10/10) | ⭐⭐⭐ (3) | ✅ Yes |

If the player gets Game Over (0 hearts before finishing), score is calculated from answers given before game over.

## Scenario Unlocking

- **First scenario** in each language+level: always unlocked
- **Subsequent scenarios**: require ≥1 star (≥50%) on the previous scenario
- Scenarios are ordered by `sort_order` in the database

---

## Progress Tracking

All progress is stored in `localStorage`:

```ts
interface UserProgress {
  completedScenarios: {
    scenarioId: string
    language: 'english' | 'spanish'
    level: 'beginner' | 'intermediate'
    bestScore: number      // 0-100
    stars: number          // 0-3
    completedAt: string    // ISO date
  }[]
  totalScore: number       // sum of all best scores
  streak: {
    count: number          // consecutive days
    lastPlayedDate: string // "2026-03-17"
  }
}
```

**Streak logic:**

- Same day: no change
- Consecutive day (yesterday played): count += 1
- Gap (yesterday NOT played): reset to 1

**Best score:** if player replays a scenario and scores higher, save the new best.

---

## Flashcard System (Tarjetas)

Flashcards use data from the `words` table, filtered by language + level + category.

**Each card shows:**

- **Front:** word in the foreign language + 🔊 TTS button
- **Back:** translation + emoji (if available) + 🔊 TTS

**Navigation:**

- ← → arrows (+ keyboard support)
- Counter: "3 / 15"

| Feature | Priority |
| --- | --- |
| Browsing cards (← →) | 🔴 MVP |
| Flip animation | 🔴 MVP |
| TTS on front | 🔴 MVP |
| TTS on back | 🟡 Important |
| Counter | 🔴 MVP |
| Emoji on back | 🟢 Nice-to-have |
| Swipe gesture | 🟢 Nice-to-have |

---

## Sound Effects

5 sound files needed (short, 1–3 seconds each):

| Sound | File | When played |
| --- | --- | --- |
| Correct | `correct.mp3` | Correct answer selected |
| Wrong | `wrong.mp3` | Wrong answer selected |
| Click | `click.mp3` | Button/tile tapped |
| Level Complete | `level-complete.mp3` | Scenario finished successfully |
| Game Over | `game-over.mp3` | 0 hearts remaining |

Source: free sounds from [mixkit.co](https://mixkit.co/free-sound-effects/) or similar.

Volume controlled by settings slider (0–100%), persisted in localStorage.

---

## Text-to-Speech (TTS)

Uses the **Web Speech API** (SpeechSynthesis) — built into browsers, free, no API key.

| Where | What it reads | Language |
| --- | --- | --- |
| Listening question | Word/phrase to guess | Learning language (en/es) |
| Flashcard — front | Foreign word | Learning language |
| Flashcard — back | Translation | Interface language (es) |
| SpeakButton 🔊 | Word on the answer tile | Learning language |

**Settings:**

- Volume: 0–1 (0 = disabled)
- Speed: 0.6 (Lento) / 0.9 (Normal) / 1.2 (Rápido)
