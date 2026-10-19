import { describe, it, expect, beforeEach, afterEach, vi } from 'vitest'
import { getCapabilities, resetCapabilitiesForTests } from './capabilities'
import { installSpeechSynthesisMock, mockVoice } from './__mocks__/speechSynthesis'

describe('getCapabilities', () => {
  beforeEach(() => {
    resetCapabilitiesForTests()
    vi.restoreAllMocks()
  })

  afterEach(() => {
    // Clean up installed mock between tests.
    // @ts-expect-error delete in test
    delete window.speechSynthesis
    // @ts-expect-error delete global
    delete window.SpeechSynthesisUtterance
  })

  it('reports unsupported when speechSynthesis is not present', async () => {
    // beforeEach installed a mock — remove it for this test.
    // @ts-expect-error delete for test
    delete window.speechSynthesis
    // @ts-expect-error delete for test
    delete window.SpeechSynthesisUtterance
    const caps = await getCapabilities()
    expect(caps.supported).toBe(false)
    expect(caps.canPlay('en')).toBe(false)
    expect(caps.bestVoice('en')).toBeNull()
  })

  it('resolves immediately when voices are already present (e.g. Firefox)', async () => {
    installSpeechSynthesisMock([
      mockVoice('Google US English', 'en-US'),
      mockVoice('Google español', 'es-ES'),
    ])
    const caps = await getCapabilities()
    expect(caps.supported).toBe(true)
    expect(caps.canPlay('en')).toBe(true)
    expect(caps.canPlay('es')).toBe(true)
    expect(caps.canPlay('pl')).toBe(false)
    expect(caps.bestVoice('en')?.name).toBe('Google US English')
  })

  it('waits for voiceschanged when getVoices() initially returns empty', async () => {
    const synth = installSpeechSynthesisMock([])
    const capsPromise = getCapabilities()
    // While waiting, promise should still be pending.
    await vi.waitFor(() => {
      expect(synth._listeners.voiceschanged?.length).toBeGreaterThan(0)
    })
    // "Browser" loads voices and fires voiceschanged.
    synth.dispatchVoicesChanged([mockVoice('Google UK English', 'en-GB')])
    const caps = await capsPromise
    expect(caps.bestVoice('en')?.lang).toBe('en-GB')
  })

  it('resolves with empty voices after timeout if voiceschanged never fires', async () => {
    vi.useFakeTimers()
    installSpeechSynthesisMock([])
    const capsPromise = getCapabilities()
    vi.advanceTimersByTime(1000)
    const caps = await capsPromise
    expect(caps.supported).toBe(true)
    expect(caps.canPlay('en')).toBe(false)
    vi.useRealTimers()
  })

  it('caches the result for subsequent calls', async () => {
    installSpeechSynthesisMock([mockVoice('A', 'en-US')])
    const a = await getCapabilities()
    const b = await getCapabilities()
    expect(a).toBe(b)
  })

  it('returns empty lists for languages with no voices (no voices[0] fallback)', async () => {
    installSpeechSynthesisMock([mockVoice('Google 日本語', 'ja-JP'), mockVoice('Yuna', 'ko-KR')])
    const caps = await getCapabilities()
    expect(caps.voices.en).toEqual([])
    expect(caps.voices.es).toEqual([])
    expect(caps.voices.pl).toEqual([])
    expect(caps.bestVoice('en')).toBeNull()
  })
})
