/**
 * SpeechService provides a singleton wrapper around the Web Speech API's SpeechSynthesis,
 * allowing TTS (Text-To-Speech) to be called easily from anywhere in the app.
 *
 * Voice selection strategy (quality-first):
 * 1. Google Neural / Premium quality voices (best quality, available on Chrome / Android)
 * 2. Microsoft Online / Natural voices (high quality, available on Edge)
 * 3. Any Google voice for the language
 * 4. Any native voice matching the exact language code
 * 5. Any voice matching the language prefix (e.g. 'en' from 'en-US')
 * 6. Fallback to whatever is available
 */
class SpeechService {
  private synth: SpeechSynthesis | null = null
  private defaultLang: string = 'es-ES'
  /** Cache: language code -> chosen voice */
  private voiceCache: Map<string, SpeechSynthesisVoice | null> = new Map()
  private voicesInitialized = false

  constructor() {
    if (typeof window !== 'undefined' && 'speechSynthesis' in window) {
      this.synth = window.speechSynthesis
      if (this.synth.onvoiceschanged !== undefined) {
        this.synth.onvoiceschanged = this.warmCache.bind(this)
      } else {
        this.warmCache()
      }
      // Some browsers (Firefox) trigger onvoiceschanged late – retry after 500ms
      setTimeout(() => {
        if (!this.voicesInitialized) this.warmCache()
      }, 500)
    } else {
      console.warn('[SpeechService] Web Speech API is not supported in this browser.')
    }
  }

  /** Pre-build cache for the default Spanish locale on startup */
  private warmCache() {
    if (!this.synth) return
    this.voicesInitialized = true
    // Eagerly cache the default language so first speak() is instant
    this.selectVoice(this.defaultLang)
  }

  /**
   * Selects the best available voice for a given language code.
   * Results are cached to avoid re-scanning on every utterance.
   */
  private selectVoice(lang: string): SpeechSynthesisVoice | null {
    if (this.voiceCache.has(lang)) return this.voiceCache.get(lang)!
    if (!this.synth) return null

    const voices = this.synth.getVoices()
    const prefix = lang.split('-')[0]

    const pick =
      // 1. Premium Google / Microsoft Neural voices (highest quality)
      voices.find(
        (v) =>
          v.lang === lang &&
          (v.name.includes('Google') || v.name.includes('Neural') || v.name.includes('Natural')),
      ) ||
      // 2. Any Google voice with exact lang
      voices.find((v) => v.lang === lang && v.name.includes('Google')) ||
      // 3. Any Microsoft voice with exact lang
      voices.find((v) => v.lang === lang && v.name.includes('Microsoft')) ||
      // 4. Any voice with exact lang
      voices.find((v) => v.lang === lang) ||
      // 5. Fuzzy match by prefix (e.g. 'en' matches 'en-GB', 'en-US')
      voices.find((v) => v.lang.startsWith(lang)) ||
      voices.find((v) => v.lang.startsWith(prefix)) ||
      // 6. Absolute fallback
      voices[0] ||
      null

    this.voiceCache.set(lang, pick)
    return pick
  }

  /**
   * Speak a text string using the Web Speech API.
   * @param text The text to be spoken
   * @param lang Optional language code (e.g. 'en-US', 'es-ES')
   * @param rate Speech rate (default 0.9 – slightly slower for learners)
   * @param pitch Speech pitch (default 1)
   * @param onEnd Optional callback when speech finishes
   */
  public speak(
    text: string,
    lang?: string,
    rate: number = 0.9,
    pitch: number = 1,
    onEnd?: () => void,
  ): void {
    if (!this.synth) {
      console.warn('[SpeechService] SpeechSynthesis not initialized or supported.')
      if (onEnd) onEnd()
      return
    }

    // Cancel any ongoing speech
    this.synth.cancel()

    if (!text.trim()) {
      if (onEnd) onEnd()
      return
    }

    const targetLang = lang ?? this.defaultLang
    const utterance = new SpeechSynthesisUtterance(text)
    utterance.voice = this.selectVoice(targetLang)
    utterance.lang = targetLang
    utterance.rate = rate
    utterance.pitch = pitch

    if (onEnd) {
      utterance.onend = onEnd
      utterance.onerror = onEnd // Ensure callback fires even on error
    }

    this.synth.speak(utterance)
  }

  /**
   * Stop any ongoing speech immediately.
   */
  public stop(): void {
    if (this.synth) {
      this.synth.cancel()
    }
  }
}

export const speechService = new SpeechService()
