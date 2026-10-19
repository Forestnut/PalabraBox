import { describe, it, expect, beforeEach, afterEach, vi } from 'vitest'
import { speechQueue, _resetQueueForTests } from './queue'
import { resetCapabilitiesForTests } from './capabilities'
import { installSpeechSynthesisMock, mockVoice } from './__mocks__/speechSynthesis'

function flushPromises() {
  return new Promise((resolve) => setTimeout(resolve, 0))
}

describe('speechQueue', () => {
  beforeEach(() => {
    resetCapabilitiesForTests()
    _resetQueueForTests()
    installSpeechSynthesisMock([
      mockVoice('Google US English', 'en-US'),
      mockVoice('Google español', 'es-ES'),
    ])
  })

  afterEach(() => {
    _resetQueueForTests()
    resetCapabilitiesForTests()
    // @ts-expect-error cleanup
    delete window.speechSynthesis
    // @ts-expect-error cleanup
    delete window.SpeechSynthesisUtterance
  })

  it('starts in idle state', () => {
    expect(speechQueue.getStatus()).toBe('idle')
  })

  it('speaks a single plain-text segment and resolves via onend chaining', async () => {
    const onStart = vi.fn()
    const onEnd = vi.fn()
    const onSegmentStart = vi.fn()
    const onSegmentEnd = vi.fn()

    const speakPromise = speechQueue.speak('Hello world', {
      defaultLang: 'en',
      onStart,
      onEnd,
      onSegmentStart,
      onSegmentEnd,
    })

    await flushPromises()
    await flushPromises()

    expect(speechQueue.getStatus()).toBe('speaking')
    const synth = window.speechSynthesis as unknown as ReturnType<typeof installSpeechSynthesisMock>
    expect(synth._utterances.length).toBe(1)
    expect(synth._utterances[0].text).toBe('Hello world')
    expect(synth._utterances[0].lang).toBe('en-US')

    synth._startUtterance(0)
    expect(onStart).toHaveBeenCalled()
    expect(onSegmentStart).toHaveBeenCalledWith(
      expect.objectContaining({ text: 'Hello world', lang: 'en' }),
      0,
    )

    synth._endUtterance(0)
    await speakPromise
    expect(onSegmentEnd).toHaveBeenCalled()
    expect(onEnd).toHaveBeenCalled()
    expect(speechQueue.getStatus()).toBe('idle')
  })

  it('applies volume and rate from options to utterances', async () => {
    const p = speechQueue.speak('Hi', { defaultLang: 'en', volume: 0.5, rate: 0.75 })
    await flushPromises()
    await flushPromises()
    const synth = window.speechSynthesis as unknown as ReturnType<typeof installSpeechSynthesisMock>
    expect(synth._utterances[0].volume).toBe(0.5)
    expect(synth._utterances[0].rate).toBe(0.75)
    synth._endUtterance(0)
    await p
  })

  it('chains multiple segments of different languages with different voices', async () => {
    const p = speechQueue.speak([
      { text: '¿Cómo se dice', lang: 'es' },
      { text: 'water', lang: 'en' },
    ])
    await flushPromises()
    await flushPromises()
    const synth = window.speechSynthesis as unknown as ReturnType<typeof installSpeechSynthesisMock>
    // Only the first utterance is given to the browser initially.
    expect(synth._utterances.length).toBe(1)
    expect(synth._utterances[0].text).toBe('¿Cómo se dice')
    expect(synth._utterances[0].lang).toBe('es-ES')

    // End first -> chain advances, second utterance is enqueued.
    synth._endUtterance(0)
    expect(synth._utterances.length).toBe(2)
    expect(synth._utterances[1].text).toBe('water')
    expect(synth._utterances[1].lang).toBe('en-US')

    synth._endUtterance(1)
    await p
    expect(speechQueue.getStatus()).toBe('idle')
  })

  it('cancel() stops speech and clears the queue without firing onEnd', async () => {
    const onEnd = vi.fn()
    const p = speechQueue.speak('Hello world', { defaultLang: 'en', onEnd })
    await flushPromises()
    await flushPromises()
    speechQueue.cancel()
    expect(speechQueue.getStatus()).toBe('idle')
    expect(onEnd).not.toHaveBeenCalled()
    await p
  })

  it('continues the queue after a non-cancel error', async () => {
    const onError = vi.fn()
    // Two segments in DIFFERENT languages -> mergeAdjacent won't combine them.
    const p = speechQueue.speak(
      [
        { text: 'Hello', lang: 'en' },
        { text: 'Hola', lang: 'es' },
      ],
      { onError },
    )
    await flushPromises()
    await flushPromises()
    const synth = window.speechSynthesis as unknown as ReturnType<typeof installSpeechSynthesisMock>
    expect(synth._utterances.length).toBe(1)
    expect(synth._utterances[0].text).toBe('Hello')
    synth._errorUtterance(0, 'audio-busy')
    // Second segment was chained and enqueued.
    expect(synth._utterances.length).toBe(2)
    expect(synth._utterances[1].text).toBe('Hola')
    expect(onError).toHaveBeenCalled()
    synth._endUtterance(1)
    await p
    expect(speechQueue.getStatus()).toBe('idle')
  })

  it('speak() cancels any currently playing speech before enqueuing new', async () => {
    const firstEnd = vi.fn()
    const p1 = speechQueue.speak('First', { defaultLang: 'en', onEnd: firstEnd })
    await flushPromises()
    await flushPromises()
    const synth = window.speechSynthesis as unknown as ReturnType<typeof installSpeechSynthesisMock>
    expect(synth._utterances.length).toBe(1)

    const secondEnd = vi.fn()
    const p2 = speechQueue.speak('Second', { defaultLang: 'en', onEnd: secondEnd })
    await flushPromises()
    await flushPromises()
    // After internal cancel() the first utterance's onEnd did NOT fire.
    expect(firstEnd).not.toHaveBeenCalled()
    // Second speak produced a fresh utterance.
    expect(synth._utterances.length).toBe(1)
    expect(synth._utterances[0].text).toBe('Second')
    synth._endUtterance(0)
    await p2
    await p1
    expect(secondEnd).toHaveBeenCalled()
  })

  it('subscribe receives status updates', async () => {
    const listener = vi.fn()
    const unsub = speechQueue.subscribe(listener)
    expect(listener).toHaveBeenCalledWith('idle')
    const p = speechQueue.speak('Hello', { defaultLang: 'en' })
    await flushPromises()
    await flushPromises()
    expect(listener).toHaveBeenCalledWith('speaking')
    const synth = window.speechSynthesis as unknown as ReturnType<typeof installSpeechSynthesisMock>
    synth._endUtterance(0)
    await p
    expect(listener).toHaveBeenCalledWith('idle')
    unsub()
  })
})
