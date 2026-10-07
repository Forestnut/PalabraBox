<div align="center">

<img src="public/favicon.svg" alt="PalabraBox logo" width="110" height="110" />

# 📦 PalabraBox

**Free, Duolingo-style web app for Spanish speakers learning English.**

Flashcards, quizzes and mini-games with a friendly mascot — installable as a PWA, 100% free tier.

[![CI](https://github.com/Forestnut/PalabraBox/actions/workflows/ci.yml/badge.svg)](https://github.com/Forestnut/PalabraBox/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-04724D.svg)](LICENSE)

**[▶ Play live](https://palabrabox.vercel.app)**

</div>

---

## ✨ Features

- 🎮 **Progressive scenarios** — thematic modules in two levels (beginner / intermediate), unlocked by earning stars
- ❓ **5 exercise types** — multiple choice, image match (emoji), listening (TTS), fill in the blank, sentence ordering (drag & drop)
- 🃏 **Flashcards mode** — 3D-flip deck with text-to-speech on both sides, personalized towards your weakest words
- ❤️ **Game mechanics** — lives, score, stars, daily streak, XP levels
- 🦁 **Boxi the mascot** — reacts to your answers and streaks
- 📱 **Offline-ready PWA** — install from the browser, practice without a network

The UI is in Spanish by design; the learning direction is **Spanish → English** (more languages planned: see `docs/`).

## 🛠 Tech stack

| Layer       | Choice                    |
| ----------- | ------------------------- |
| Framework   | React 19 + TypeScript     |
| Build       | Vite                      |
| Styling     | Tailwind CSS 4            |
| State       | Zustand (persisted)       |
| Animation   | Motion (Framer Motion)    |
| Drag & drop | dnd-kit                   |
| Backend     | Supabase (Postgres + RLS) |
| Hosting     | Vercel (Hobby)            |

Everything runs on **free tiers only**.

## 🚀 Quick start

Prerequisites: **Node.js ≥ 22** and a free [Supabase](https://supabase.com) project.

```bash
git clone https://github.com/Forestnut/PalabraBox.git
cd PalabraBox
npm install

# Configure environment (values from Supabase Dashboard → Settings → API)
cp .env.example .env.local
#   VITE_SUPABASE_URL=https://<project-ref>.supabase.co
#   VITE_SUPABASE_ANON_KEY=sb_publishable_...

npm run dev        # → http://localhost:5173
```

### Scripts

| Command              | Description                     |
| -------------------- | ------------------------------- |
| `npm run dev`        | Dev server                      |
| `npm run build`      | Type-check + production build   |
| `npm run preview`    | Preview the production build    |
| `npm run lint`       | ESLint                          |
| `npm run typecheck`  | TypeScript project check        |
| `npm run test`       | Unit tests (Vitest, single run) |
| `npm run test:watch` | Unit tests in watch mode        |

## 🗄 Database

Schema and content live in SQL migrations under `supabase/migrations/` (applied with the Supabase CLI — see [docs/DATABASE.md](docs/DATABASE.md) for the schema, RLS policies and the content-generation workflow).

## 📂 Project structure

```
src/
  components/   # UI building blocks (questions, cards, layout, ui)
  pages/        # route-level screens
  hooks/        # data-fetching & app logic (useGame, useScenarios, useWords…)
  store/        # Zustand stores (game, progress, settings)
  services/     # integrations (Supabase, speech/TTS, audio, analytics)
  types/        # TypeScript types (generated from DB schema where possible)
supabase/
  migrations/   # versioned SQL migrations
scripts/        # tooling (content generation from content_blocks JSON)
docs/           # documentation hub (see docs/PLAN.md for current work)
designs/        # original HTML design mockups (reference only)
```

## 📖 Documentation

- [AUDIT.md](docs/AUDIT.md) — full project audit (2026-10), the starting point for the current refactor
- [PLAN.md](docs/PLAN.md) — work plan with task status
- [ARCHITECTURE.md](docs/ARCHITECTURE.md) · [DATABASE.md](docs/DATABASE.md) · [SETUP.md](docs/SETUP.md)
- [adr/](docs/adr/) — architecture decision records

## 🤝 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). PRs welcome — `main` is protected, work happens in feature branches.

## 📄 License

[MIT](LICENSE) · © 2026 Jakub Laskowski & Błażej Goliszek

---

<p align="center">Made with ❤️ during an Erasmus internship in Málaga</p>
