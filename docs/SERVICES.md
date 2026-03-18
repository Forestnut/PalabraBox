# ⚙️ Services & Hooks

## Services

Services encapsulate business logic and external API interactions. They live in `src/services/`.

---

### speechService.ts — Text-to-Speech

Wraps the Web Speech API (SpeechSynthesis) for pronunciation features.

**Exports:**

| Function | Parameters | Returns | Description |
| --- | --- | --- | --- |
| `speak` | `text: string, language: 'en' \| 'es', rate?: number, volume?: number` | `Promise<void>` | Reads text aloud using browser TTS |
| `stopSpeaking` | — | `void` | Cancels any ongoing speech |
| `isSpeechSupported` | — | `boolean` | Checks if browser supports TTS |

**Behavior:**

- Cancels any ongoing speech before starting new one
- Uses `en-US` locale for English, `es-ES` for Spanish
- Rate and volume come from settings (settingsStore)
- Returns a Promise that resolves when speech ends
- Gracefully handles unsupported browsers (no crash)

---

### audioService.ts — Sound Effects

Wraps Howler.js for game sound effects.

**Sound library:**

| Key | File | Trigger |
| --- | --- | --- |
| `correct` | `/sounds/correct.mp3` | Correct answer |
| `wrong` | `/sounds/wrong.mp3` | Wrong answer |
| `click` | `/sounds/click.mp3` | Button/tile tap |
| `levelComplete` | `/sounds/level-complete.mp3` | Scenario completed |
| `gameOver` | `/sounds/game-over.mp3` | 0 hearts game over |

**Exports:**

| Function | Parameters | Description |
| --- | --- | --- |
| `playSound` | `name: 'correct' \| 'wrong' \| 'click' \| 'levelComplete' \| 'gameOver'` | Plays the specified sound at current settings volume |
| `setSoundVolume` | `volume: number (0-1)` | Updates volume for all sounds |

**Behavior:**

- Sounds are pre-loaded (Howl instances created at import time)
- Volume reads from settingsStore
- Volume 0 = no sound played (check before playing)

---

### progressService.ts — Progress & Persistence

Manages user progress in `localStorage`.

**Storage keys:**

- `palabrabox-progress` → `UserProgress` object
- `palabrabox-settings` → `Settings` object

**Exports:**

| Function | Parameters | Returns | Description |
| --- | --- | --- | --- |
| `getProgress` | — | `UserProgress` | Gets saved progress (or returns defaults) |
| `saveProgress` | `progress: UserProgress` | `void` | Saves progress to localStorage |
| `saveScenarioResult` | `scenarioId, language, level, score, stars` | `void` | Saves/updates scenario completion |
| `updateStreak` | — | `void` | Updates daily play streak |
| `isScenarioUnlocked` | `scenarioId, allScenarios, progress` | `boolean` | Checks if a scenario is unlocked |
| `getSettings` | — | `Settings` | Gets saved settings |
| `saveSettings` | `settings: Settings` | `void` | Saves settings to localStorage |

---

## Zustand Stores

### gameStore.ts — Game State

Central state for the active game session.

**State fields:**

| Field | Type | Default | Description |
| --- | --- | --- | --- |
| `language` | `'english' \| 'spanish'` | `'english'` | Selected learning language |
| `level` | `'beginner' \| 'intermediate'` | `'beginner'` | Selected difficulty |
| `score` | `number` | `0` | Current score (0-100) |
| `lives` | `number` | `3` | Remaining hearts |
| `currentQuestionIndex` | `number` | `0` | Current question (0-based) |
| `questions` | `Question[]` | `[]` | Loaded questions |
| `status` | `'idle' \| 'playing' \| 'game_over' \| 'completed'` | `'idle'` | Game state |
| `answers` | `{ questionId, isCorrect }[]` | `[]` | Answer history |

**Actions:**

| Action | Parameters | Effect |
| --- | --- | --- |
| `setLanguage` | `language` | Sets selected language |
| `setLevel` | `level` | Sets selected level |
| `startGame` | `questions: Question[]` | Resets game state, loads questions |
| `answerQuestion` | `isCorrect, questionId` | Updates score, lives, answers; checks game_over |
| `nextQuestion` | — | Advances to next question or sets `completed` |
| `resetGame` | — | Resets to idle state |

### settingsStore.ts — App Settings

Persisted settings with localStorage sync.

**Fields:**

| Field | Type | Default | Description |
| --- | --- | --- | --- |
| `language` | `'es'` | `'es'` | App UI language |
| `soundVolume` | `number` | `0.8` | Sound effects volume (0-1) |
| `ttsVolume` | `number` | `0.6` | TTS volume (0-1) |
| `ttsSpeed` | `number` | `0.9` | TTS speed (0.6, 0.9, 1.2) |

---

## Custom Hooks

### useGame.ts — Game Engine

Orchestrates the entire game session for a given scenario.

**Usage:** `const game = useGame(scenarioId)`

**Returns:**

| Property | Type | Description |
| --- | --- | --- |
| `currentQuestion` | `Question \| null` | Current question object |
| `questionNumber` | `number` | Human-readable (1-based) |
| `totalQuestions` | `number` | Total (usually 10) |
| `score` | `number` | Current score |
| `lives` | `number` | Remaining hearts |
| `status` | `string` | 'loading' / 'playing' / 'game_over' / 'completed' |
| `progress` | `number` | 0-100 percentage |
| `handleAnswer` | `(isCorrect: boolean) => void` | Called when player answers |
| `handleNext` | `() => void` | Advance to next question |

**Logic:**

1. Fetch questions from Supabase on mount
2. Shuffle question order + shuffle each question's answers
3. Connect to Zustand gameStore
4. Handle game_over detection (lives ≤ 0)
5. Handle completion detection (all questions answered)

### useScenarios.ts — Scenario Fetching

Fetches scenarios from Supabase filtered by language + level.

**Usage:** `const { scenarios, loading, error } = useScenarios(language, level)`

**Behavior:**

- Fetches once per language+level combination
- Returns scenarios sorted by `sort_order`
- Includes loading and error states

### useWords.ts — Flashcard Words

Fetches words from Supabase for flashcard mode.

**Usage:** `const { words, loading, error } = useWords(language, level, category)`

### useSpeech.ts — TTS with Settings

Wraps speechService with settingsStore integration.

**Usage:** `const { speak, isSpeaking } = useSpeech()`

**Behavior:**

- Reads volume/speed from settingsStore
- Tracks `isSpeaking` state for UI feedback (button pulsing)

---

## TypeScript Interfaces

All interfaces live in `src/types/index.ts`:

```ts
// Languages and levels
type Language = 'english' | 'spanish';
type Level = 'beginner' | 'intermediate';
type QuestionType = 'multiple_choice' | 'image_match' | 'listening' | 'fill_blank' | 'word_order';
type GameStatus = 'idle' | 'loading' | 'playing' | 'game_over' | 'completed';

// App state
interface UserProgress {
  completedScenarios: CompletedScenario[];
  totalScore: number;
  streak: {
    count: number;
    lastPlayedDate: string;
  };
}

interface CompletedScenario {
  scenarioId: string;
  language: Language;
  level: Level;
  bestScore: number;
  stars: number;
  completedAt: string;
}

interface Settings {
  language: 'es' | 'pl' | 'en';
  soundVolume: number;
  ttsVolume: number;
  ttsSpeed: number;
}

interface GameAnswer {
  questionId: string;
  isCorrect: boolean;
}
```

## Utility Functions

### `shuffleArray<T>(array: T[]): T[]`

Fisher-Yates shuffle. Used for randomizing answer order and question order.

### `calculateStars(score: number, totalQuestions: number): number`

Returns 0-3 stars based on percentage: <50%=0, ≥50%=1, ≥70%=2, ≥90%=3.

### `cn(...classes: (string | undefined | false)[]): string`

Merges CSS class names, filtering out falsy values. Utility for conditional classes.
