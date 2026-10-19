# ADR-0004 — TTS Architecture (Phase 3)

**Date:** 2026-10-19
**Status:** Accepted

## Context

PalabraBox teaches English to Spanish speakers using Web Speech API
(`SpeechSynthesis`). The previous singleton in `src/services/speechService.ts`
had three structural problems that surfaced in QA:

1. It fell back to `voices[0]` when it couldn't find a voice for the requested
   language. On Chrome, `voices[0]` is often Arabic or Korean — the learner
   would hear "water" pronounced in a random language with no error visible.
2. `isPlaying` UI state was driven by `setTimeout(length * 80)` timers rather
   than actual utterance events; the spinner could keep spinning long after
   audio finished, or stop mid-playback.
3. Voices were selected synchronously at construction time; Chromium-based
   browsers return an empty list until the first `voiceschanged` event, so
   early calls to `speak()` could pick the wrong voice or no voice.

The product direction for H2 is bilingual sentences such as _"¿Cómo se dice
'water'?"_ where the prompt is Spanish and the quoted word is English. The TTS
layer must support segmenting a single string across multiple voices.

## Decision

We replace the singleton with a small, pure-logic-first module at
`src/speak/` with four pieces:

1. **`voices.ts`** — pure `scoreVoice()`, `pickBestVoice()`, and
   `groupVoicesByLang()`. No fallback to `voices[0]`; `pickBestVoice` returns
   `null` if no voice matches the requested language by BCP-47 prefix.
   Scoring prefers Neural / Natural / Premium cloud voices, then
   Google/Microsoft/Apple, then well-known system voices, with a small bonus
   for the browser default and small penalty for local-only voices.
2. **`capabilities.ts`** — `getCapabilities()` returns a promise that resolves
   after voices are loaded (waits on `voiceschanged` with a 1s timeout to
   handle Firefox/Safari that never fire the event). Exposes `canPlay(lang)`
   and `bestVoice(lang)`; subscribes to further `voiceschanged` events to
   invalidate the cache if the OS adds voices mid-session.
3. **`segment.ts`** — accepts either a `TtsSegment[]` from the DB `data.tts`
   column (preferred) or a plain string plus default language. Merges
   adjacent same-language segments, chunks long segments on sentence
   punctuation (Chrome has a known long-text bug), and falls back to a
   Spanish-diacritic detector for plain strings without structured segments.
4. **`queue.ts`** — a singleton `SpeechQueue` that chains utterances via
   `onend` instead of bulk-calling `synth.speak()` (which silently drops
   utterances past Chromium's limit). Provides `cancel/pause/resume`, event
   subscriptions for playback state, per-utterance `volume`/`rate`/`pitch`,
   and graceful error continuation (an error on one segment does not freeze
   the queue).

The public React-facing API in `speak/index.ts` offers:

- `speak(input, options)` — fire-and-forget with events.
- `cancelSpeech()`, and `useSpeechStatus()` / `useSpeechCapabilities()` hooks.

No third-party service is used — the project is free-tier and works offline
on browsers that ship local voices. When a language is unavailable we report
that honestly rather than falling back to a wrong-language voice.

## Consequences

- **F3 integration:** `Listening`, `WordOrder`, and `FlashCard` will be
  rewritten to consume this API and drive `isPlaying` from events instead of
  timers. When English voice is unavailable, listening questions are removed
  from the pool and the settings screen shows a banner with a "Test audio"
  diagnostic button.
- **F4:** `volume.tts` and `speechSpeed` settings plug straight into the
  queue's per-utterance `volume`/`rate`.
- **F5 testing:** pure functions (`voices.ts`, `segment.ts`) are fully
  unit-tested; the async layer (`capabilities.ts`, `queue.ts`) is tested
  with a jsdom mock of `window.speechSynthesis` that allows manually firing
  `onstart`/`onend`/`onerror`.
- **No breaking content changes yet:** structured `tts` arrays in existing
  content are single-language (all `en`); the segmenter and queue already
  handle multi-segment bilingual input, so H2 content requires no code
  changes — only new JSON blocks in `scripts/content_blocks/`.
- **Old `src/services/speechService.ts`** is removed during F3 once all
  importers migrate.
