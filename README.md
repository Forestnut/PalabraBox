<div align="center">
  <img src="public/PalabraBoxHappy.png" alt="PalabraBox Logo" width="150" height="auto" />
  <h1>📦 PalabraBox</h1>
  <p><em>Learn English & Spanish by Playing!</em></p>
  <p>
    <a href="https://palabrabox.vercel.app"><strong>Play Live on Vercel »</strong></a>
  </p>
</div>

---

**PalabraBox** is an interactive web game designed for learners aged **6–15 years old**. With a beautiful, Duolingo-inspired "box/cardboard" UI, it teaches English and Spanish vocabulary through interactive minigames, flashcards, and quizzes.

## 🌟 Key Features

*   **Offline-Ready PWA:** Install PalabraBox on your phone directly from the browser! It caches words and assets so you can practice vocabulary without an internet connection.
*   **Progressive Scenarios:** 12 thematic modules across 2 difficulty levels (Beginner, Intermediate).
*   **Interactive Exercises:** 
    *   *Multiple Choice*
    *   *Image Match*
    *   *Listening* (Uses built-in Text-to-Speech)
    *   *Fill in the Blank*
    *   *Sentence Ordering* (Drag and Drop)
*   **Game Mechanics:** Earn points, 3 lives system, and collect up to 3 stars per scenario. Statistics are securely saved locally.
*   **Flashcards Mode:** A responsive 3D-flip deck to study your worst-performing words or browse by category.

---

## 📱 How to Play & Install (PWA)

PalabraBox is a **Progressive Web App (PWA)**, meaning you don't need an App Store to install it!

**On iOS (Safari):**
1. Navigate to [palabrabox.vercel.app](https://palabrabox.vercel.app).
2. Tap the **Share** button (the square with an arrow pointing up) at the bottom.
3. Scroll down and tap **"Add to Home Screen"**.
4. The game will now behave like a native iOS app, running fullscreen and completely smooth.

**On Android / Chrome (Mobile & Desktop):**
1. Navigate to the website.
2. An **"Install App"** prompt should appear automatically at the bottom, or you can find the "Add to Home screen" option in the browser menu (three dots).
3. Confirm installation. The app will be available in your app drawer.

**Offline Mode:** Once loaded at least once, your scenarios and vocabulary are cached. You can open the app in airplane mode and study flashcards anywhere!

---

## 🛠 For Developers 

Want to run PalabraBox locally, modify the UI, or add new languages? Here's how:

### 1. Prerequisites
*   [Node.js](https://nodejs.org/) (v18.x or newer)
*   A [Supabase](https://supabase.com) account (for database syncing) or you can run mock data.

### 2. Local Setup
```bash
# Clone the repository
git clone https://github.com/your-org/palabrabox.git
cd palabrabox

# Install strict dependencies
npm install

# Create environment variables (Reach out to admins for keys)
echo "VITE_SUPABASE_URL=your_project_url" > .env.local
echo "VITE_SUPABASE_ANON_KEY=your_anon_key" >> .env.local

# Start the dev server
npm run dev
```

### 3. Build & Production
To build the optimized application locally:
```bash
npm run build
npm run preview # Test the built version locally
```

*Note: The project includes a `vercel.json` meaning push-to-main automatically deploys to Vercel perfectly routing the Single Page Application (SPA).*

### 4. Technical Architecture
*   **Core:** React 19 + TypeScript, Vite 7
*   **Styling:** Tailwind CSS 4 with custom `Box shadow` UI patterns.
*   **State:** Zustand (persisted where needed).
*   **Animations:** Framer Motion (@12).
*   **Drag & Drop:** `@dnd-kit/core` with touch-sensors for mobile safety.
*   **Backend:** Supabase (fetching scenarios via simple queries, cached locally).

---

## 📂 Documentation Hub

Check out the `docs/` folder for in-depth architecture:
- [TASKS.md](./docs/TASKS.md) - History of development & schedule
- [ARCHITECTURE.md](./docs/ARCHITECTURE.md) - Deep dive into routing & hooks
- [GAME_MECHANICS.md](./docs/GAME_MECHANICS.md) - How scoring and hearts are calculated
- [DATABASE.md](./docs/DATABASE.md) - Supabase schema and RLS policies

---

<p align="center">Made with ❤️ in Málaga, 2026</p>
