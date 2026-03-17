# 🏗️ Architecture & Tech Stack

## Technology Stack

| Layer | Technology | Purpose |
| --- | --- | --- |
| **Framework** | React 19 + TypeScript | Component-based UI with type safety |
| **Build tool** | Vite 8 | Fast dev server, HMR, optimized builds |
| **Styling** | Tailwind CSS 4 | Utility-first CSS, custom design tokens |
| **State** | Zustand | Lightweight global state (game state, settings) |
| **Routing** | React Router v7 | Client-side navigation between screens |
| **Animations** | Framer Motion | Page transitions, answer feedback, card flip |
| **Database** | Supabase (PostgreSQL) | Scenarios, questions, words storage |
| **TTS** | Web Speech API | Built-in browser text-to-speech (free) |
| **Audio** | Howler.js | Sound effects (correct, wrong, click, etc.) |
| **Drag & Drop** | @dnd-kit | Word ordering questions (Intermedio level) |
| **Confetti** | canvas-confetti | Celebration effect on great results |
| **PWA** | vite-plugin-pwa | Installable on mobile, offline-ready shell |
| **Hosting** | Vercel | Deployment, environment variables |

## Project Structure

```text
palabrabox/
├── public/
│   ├── favicon.svg
│   ├── icon-192.png          # PWA icon
│   ├── icon-512.png          # PWA icon
│   └── sounds/
│       ├── correct.mp3
│       ├── wrong.mp3
│       ├── click.mp3
│       ├── level-complete.mp3
│       └── game-over.mp3
│
├── src/
│   ├── components/
│   │   ├── ui/               # Reusable design system components
│   │   │   ├── Button.tsx
│   │   │   ├── Card.tsx
│   │   │   ├── ProgressBar.tsx
│   │   │   ├── Hearts.tsx
│   │   │   ├── Stars.tsx
│   │   │   ├── Slider.tsx
│   │   │   └── SpeakButton.tsx
│   │   │
│   │   ├── layout/           # Page-level wrappers
│   │   │   ├── PageTransition.tsx
│   │   │   ├── BackButton.tsx
│   │   │   ├── GameHeader.tsx
│   │   │   └── ScreenWrapper.tsx
│   │   │
│   │   ├── questions/        # Question type renderers
│   │   │   ├── QuestionRenderer.tsx
│   │   │   ├── MultipleChoice.tsx
│   │   │   ├── ImageMatch.tsx
│   │   │   ├── Listening.tsx
│   │   │   ├── FillBlank.tsx
│   │   │   └── WordOrder.tsx
│   │   │
│   │   ├── cards/            # Flashcard components
│   │   │   ├── FlashCard.tsx
│   │   │   └── CardDeck.tsx
│   │   │
│   │   └── game/             # Game-specific components
│   │       ├── AnswerFeedback.tsx
│   │       ├── AnswerCard.tsx
│   │       └── ScenarioCard.tsx
│   │
│   ├── pages/                # Route-level page components
│   │   ├── SplashScreen.tsx
│   │   ├── MainMenu.tsx
│   │   ├── LanguageSelect.tsx
│   │   ├── LevelSelect.tsx
│   │   ├── ScenarioSelect.tsx
│   │   ├── GameScreen.tsx
│   │   ├── ResultsScreen.tsx
│   │   ├── CardsFlowPages.tsx  # Language/Level/Scenario selection for cards
│   │   ├── CardsDeck.tsx
│   │   └── SettingsScreen.tsx
│   │
│   ├── store/                # Zustand state stores
│   │   ├── gameStore.ts
│   │   └── settingsStore.ts
│   │
│   ├── services/             # Business logic & external APIs
│   │   ├── speechService.ts    # Web Speech API (TTS)
│   │   ├── audioService.ts     # Howler.js sound effects
│   │   └── progressService.ts  # localStorage progress tracking
│   │
│   ├── hooks/                # Custom React hooks
│   │   ├── useGame.ts          # Game engine logic
│   │   ├── useScenarios.ts     # Fetch scenarios from Supabase
│   │   ├── useWords.ts         # Fetch words for flashcards
│   │   └── useSpeech.ts        # TTS hook with settings
│   │
│   ├── lib/
│   │   └── supabase.ts       # Supabase client initialization
│   │
│   ├── types/
│   │   └── index.ts          # All TypeScript interfaces
│   │
│   ├── utils/
│   │   ├── shuffleArray.ts
│   │   ├── calculateStars.ts
│   │   └── cn.ts             # Classname merge utility
│   │
│   ├── App.tsx               # Router + AnimatePresence wrapper
│   ├── main.tsx              # React entry point
│   └── index.css             # Tailwind imports + global styles
│
├── docs/                     # Project documentation
├── designs/                  # AI-generated design inspiration
├── .env.local                # Supabase keys (not committed)
├── .gitignore
├── index.html
├── package.json
├── tailwind.config.ts
├── tsconfig.json
├── tsconfig.app.json
├── tsconfig.node.json
├── vite.config.ts
└── README.md
```

## Routing Map

| Path | Component | Description |
| --- | --- | --- |
| `/` | `SplashScreen` | Logo animation, auto-redirect to /menu |
| `/menu` | `MainMenu` | Play, Flashcards, Settings buttons |
| `/select-language` | `LanguageSelect` | English or Spanish |
| `/select-level` | `LevelSelect` | Principiante or Intermedio |
| `/scenarios` | `ScenarioSelect` | Grid of scenario tiles |
| `/game/:scenarioId` | `GameScreen` | Main gameplay (10 questions) |
| `/results` | `ResultsScreen` | Stars, score, retry/next |
| `/cards/select-language` | `CardsLanguageSelect` | Language for flashcards |
| `/cards/select-level` | `CardsLevelSelect` | Level for flashcards |
| `/cards/select-scenario` | `CardsScenarioSelect` | Scenario for flashcards |
| `/cards/:scenarioId` | `CardsDeck` | Flashcard viewer |
| `/settings` | `SettingsScreen` | Sound, TTS, app info |

## Data Flow

```text
Supabase (scenarios, questions, words)
       ↓ fetch
Custom Hooks (useScenarios, useGame, useWords)
       ↓ provide data
Zustand Store (gameStore, settingsStore)
       ↓ subscribe
React Components (Pages, Question renderers)
       ↓ events
Services (speechService, audioService, progressService)
       ↓ persist
localStorage (progress, settings)
```

## Key Architectural Decisions

1. **No user authentication for MVP** — progress stored in `localStorage`. User accounts can be added later with Supabase Auth.

2. **Content in Supabase, not hardcoded** — scenarios, questions, and words are fetched from the database, making it easy to add new content without code changes.

3. **Zustand over Context** — simpler API, better DevTools, no provider nesting.

4. **Web Speech API over paid TTS** — free, built into browsers, no API key needed. Quality is "good enough" for a learning game.

5. **PWA over native app** — one codebase, installable on mobile, no App Store submission needed.

6. **Tailwind with custom design tokens** — consistent "box" theme throughout the app with `pb-*` color classes and `shadow-box` utilities.
