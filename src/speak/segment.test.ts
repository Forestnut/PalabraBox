import { describe, it, expect } from 'vitest'
import {
  segmentize,
  mergeAdjacent,
  splitLongSegments,
  prepareSegments,
  detectLang,
} from './segment'
import type { TtsSegment } from './segment'

describe('detectLang', () => {
  it('returns es for text with Spanish-only diacritics', () => {
    expect(detectLang('¿Cómo estás?', 'en')).toBe('es')
    expect(detectLang('¡Hola, niño!', 'en')).toBe('es')
    expect(detectLang('pingüino', 'en')).toBe('es')
  })

  it('returns the default language for text without Spanish chars', () => {
    expect(detectLang('hello world', 'en')).toBe('en')
    expect(detectLang('water', 'en')).toBe('en')
  })
})

describe('segmentize', () => {
  it('returns prepared segments from the DB array as-is (trimmed)', () => {
    const segs = segmentize([{ text: 'hello', lang: 'en' }])
    expect(segs).toEqual([{ text: 'hello', lang: 'en' }])
  })

  it('filters out invalid entries in the array', () => {
    const segs = segmentize([
      { text: 'hello', lang: 'en' },
      { text: '   ', lang: 'en' },
      { text: '', lang: 'es' },
      { text: 'x', lang: 'fr' },
      'not a segment',
      null,
      { text: 'mundo', lang: 'es' },
    ] as unknown as TtsSegment[])
    expect(segs).toEqual([
      { text: 'hello', lang: 'en' },
      { text: 'mundo', lang: 'es' },
    ])
  })

  it('wraps plain strings into a single segment using detected/default lang', () => {
    expect(segmentize('hello world', 'en')).toEqual([{ text: 'hello world', lang: 'en' }])
    expect(segmentize('¿Cómo te llamas?', 'en')).toEqual([{ text: '¿Cómo te llamas?', lang: 'es' }])
  })

  it('returns [] for empty input', () => {
    expect(segmentize('', 'en')).toEqual([])
    expect(segmentize('   ', 'en')).toEqual([])
    expect(segmentize([], 'en')).toEqual([])
  })
})

describe('mergeAdjacent', () => {
  it('merges consecutive segments with the same language', () => {
    const merged = mergeAdjacent([
      { text: 'Hello', lang: 'en' },
      { text: 'world.', lang: 'en' },
      { text: '¿Qué tal?', lang: 'es' },
      { text: 'Bien.', lang: 'es' },
    ])
    expect(merged).toEqual([
      { text: 'Hello world.', lang: 'en' },
      { text: '¿Qué tal? Bien.', lang: 'es' },
    ])
  })

  it('does not merge across different languages', () => {
    const merged = mergeAdjacent([
      { text: 'Dice', lang: 'es' },
      { text: 'hello', lang: 'en' },
      { text: 'en inglés', lang: 'es' },
    ])
    expect(merged).toHaveLength(3)
  })

  it('drops empty segments', () => {
    expect(
      mergeAdjacent([
        { text: '  ', lang: 'en' },
        { text: 'hi', lang: 'en' },
      ]),
    ).toEqual([{ text: 'hi', lang: 'en' }])
  })
})

describe('splitLongSegments', () => {
  it('keeps short segments untouched', () => {
    const out = splitLongSegments([{ text: 'Hello.', lang: 'en' }], 20)
    expect(out).toEqual([{ text: 'Hello.', lang: 'en' }])
  })

  it('splits long segments on sentence punctuation', () => {
    const long = 'First sentence. Second sentence! Third one? Fourth; continues.'
    const out = splitLongSegments([{ text: long, lang: 'en' }], 30)
    expect(out).toHaveLength(4)
    expect(out[0].text).toBe('First sentence.')
    expect(out[1].text).toBe('Second sentence!')
    expect(out[2].text).toBe('Third one?')
    expect(out[3].text).toBe('Fourth; continues.')
  })

  it('does not split if there are no sentence boundaries', () => {
    const word = 'hello '.repeat(50).trim()
    const out = splitLongSegments([{ text: word, lang: 'en' }], 20)
    expect(out).toHaveLength(1)
  })
})

describe('prepareSegments (full pipeline)', () => {
  it('normalizes, merges, and splits', () => {
    const out = prepareSegments([
      { text: 'Hi!', lang: 'en' },
      { text: 'How are you?', lang: 'en' },
      { text: 'Muy bien, gracias.', lang: 'es' },
    ])
    expect(out).toEqual([
      { text: 'Hi! How are you?', lang: 'en' },
      { text: 'Muy bien, gracias.', lang: 'es' },
    ])
  })

  it('handles plain strings with default lang', () => {
    expect(prepareSegments('Hello world.', 'en')).toEqual([{ text: 'Hello world.', lang: 'en' }])
  })

  it('supports multi-language mixed segments (future H2)', () => {
    const out = prepareSegments(
      [
        { text: '¿Cómo se dice', lang: 'es' },
        { text: 'water', lang: 'en' },
        { text: 'en inglés?', lang: 'es' },
      ],
      'en',
    )
    expect(out).toHaveLength(3)
    expect(out.map((s) => s.lang)).toEqual(['es', 'en', 'es'])
  })
})
