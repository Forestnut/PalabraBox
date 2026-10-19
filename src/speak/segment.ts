/**
 * Language segmentation for PalabraBox TTS.
 *
 * Inputs are either:
 *   - an already-prepared segment array from the DB (`data.tts`) — used
 *     directly (future-proof for mixed-language sentences, e.g. in H2), or
 *   - a plain string plus a default language — wrapped into a single segment.
 *
 * For plain-string fallback we run a lightweight heuristic based on
 * character ranges: characters that exist only in Spanish orthography
 * (¡¿ñÑáéíóúÁÉÍÓÚüÜ) indicate the segment is Spanish. This heuristic is
 * only a fallback — content should always provide a structured `tts` array.
 */

import type { LangCode } from './voices'

export interface TtsSegment {
  text: string
  lang: LangCode
}

/** Characters unique to Spanish orthography (used for string-only fallback). */
const SPANISH_CHARS = /[¡¿ñÑáéíóúÁÉÍÓÚüÜ]/

/**
 * Normalize input into an array of TtsSegments.
 *
 * @param input A prepared segment array OR a plain text string.
 * @param defaultLang Language to assign when the input is a plain string
 *                    without obvious Spanish diacritics. Required when
 *                    `input` is a string.
 */
export function segmentize(
  input: TtsSegment[] | string,
  defaultLang: LangCode = 'en',
): TtsSegment[] {
  if (Array.isArray(input)) {
    return normalizeSegmentArray(input)
  }
  if (typeof input === 'string') {
    const trimmed = input.trim()
    if (!trimmed) return []
    const detectedLang = detectLang(trimmed, defaultLang)
    return [{ text: trimmed, lang: detectedLang }]
  }
  return []
}

/**
 * Given a string, detect whether it looks Spanish; otherwise return default.
 * Uses Spanish-only diacritics and inverted punctuation — high-precision,
 * low-recall on purpose (we'd rather mark a short Spanish word without
 * accents as the default than tag an English word with a false positive).
 */
export function detectLang(text: string, defaultLang: LangCode): LangCode {
  if (SPANISH_CHARS.test(text)) return 'es'
  return defaultLang
}

/**
 * Merge adjacent segments that share the same language and are non-empty,
 * joining them with a single space. Reduces utterance churn when the DB
 * hands us many small segments in the same language.
 */
export function mergeAdjacent(segments: readonly TtsSegment[]): TtsSegment[] {
  const out: TtsSegment[] = []
  for (const seg of segments) {
    const text = seg.text.trim()
    if (!text) continue
    const last = out[out.length - 1]
    if (last && last.lang === seg.lang) {
      last.text = `${last.text} ${text}`.trim()
    } else {
      out.push({ text, lang: seg.lang })
    }
  }
  return out
}

/**
 * Split a segment on sentence-ending punctuation (. ? ! ;), producing
 * multiple shorter segments in the same language. Long utterances can cause
 * Chrome's TTS engine to drop text at the end, so chunking is a safety net.
 * We only split if the resulting chunks are non-empty.
 */
export function splitLongSegments(segments: readonly TtsSegment[], maxChars = 180): TtsSegment[] {
  const out: TtsSegment[] = []
  for (const seg of segments) {
    if (seg.text.length <= maxChars) {
      out.push(seg)
      continue
    }
    const parts = seg.text
      .split(/(?<=[.?!])\s+/)
      .map((p) => p.trim())
      .filter((p) => p.length > 0)
    if (parts.length <= 1) {
      out.push(seg)
    } else {
      for (const part of parts) out.push({ text: part, lang: seg.lang })
    }
  }
  return out
}

/**
 * Full pipeline for TTS: accept raw input, normalize, merge, and chunk long
 * segments. Returns segments ready to be enqueued.
 */
export function prepareSegments(
  input: TtsSegment[] | string,
  defaultLang: LangCode = 'en',
): TtsSegment[] {
  const normalized = segmentize(input, defaultLang)
  const merged = mergeAdjacent(normalized)
  return splitLongSegments(merged)
}

function normalizeSegmentArray(input: readonly unknown[]): TtsSegment[] {
  const out: TtsSegment[] = []
  for (const raw of input) {
    if (!raw || typeof raw !== 'object') continue
    const obj = raw as Partial<TtsSegment>
    if (typeof obj.text !== 'string') continue
    const text = obj.text.trim()
    if (!text) continue
    const lang = obj.lang
    if (lang !== 'en' && lang !== 'es' && lang !== 'pl') continue
    out.push({ text, lang })
  }
  return out
}
