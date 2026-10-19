/**
 * Utterance queue for PalabraBox TTS.
 *
 * Why a manual queue instead of calling synth.speak() for all segments at
 * once? Because Chromium has a ~15-utterance limit on the queue and silently
 * drops excess utterances; additionally, when mixing languages we need to
 * assign a different voice per segment, which requires per-utterance setup.
 *
 * We chain via `onend`: after each utterance finishes, we pull the next one
 * from our internal FIFO and hand it to the browser. This gives us precise
 * control over playback state (speaking / paused / idle) and makes it easy
 * to cancel mid-sequence.
 */

import { getCapabilities, type SpeechCapabilities } from './capabilities'
import { prepareSegments, type TtsSegment } from './segment'
import type { LangCode } from './voices'

export type SpeechStatus = 'idle' | 'speaking' | 'paused' | 'error'

export interface SpeakOptions {
  /** Language assumed for plain-string inputs (ignored when input is TtsSegment[]). */
  defaultLang?: LangCode
  /** Volume 0..1. Falls back to 1 if not given. */
  volume?: number
  /** Playback rate (0.1 - 10; the UI uses 0.5 - 1.5). */
  rate?: number
  /** Pitch (default 1). Not exposed in the UI yet. */
  pitch?: number
  onStart?: () => void
  onEnd?: () => void
  onSegmentStart?: (segment: TtsSegment, index: number) => void
  onSegmentEnd?: (segment: TtsSegment, index: number) => void
  onError?: (error: SpeechSynthesisErrorEvent) => void
}

type Listener = (status: SpeechStatus) => void

/** Stored after the first getCapabilities() resolves, so advance() (which
 *  runs synchronously inside onend) can access it without await. */
let _caps: SpeechCapabilities | null = null

class SpeechQueue {
  private queue: Array<{ segment: TtsSegment; options: Required<SpeakOptions> }> = []
  private currentIndex = -1
  private topOptions: Required<SpeakOptions> | null = null
  private status: SpeechStatus = 'idle'
  private listeners = new Set<Listener>()

  getStatus(): SpeechStatus {
    return this.status
  }

  subscribe(listener: Listener): () => void {
    this.listeners.add(listener)
    listener(this.status)
    return () => this.listeners.delete(listener)
  }

  private setStatus(s: SpeechStatus) {
    if (this.status === s) return
    this.status = s
    for (const l of this.listeners) l(s)
  }

  /**
   * Speak one or more segments. Cancels any currently-playing speech first.
   */
  async speak(input: TtsSegment[] | string, options: SpeakOptions = {}): Promise<void> {
    this.cancel()

    if (typeof window === 'undefined' || !window.speechSynthesis) {
      options.onEnd?.()
      return
    }

    const defaultLang = options.defaultLang ?? 'en'
    const segments = prepareSegments(input, defaultLang)
    if (segments.length === 0) {
      options.onEnd?.()
      return
    }

    const normalized: Required<SpeakOptions> = {
      defaultLang,
      volume: options.volume ?? 1,
      rate: options.rate ?? 1,
      pitch: options.pitch ?? 1,
      onStart: options.onStart ?? (() => {}),
      onEnd: options.onEnd ?? (() => {}),
      onSegmentStart: options.onSegmentStart ?? (() => {}),
      onSegmentEnd: options.onSegmentEnd ?? (() => {}),
      onError: options.onError ?? (() => {}),
    }

    const caps = await getCapabilities()
    _caps = caps
    if (!caps.supported) {
      this.setStatus('error')
      normalized.onEnd()
      return
    }

    this.queue = segments.map((segment) => ({ segment, options: normalized }))
    this.topOptions = normalized
    this.currentIndex = -1
    this.setStatus('speaking')
    normalized.onStart()
    this.advance()
  }

  cancel(): void {
    if (typeof window === 'undefined' || !window.speechSynthesis) return
    this.queue = []
    this.currentIndex = -1
    this.topOptions = null
    window.speechSynthesis.cancel()
    this.setStatus('idle')
  }

  pause(): void {
    if (typeof window === 'undefined' || !window.speechSynthesis) return
    if (this.status !== 'speaking') return
    window.speechSynthesis.pause()
    this.setStatus('paused')
  }

  resume(): void {
    if (typeof window === 'undefined' || !window.speechSynthesis) return
    if (this.status !== 'paused') return
    window.speechSynthesis.resume()
    this.setStatus('speaking')
  }

  private advance(): void {
    const synth = window.speechSynthesis
    if (!synth) return

    this.currentIndex += 1
    const item = this.queue[this.currentIndex]

    if (!item) {
      const onEnd = this.topOptions?.onEnd
      this.queue = []
      this.topOptions = null
      this.setStatus('idle')
      onEnd?.()
      return
    }

    const { segment, options } = item

    const utterance = new SpeechSynthesisUtterance(segment.text)
    utterance.lang = bcp47FromLang(segment.lang)
    utterance.rate = clamp(options.rate, 0.1, 10)
    utterance.pitch = clamp(options.pitch, 0, 2)
    utterance.volume = clamp(options.volume, 0, 1)

    // Voice may be null if the browser has no voice for this language;
    // in that case we let SpeechSynthesis fall back to its default
    // (it will use the system voice — not ideal, but never voices[0] of
    // a wrong language; we already warned via capabilities and F3 removes
    // listening questions when EN voice is unavailable).
    if (_caps) {
      const voice = _caps.bestVoice(segment.lang)
      if (voice) utterance.voice = voice
    }

    utterance.onstart = () => {
      options.onSegmentStart(segment, this.currentIndex)
    }
    utterance.onend = () => {
      options.onSegmentEnd(segment, this.currentIndex)
      // Workaround for Chrome bug: long texts occasionally leave the
      // synthesizer in `paused` state mid-queue.
      if (synth.paused && this.status === 'speaking') synth.resume()
      this.advance()
    }
    utterance.onerror = (e) => {
      if (e.error !== 'canceled' && e.error !== 'interrupted') {
        console.warn('[speak] TTS error:', e.error, JSON.stringify(segment))
        options.onError(e)
        this.setStatus('error')
      }
      options.onSegmentEnd(segment, this.currentIndex)
      // Continue the queue on error to avoid leaving the UI stuck.
      this.advance()
    }

    synth.speak(utterance)
  }
}

function clamp(n: number, min: number, max: number): number {
  return Math.max(min, Math.min(max, n))
}

/** Map our short language code to the most common BCP-47 tag. The voice
 *  scorer will re-select the best voice for the actual language regardless
 *  of regional variant. */
function bcp47FromLang(lang: LangCode): string {
  switch (lang) {
    case 'en':
      return 'en-US'
    case 'es':
      return 'es-ES'
    case 'pl':
      return 'pl-PL'
  }
}

/** Singleton queue instance, used across the entire app. */
export const speechQueue = new SpeechQueue()

/** Test-only helper: reset the cached capabilities reference. */
export function _resetQueueForTests(): void {
  _caps = null
  speechQueue.cancel()
}
