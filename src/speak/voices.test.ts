import { describe, it, expect } from 'vitest'
import { scoreVoice, pickBestVoice, groupVoicesByLang } from './voices'

function makeVoice(partial: Partial<SpeechSynthesisVoice>): SpeechSynthesisVoice {
  return {
    voiceURI: partial.name ?? 'v',
    name: partial.name ?? 'Voice',
    lang: partial.lang ?? 'en-US',
    localService: partial.localService ?? false,
    default: partial.default ?? false,
  }
}

describe('scoreVoice', () => {
  it('returns -Infinity for voices that do not match the requested language', () => {
    const v = makeVoice({ name: 'Google 日本語', lang: 'ja-JP' })
    expect(scoreVoice(v, 'en')).toBe(-Infinity)
    expect(scoreVoice(v, 'es')).toBe(-Infinity)
  })

  it('matches prefix language (e.g. en-GB for en)', () => {
    const v = makeVoice({ name: 'Daniel', lang: 'en-GB' })
    expect(scoreVoice(v, 'en')).toBeGreaterThan(-Infinity)
  })

  it('scores premium neural voices higher than generic remote voices', () => {
    const neural = makeVoice({ name: 'Microsoft Jenny Neural', lang: 'en-US' })
    const google = makeVoice({ name: 'Google US English', lang: 'en-US' })
    const generic = makeVoice({ name: 'Samantha', lang: 'en-US' })
    expect(scoreVoice(neural, 'en')).toBeGreaterThan(scoreVoice(google, 'en'))
    expect(scoreVoice(google, 'en')).toBeGreaterThan(scoreVoice(generic, 'en'))
  })

  it('prefers exact language match over prefix match', () => {
    const exact = makeVoice({ name: 'Mónica', lang: 'es-ES' })
    const prefix = makeVoice({ name: 'Diego', lang: 'es-MX' })
    // When requesting 'es-ES' exactly, exact gets +10 vs +5 for prefix.
    expect(scoreVoice(exact, 'es-ES')).toBeGreaterThan(scoreVoice(prefix, 'es-ES'))
  })

  it('penalises localService voices slightly when cloud alternatives exist', () => {
    const cloud = makeVoice({ name: 'Google UK English', lang: 'en-GB' })
    const local = makeVoice({ name: 'Local English', lang: 'en-GB', localService: true })
    expect(scoreVoice(cloud, 'en')).toBeGreaterThan(scoreVoice(local, 'en'))
  })

  it('gives bonus to the default voice', () => {
    const def = makeVoice({ name: 'Default English', lang: 'en-US', default: true })
    const other = makeVoice({ name: 'Other English', lang: 'en-US' })
    expect(scoreVoice(def, 'en')).toBeGreaterThan(scoreVoice(other, 'en'))
  })
})

describe('pickBestVoice', () => {
  it('returns null when no voices match the requested language (no voices[0] fallback!)', () => {
    const voices = [
      makeVoice({ name: 'Google 日本語', lang: 'ja-JP' }),
      makeVoice({ name: 'Yuna', lang: 'ko-KR' }),
    ]
    expect(pickBestVoice(voices, 'en')).toBeNull()
    expect(pickBestVoice(voices, 'es')).toBeNull()
  })

  it('returns the highest-scored voice among matches', () => {
    const voices = [
      makeVoice({ name: 'Local English', lang: 'en-US', localService: true }),
      makeVoice({ name: 'Microsoft Jenny Neural', lang: 'en-US' }),
      makeVoice({ name: 'Google US English', lang: 'en-US' }),
    ]
    const best = pickBestVoice(voices, 'en')
    expect(best?.name).toBe('Microsoft Jenny Neural')
  })

  it('picks Spanish voices when requested', () => {
    const voices = [
      makeVoice({ name: 'Google US English', lang: 'en-US' }),
      makeVoice({ name: 'Google español', lang: 'es-ES' }),
      makeVoice({ name: 'Diego', lang: 'es-MX' }),
    ]
    expect(pickBestVoice(voices, 'es')?.lang.startsWith('es')).toBe(true)
  })

  it('returns null for an empty voice list', () => {
    expect(pickBestVoice([], 'en')).toBeNull()
  })
})

describe('groupVoicesByLang', () => {
  it('buckets voices by en/es/pl and ignores other languages', () => {
    const voices = [
      makeVoice({ name: 'A', lang: 'en-US' }),
      makeVoice({ name: 'B', lang: 'en-GB' }),
      makeVoice({ name: 'C', lang: 'es-ES' }),
      makeVoice({ name: 'D', lang: 'pl-PL' }),
      makeVoice({ name: 'E', lang: 'ja-JP' }),
      makeVoice({ name: 'F', lang: 'de-DE' }),
    ]
    const g = groupVoicesByLang(voices)
    expect(g.en).toHaveLength(2)
    expect(g.es).toHaveLength(1)
    expect(g.pl).toHaveLength(1)
  })
})
