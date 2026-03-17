# 📦 PalabraBox — Learn English & Spanish by Playing

**PalabraBox** is an interactive web game designed for children and young people aged **6–15 years old**. It uses a fun "box/cardboard" metaphor to teach English and Spanish through engaging scenarios and interactive question types.

> **Project Vision:** A beautiful, Duolingo-inspired language learning game that feels premium, playful, and rewarding. Every interaction feels like unwrapping a gift box full of knowledge.

## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/yourusername/palabrabox.git
cd palabrabox

# Install dependencies
npm install

# Start the dev server
npm run dev
```

The app will be available at [http://localhost:5173](http://localhost:5173).

## 🛠️ Technology Stack

- **Frontend:** React 19 + TypeScript, Vite 6, Tailwind CSS 4
- **State Management:** Zustand (game state, settings)
- **Routing:** React Router v7
- **Animations:** Framer Motion (page transitions, card flips)
- **Backend/DB:** Supabase (scenarios, questions, words bank)
- **Audio:** Web Speech API (TTS), Howler.js (Sfx)
- **PWA:** vite-plugin-pwa (mobile installable, offline-ready)

## 📚 Project Documentation

Choose a document below to explore specific project details:

- **[OVERVIEW.md](./docs/OVERVIEW.md)** — Project vision, mascot ("Boxi"), and target audience.
- **[TASKS.md](./docs/TASKS.md)** — **Work tracking:** prioritized tasks, owners, and estimates.
- **[ARCHITECTURE.md](./docs/ARCHITECTURE.md)** — Tech stack, folder structure, and data flow.
- **[DESIGN_SYSTEM.md](./docs/DESIGN_SYSTEM.md)** — Colors, typography, the "box" effect, and animations.
- **[DATABASE.md](./docs/DATABASE.md)** — Supabase schema, table definitions, and content plan.
- **[SCREENS.md](./docs/SCREENS.md)** — Detailed screen specifications with wireframes.
- **[GAME_MECHANICS.md](./docs/GAME_MECHANICS.md)** — How scoring, lives, stars, and questions work.
- **[SERVICES.md](./docs/SERVICES.md)** — Hooks, stores, and services API reference.
- **[SETUP.md](./docs/SETUP.md)** — Detailed developer setup guide from zero.
- **[FUTURE_IDEAS.md](./docs/FUTURE_IDEAS.md)** — Roadmap and features beyond the MVP.

## 🎮 Key Features

- **Progressive Learning:** 12 scenarios across 2 difficulty levels (Beginner, Intermediate).
- **Interactive Question Types:** Multiple Choice, Image Match, Listening (TTS), Fill in the Blank.
- **Game Mechanics:** 3 lives per session, points per answer, 0-3 stars per scenario.
- **Progress Tracking:** Best scores, stars, and daily streaks saved in `localStorage`.
- **Flashcard Mode:** A dedicated deck for studying vocabulary with flipping 3D cards.
- **Customizable Experience:** Adjustable sound/TTS volume and pronunciation speed.

## 🌍 Context

This project is developed by **Jakub** and **Błażej** during an internship at **Arrabal** in **Málaga, Spain** (March 2026). The entire UI is in Spanish, with English and Spanish as learning languages.

---

**Made with ❤️ in Málaga, 2026.**
