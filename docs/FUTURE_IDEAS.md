# 🔮 Future Ideas & Roadmap

This document lists potential features and improvements for **PalabraBox** beyond the 10-day sprint and MVP.

## Priority 1: Core Experience (Next Steps)

### 1. User Authentication (Supabase Auth)

- **Problem:** Progress is lost if the browser cache is cleared.
- **Solution:** Allow users to create accounts (email/password or Google) and sync progress to the database.

### 2. Leaderboards

- **Problem:** Players have no way to compare themselves with friends.
- **Solution:** Global and friend-only rankings for total score and longest streaks.

### 3. "Boxi" Customization

- **Goal:** Increase engagement.
- **Solution:** Use earned points to "buy" new box styles (e.g. tape colors, sticker sets, lid styles).

---

## Priority 2: Learning Depth

### 4. Spaced Repetition (SRS)

- **Goal:** Better memorization.
- **Solution:** Track which words/scenarios a user struggles with and show them more frequently.

### 5. More Question Types

- **Goal:** Variety.
- **Solution:**

  - **Drag & Drop Sentences** (Word Order) — see [GAME_MECHANICS.md](./GAME_MECHANICS.md).
  - **Speech-to-Text** (STT) — let players speak words into the microphone.

### 6. AI-Powered Questions

- **Goal:** Infinite content.
- **Solution:** Use OpenAI/Claude APIs to automatically generate new scenarios and questions based on a topic provided by the user.

---

## Priority 3: Polish & Platform

### 7. Dark Mode

- **Goal:** Accessibility and style.
- **Solution:** "Night Box" theme using deep blues and subtle neon highlights.

### 8. Native Mobile App

- **Goal:** Full offline access.
- **Solution:** Use **Capacitor** to wrap the PWA into an Android/iOS app.

### 9. Multiplayer Mode

- **Goal:** Fun and competition.
- **Solution:** 1v1 real-time "Box Duel" — who can answer 10 questions faster?

---

## Effort Estimates

| Feature       | Effort | Benefit | Priority |
| ------------- | ------ | ------- | -------- |
| User Auth     | Medium | High    | High     |
| Leaderboards  | Medium | Medium  | Medium   |
| SRS Logic     | High   | High    | Medium   |
| Dark Mode     | Low    | Low     | Low      |
| AI Generation | High   | High    | Medium   |
| Native App    | High   | High    | Low      |

---

## Notes on Implementation

- **Voice Recognition:** Use the `Web Speech API` (SpeechRecognition) for Priority 2 features. Check browser support (mostly Chrome).
- **Internationalization (i18n):** The app is ready for internal strings to be moved to `react-i18next`. Next languages: Polish (🇵🇱), German (🇩🇪).
- **Offline Support:** Enhance `service-worker.js` to cache database queries using `background-sync` or local cache-first strategy.
