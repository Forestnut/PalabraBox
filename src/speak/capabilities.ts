/**
 * Capabilities detection for Web Speech API.
 *
 * Resolves asynchronously because Chromium-based browsers populate the voice
 * list only after the `voiceschanged` event fires — calling getVoices()
 * immediately at page load often returns an empty array. Other browsers
 * (Firefox) may never fire the event and rely on getVoices() directly.
 */

import { groupVoicesByLang, pickBestVoice, type LangCode } from './voices'

export interface SpeechCapabilities {
  /** True when `window.speechSynthesis` exists. */
  supported: boolean
  /** Voices per supported language code, sorted best-first by scoreVoice. */
  voices: Record<LangCode, SpeechSynthesisVoice[]>
  /** Returns true when at least one usable voice exists for the language. */
  canPlay: (lang: LangCode) => boolean
  /** Pick the best voice for a language, or null if none available. */
  bestVoice: (lang: LangCode) => SpeechSynthesisVoice | null
}

/** Wait this long for voiceschanged before falling back to getVoices(). */
const VOICES_LOAD_TIMEOUT_MS = 1000

let cachedCapabilities: Promise<SpeechCapabilities> | null = null
let cachedResult: SpeechCapabilities | null = null
let listenerAttached = false

/**
 * Access the browser's SpeechSynthesis voices, waiting for them to load if
 * needed. Multiple calls return the same promise so the work is done once.
 */
export function getCapabilities(): Promise<SpeechCapabilities> {
  if (cachedResult) return Promise.resolve(cachedResult)
  if (cachedCapabilities) return cachedCapabilities

  cachedCapabilities = loadCapabilities().then((caps) => {
    cachedResult = caps
    return caps
  })
  return cachedCapabilities
}

/** Reset cached capabilities (intended for tests). */
export function resetCapabilitiesForTests(): void {
  cachedCapabilities = null
  cachedResult = null
}

/**
 * Subscribe to the `voiceschanged` event so that, if the browser adds or
 * removes voices after the first resolution (rare but happens when a voice
 * pack installs), we invalidate the cache and the next getCapabilities()
 * call re-reads the list.
 */
function listenForVoiceChanges(synth: SpeechSynthesis): void {
  if (listenerAttached) return
  listenerAttached = true
  const handler = () => {
    cachedResult = null
    cachedCapabilities = null
  }
  synth.addEventListener?.('voiceschanged', handler)
}

function sortVoicesBestFirst(voices: readonly SpeechSynthesisVoice[]): SpeechSynthesisVoice[] {
  return [...voices]
    .map((v) => ({ v, score: scoreVoiceForSort(v) }))
    .filter((x) => Number.isFinite(x.score))
    .sort((a, b) => b.score - a.score)
    .map((x) => x.v)
}

function scoreVoiceForSort(voice: SpeechSynthesisVoice): number {
  // Local comparator within an already-filtered language group. The full
  // `scoreVoice` function is used by pickBestVoice() for tie-breaking; this
  // gives us a reasonable "best first" ordering for capabilities.voices.
  const name = voice.name.toLowerCase()
  let score = 0
  if (/neural|natural|premium/.test(name)) score += 100
  else if (/google|microsoft|apple/.test(name)) score += 50
  if (voice.default) score += 20
  if (voice.localService) score -= 5
  return score
}

function buildCapabilities(allVoices: readonly SpeechSynthesisVoice[]): SpeechCapabilities {
  const grouped = groupVoicesByLang(allVoices)
  const sorted: Record<LangCode, SpeechSynthesisVoice[]> = {
    en: sortVoicesBestFirst(grouped.en),
    es: sortVoicesBestFirst(grouped.es),
    pl: sortVoicesBestFirst(grouped.pl),
  }
  return {
    supported: typeof window !== 'undefined' && 'speechSynthesis' in window,
    voices: sorted,
    canPlay: (lang: LangCode) => sorted[lang].length > 0,
    bestVoice: (lang: LangCode) => {
      const list = sorted[lang]
      if (list.length === 0) return null
      // groupVoicesByLang already filtered by prefix; pick the first in
      // sorted (best) order. Use pickBestVoice for consistent tie-breaking
      // with tests (uses the full scoreVoice including exact/prefix bonus).
      return pickBestVoice(allVoices, lang)
    },
  }
}

async function loadCapabilities(): Promise<SpeechCapabilities> {
  if (typeof window === 'undefined') {
    const empty = buildCapabilities([])
    return { ...empty, supported: false }
  }
  const synth = window.speechSynthesis
  if (!synth) {
    return buildCapabilities([])
  }

  listenForVoiceChanges(synth)

  const immediate = synth.getVoices()
  if (immediate.length > 0) {
    return buildCapabilities(immediate)
  }

  return new Promise<SpeechCapabilities>((resolve) => {
    let settled = false
    const finish = () => {
      if (settled) return
      settled = true
      resolve(buildCapabilities(synth.getVoices()))
    }

    const onVoicesChanged = () => {
      if (synth.getVoices().length > 0) finish()
    }

    synth.addEventListener?.('voiceschanged', onVoicesChanged)
    setTimeout(() => {
      synth.removeEventListener?.('voiceschanged', onVoicesChanged)
      finish()
    }, VOICES_LOAD_TIMEOUT_MS)
  })
}

/** Exposed for unit tests. */
export const _test = { buildCapabilities }
