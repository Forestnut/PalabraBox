# 📦 PalabraBox — Project Overview

## What is PalabraBox?

**PalabraBox** (Palabra = word in Spanish, Box = box/package) is an interactive web game for learning **English and Spanish**. Designed for children and young people aged **6–15 years old**, the app uses a fun "box/cardboard" metaphor where players "open boxes" to discover new words, scenarios, and language skills.

The entire user interface is in **Spanish** (with i18n prepared for future translations).

## Vision

> A beautiful, engaging, Duolingo-inspired language learning game that feels premium, playful, and rewarding. Every interaction should feel like unwrapping a gift box full of knowledge.

## The "Box" Theme

The box/cardboard metaphor runs through the entire application:

| Element                | Box Metaphor                                     |
| ---------------------- | ------------------------------------------------ |
| **Logo**               | Stylized open box 📦 with "PB" emerging from it  |
| **Scenario tiles**     | Look like 3D cardboard boxes (with shadow depth) |
| **Locked scenario**    | Closed box with lock 🔒                          |
| **Unlocked scenario**  | Closed box ready to open                         |
| **Completed scenario** | Open box with stars ⭐ on top                    |
| **Answer cards**       | Small rounded "box" tiles                        |
| **Flashcards**         | Cards that flip like pulling a word from a box   |
| **Results screen**     | "¡Has abierto la caja del conocimiento!"         |
| **Confetti animation** | Stars/confetti flying out from an opening box    |

### Mascot — "Boxi"

A friendly, simple cardboard box character (inspired by Duolingo's owl but as a cute box):

- Round eyes, warm smile, slightly tilted lid when happy
- Built entirely with CSS/SVG — no external assets needed
- **Nice-to-have** — use 📦 emoji as placeholder first, then upgrade to SVG

## Target Audience

| Feature            | Younger (6–10 years)           | Older (11–15 years)                   |
| ------------------ | ------------------------------ | ------------------------------------- |
| **Level**          | Principiante (A1)              | Intermedio (A2–B1)                    |
| **Question types** | Images, quiz, listening        | Sentences, fill-blanks, word ordering |
| **Topics**         | Colors, animals, food, numbers | Travel, shopping, real situations     |
| **Complexity**     | Single words, simple phrases   | Full sentences, short dialogues       |
| **UI**             | Bigger buttons, more emoji     | Smaller elements, more text           |

## User Flow

```text
Splash Screen (📦 logo animation)
      ↓
Main Menu (Jugar / Tarjetas / Ajustes)
      ↓
Select Language (🇬🇧 English / 🇪🇸 Spanish)
      ↓
Select Level (⭐ Principiante / ⭐⭐ Intermedio)
      ↓
Select Scenario ("Colores" / "Números" / "Animales" / ...)
      ↓
Game Screen (10 questions per scenario)
      ↓
Results Screen (Stars 1-3 / Score / Retry / Next)
```

### Alternative Flow — Flashcards (Tarjetas)

```text
Main Menu → Tarjetas → Select Language → Select Level → Select Scenario → Card Deck
```

## Team

| Person           | Role                          | Skills    |
| ---------------- | ----------------------------- | --------- |
| **Core Team**    | Game engine, Backend, Data    | Fullstack |
| **Product Team** | UI/UX, Components, Animations | Fullstack |

Both work together on: testing, deployment, README, demo preparation.

## Timeline

| Milestone                 | Date           | Days     |
| ------------------------- | -------------- | -------- |
| **Project start**         | March 17, 2026 | Day 1    |
| **MVP ready**             | March 23, 2026 | Day 7    |
| **Polish & testing**      | March 24–25    | Days 8–9 |
| **Deploy & presentation** | March 26, 2026 | Day 10   |

## Context

This project is developed during an internship at **Arrabal** in **Málaga, Spain** (March 2026).
