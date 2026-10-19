/**
 * Public API for PalabraBox's TTS module (`src/speak/`).
 *
 * Replaces the old `src/services/speechService.ts` singleton. Design goals:
 *   - No fallback to voices[0]. When a language is unavailable we surface
 *     that honestly via getCapabilities() and the UI adapts.
 *   - Language-aware segmentation: input is either a pre-structured
 *     `TtsSegment[]` (from the DB `data.tts` column) or a plain string.
 *   - Queue-based playback across multiple segments/voices, with proper
 *     chaining, cancel/pause/resume, and event-driven state.
 *   - Settings-driven: callers pass volume/rate from settingsStore.
 */

export { getCapabilities, resetCapabilitiesForTests } from './capabilities'
export type { SpeechCapabilities } from './capabilities'
export { scoreVoice, pickBestVoice, groupVoicesByLang } from './voices'
export type { LangCode } from './voices'
export {
  segmentize,
  mergeAdjacent,
  splitLongSegments,
  prepareSegments,
  detectLang,
} from './segment'
export type { TtsSegment } from './segment'
export { speechQueue, _resetQueueForTests } from './queue'
export type { SpeechStatus, SpeakOptions } from './queue'

import { useEffect, useState, useSyncExternalStore } from 'react'
import { speechQueue, type SpeechStatus } from './queue'
import { getCapabilities, type SpeechCapabilities } from './capabilities'
import type { TtsSegment } from './segment'
import type { LangCode } from './voices'

/**
 * Convenience function: speak text or segments with the given options.
 * Equivalent to speechQueue.speak(...) — cancels any current speech first.
 */
export function speak(
  input: TtsSegment[] | string,
  options?: {
    defaultLang?: LangCode
    volume?: number
    rate?: number
    onStart?: () => void
    onEnd?: () => void
    onError?: (e: SpeechSynthesisErrorEvent) => void
  },
): Promise<void> {
  return speechQueue.speak(input, options)
}

export function cancelSpeech(): void {
  speechQueue.cancel()
}

/** React hook: subscribe to the current speech playback status. */
export function useSpeechStatus(): SpeechStatus {
  return useSyncExternalStore(
    (cb) => speechQueue.subscribe(() => cb()),
    () => speechQueue.getStatus(),
    () => 'idle' as const,
  )
}

/** React hook: loads TTS capabilities once on mount and exposes them. */
export function useSpeechCapabilities(): {
  capabilities: SpeechCapabilities | null
  loading: boolean
} {
  const [caps, setCaps] = useState<SpeechCapabilities | null>(null)
  // Start in loading state; the effect flips it to false when capabilities
  // resolve. We initialise to true so we don't need a setState call in the
  // effect body (which would trigger react-hooks/set-state-in-effect).
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    let alive = true
    void getCapabilities().then((c) => {
      if (!alive) return
      setCaps(c)
      setLoading(false)
    })
    return () => {
      alive = false
    }
  }, [])

  return { capabilities: caps, loading }
}
