/**
 * Test mock for window.speechSynthesis + SpeechSynthesisUtterance.
 *
 * jsdom does not implement the Web Speech API, so we provide a minimal
 * implementation that lets us:
 *   - inject a voice list (or empty),
 *   - fire `voiceschanged`,
 *   - inspect utterances passed to speak(),
 *   - manually trigger onend/onerror/onstart from tests.
 */

export interface MockSpeechSynthesis {
  _voices: SpeechSynthesisVoice[]
  _listeners: Record<string, Array<() => void>>
  _utterances: SpeechSynthesisUtterance[]
  _paused: boolean
  getVoices: () => SpeechSynthesisVoice[]
  addEventListener: (type: string, fn: () => void) => void
  removeEventListener: (type: string, fn: () => void) => void
  dispatchVoicesChanged: (voices?: SpeechSynthesisVoice[]) => void
  speak: (u: SpeechSynthesisUtterance) => void
  cancel: () => void
  pause: () => void
  resume: () => void
  paused: boolean
  /** Fire onstart on the utterance at the given index (default 0). */
  _startUtterance: (index?: number) => void
  /** Fire onend on the utterance at the given index (default: last spoken). */
  _endUtterance: (index?: number) => void
  /** Fire onerror on the utterance at the given index. */
  _errorUtterance: (index: number, error: string) => void
}

export function createMockSynthesis(
  initialVoices: SpeechSynthesisVoice[] = [],
): MockSpeechSynthesis {
  const synth: MockSpeechSynthesis = {
    _voices: [...initialVoices],
    _listeners: {},
    _utterances: [],
    _paused: false,
    paused: false,

    getVoices() {
      return [...this._voices]
    },
    addEventListener(type, fn) {
      if (!this._listeners[type]) this._listeners[type] = []
      this._listeners[type].push(fn)
    },
    removeEventListener(type, fn) {
      if (!this._listeners[type]) return
      this._listeners[type] = this._listeners[type].filter((f) => f !== fn)
    },
    dispatchVoicesChanged(this: MockSpeechSynthesis, voices?) {
      if (voices) this._voices = [...voices]
      const handlers = this._listeners.voiceschanged ?? []
      for (const h of handlers) h()
    },
    speak(u) {
      this._utterances.push(u)
      this._paused = false
      this.paused = false
    },
    cancel(this: MockSpeechSynthesis) {
      // Fire 'canceled' error for any utterance that hasn't ended yet, then clear.
      for (const u of this._utterances) {
        if (typeof u.onerror === 'function') {
          const evt = new ErrorEvent('error') as unknown as SpeechSynthesisErrorEvent
          Object.defineProperty(evt, 'error', { value: 'canceled' })
          u.onerror(evt)
        }
      }
      this._utterances = []
      this._paused = false
      this.paused = false
    },
    pause() {
      this._paused = true
      this.paused = true
    },
    resume(this: MockSpeechSynthesis) {
      this._paused = false
      this.paused = false
    },

    _startUtterance(this: MockSpeechSynthesis, idx?: number) {
      const index = idx ?? this._utterances.length - 1
      const u = this._utterances[index]
      if (u && typeof u.onstart === 'function')
        u.onstart(new Event('start') as SpeechSynthesisEvent)
    },
    _endUtterance(this: MockSpeechSynthesis, idx?: number) {
      const index = idx ?? this._utterances.length - 1
      const u = this._utterances[index]
      if (u && typeof u.onend === 'function') u.onend(new Event('end') as SpeechSynthesisEvent)
    },
    _errorUtterance(this: MockSpeechSynthesis, index: number, error: string) {
      const u = this._utterances[index]
      if (u && typeof u.onerror === 'function') {
        const evt = new ErrorEvent('error') as unknown as SpeechSynthesisErrorEvent
        Object.defineProperty(evt, 'error', { value: error })
        u.onerror(evt)
      }
    },
  }
  return synth
}

export function mockVoice(
  name: string,
  lang: string,
  opts?: Partial<SpeechSynthesisVoice>,
): SpeechSynthesisVoice {
  return {
    voiceURI: name,
    name,
    lang,
    localService: opts?.localService ?? false,
    default: opts?.default ?? false,
  }
}

/**
 * Install the mock onto window.speechSynthesis and provide a
 * SpeechSynthesisUtterance constructor. Returns the mock so tests can
 * drive it.
 */
export function installSpeechSynthesisMock(
  initialVoices: SpeechSynthesisVoice[] = [],
): MockSpeechSynthesis {
  const mock = createMockSynthesis(initialVoices)
  // @ts-expect-error override
  window.speechSynthesis = mock

  class MockUtterance {
    text: string
    lang = ''
    rate = 1
    pitch = 1
    volume = 1
    voice: SpeechSynthesisVoice | null = null
    onstart: ((e: SpeechSynthesisEvent) => void) | null = null
    onend: ((e: SpeechSynthesisEvent) => void) | null = null
    onerror: ((e: SpeechSynthesisErrorEvent) => void) | null = null
    constructor(text: string) {
      this.text = text
    }
  }
  // @ts-expect-error install global
  window.SpeechSynthesisUtterance = MockUtterance

  return mock
}
