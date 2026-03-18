# ✅ Project Tasks & Priorities

This document tracks the progress of **PalabraBox** development. Tasks are organized into 3 phases: MVP, Important, and Nice-to-Have.

**Project Timeline:** 10 Days (March 17–26, 2026)
**Owners:** Jakub (J), Błażej (B) — both fullstack.

---

## 🚀 Phase 1: MVP (Minimum Viable Product)

*Goal: Working game loop (Select → Play → Results) with 2 scenarios.*

### TASK-1: Project Initialization

**Suggested owner:** J+B · **Estimate:** 1h · **Day:** 1

- [x] Clear default Vite boilerplate
- [x] Configure Tailwind CSS 4 with `pb-*` design tokens (see [DESIGN_SYSTEM.md](./DESIGN_SYSTEM.md))
- [x] Set up project folder structure as per [ARCHITECTURE.md](./ARCHITECTURE.md)
- [x] Configure `vite-plugin-pwa` for basic manifest/icons

### TASK-2: Design System Foundations

**Suggested owner:** B · **Estimate:** 3h · **Day:** 1

- [x] Create `index.css` with global variables and `@font-face` (Nunito)
- [x] Implement the "Box" shadow utilities in Tailwind
- [x] Create base UI components: `Button`, `Card`, `ScreenWrapper`
- [x] **Acceptance:** Components handle hover/focus/active states with "box lift" effect

### TASK-3: Supabase Setup & Seed

**Suggested owner:** J · **Estimate:** 2h · **Day:** 1

- [x] Create tables: `scenarios`, `questions`, `words` (see [DATABASE.md](./DATABASE.md))
- [x] Configure RLS policies (Public Read)
- [x] Seed database with initial content (2 scenarios: English Colors, Spanish Animals)
- [x] Create `src/lib/supabase.ts` client

### TASK-4: Zustand Stores

**Suggested owner:** J · **Estimate:** 2h · **Day:** 2

- [x] Implement `gameStore.ts`: status, score, lives, current question
- [x] Implement `settingsStore.ts`: volumes, speeds, language
- [x] **Acceptance:** Stores are reactive and accessible from any component

### TASK-5: Routing & Navigation

**Suggested owner:** B · **Estimate:** 2h · **Day:** 2

- [x] Set up `react-router-dom` with all routes from [ARCHITECTURE.md](./ARCHITECTURE.md)
- [x] Create empty page components for all routes
- [x] Implement `PageTransition` wrapper with Framer Motion
- [x] Implement `BackButton` component

### TASK-6: Splash Screen & Main Menu

**Suggested owner:** B · **Estimate:** 3h · **Day:** 2

- [x] Splash Screen logo animation (SVG/📦 emoji)
- [x] Main Menu layout with "JUGAR" and "TARJETAS" buttons
- [x] Quick progress panel (mocked or from storage)
- [x] **Acceptance:** Smooth transition from Splash → Menu

### TASK-7: Language & Level Selection

**Suggested owner:** B · **Estimate:** 3h · **Day:** 3

- [ ] Language selection cards (flag + name)
- [ ] Level selection cards with detailed descriptions
- [ ] Store selection in Zustand
- [ ] **Acceptance:** Selection flow saves choices and navigates to Scenarios

### TASK-8: Scenario Selection Grid

**Suggested owner:** J · **Estimate:** 4h · **Day:** 3

- [x] `useScenarios` hook to fetch data from Supabase
- [x] `ScenarioCard` component with box theme
- [x] Implement lock/unlock logic based on `localStorage` progress
- [x] **Acceptance:** Grid displays icons, stars, and handles locked state correctly

### TASK-9: Game Engine (Core Hook)

**Suggested owner:** J · **Estimate:** 5h · **Day:** 4

- [x] `useGame` hook logic: fetching questions, shuffling, timer-less flow
- [x] Scoring logic (+10 per correct)
- [x] Lives logic (-1 heart per wrong)
- [x] **Acceptance:** Correctly manages state transitions and question sequence

### TASK-10: Question Renderer - Multiple Choice

**Suggested owner:** B · **Estimate:** 4h · **Day:** 4

- [ ] `QuestionRenderer` component
- [ ] `MultipleChoice` layout with 4 answer tiles
- [ ] Feedback state (green/red) after selection
- [ ] Handlers for click sounds

### TASK-11: Results Screen

**Suggested owner:** B · **Estimate:** 4h · **Day:** 5

- [ ] Score display and calculated stars (0-3)
- [ ] Confetti animation on success (>70%)
- [ ] Success/Game Over variants
- [ ] **Acceptance:** Properly saves progress to `localStorage` on mount

### TASK-12: Progress Persistence

**Suggested owner:** J · **Estimate:** 3h · **Day:** 5

- [x] `progressService.ts` to sync Zustand ↔ localStorage
- [x] Streak calculation logic
- [x] Total points aggregator

---

## 🟡 Phase 2: Important (Content & Polish)

*Goal: Full content, all question types, sound, and settings.*

### TASK-13: Question Renderer - Image Match

**Suggested owner:** B · **Estimate:** 2h · **Day:** 6

- [ ] Image/Emoji display component
- [ ] Integration into `QuestionRenderer`

### TASK-14: Question Renderer - Listening

**Suggested owner:** J · **Estimate:** 3h · **Day:** 6

- [ ] `SpeechService` implementation (Web Speech API)
- [ ] `SpeakButton` component with pulsing animation
- [ ] TTS integration into game store

### TASK-15: Sound Effects & Service

**Suggested owner:** B · **Estimate:** 2h · **Day:** 6

- [ ] `audioService` with Howler.js
- [ ] Trigger sounds: correct, wrong, click, victory, game over
- [ ] **Acceptance:** Volume settings correctly apply to sounds

### TASK-16: Flashcard System (MVP)

**Suggested owner:** J · **Estimate:** 4h · **Day:** 7

- [ ] `useWords` hook
- [ ] `FlashCard` component with 3D flip animation
- [ ] Navigation (prev/next) and count (e.g., 5/15)

### TASK-17: Settings Screen

**Suggested owner:** B · **Estimate:** 4h · **Day:** 7

- [ ] Volume sliders (Sound & TTS)
- [ ] TTS speed selector
- [ ] App information & credits

### TASK-18: Content Expansion (12 scenarios)

**Suggested owner:** J · **Estimate:** 4h · **Day:** 8

- [ ] Finalize content for all 12 scenarios in Supabase
- [ ] Ensure balanced difficulty between Beginner/Intermediate
- [ ] Add categories for flashcards

### TASK-19: PWA Finalization

**Suggested owner:** B · **Estimate:** 2h · **Day:** 8

- [ ] Final icons, splash screen, and color theme
- [ ] Offline caching for shell and sounds

---

## 🟢 Phase 3: Nice-to-Have (Stretch Goals)

*Goal: Premium features and extra question types.*

### TASK-20: Question Renderer - Fill in the Blank

**Suggested owner:** B · **Estimate:** 3h · **Day:** 9

- [ ] Text-with-gap layout
- [ ] Interaction: click word to fill gap

### TASK-21: Question Renderer - Word Order

**Suggested owner:** J · **Estimate:** 5h · **Day:** 9

- [ ] Integration of `@dnd-kit` for sorting
- [ ] Mobile-friendly drag & drop

### TASK-22: Mascot Animations ("Boxi")

**Suggested owner:** B · **Estimate:** 4h · **Day:** 9

- [ ] CSS/SVG Mascot that reacts to answers
- [ ] Idle animations on menu

### TASK-23: Advanced Statistics

**Suggested owner:** J · **Estimate:** 3h · **Day:** 10

- [ ] Time spent learning
- [ ] Most missed words report

### TASK-24: Deployment & Final Polish

**Suggested owner:** J+B · **Estimate:** 3h · **Day:** 10

- [ ] Build and deploy to Vercel
- [ ] Final bug-hunt on mobile devices
- [ ] Updated README and project presentation
