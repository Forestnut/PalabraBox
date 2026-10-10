import { describe, expect, it } from 'vitest'
import { generateSql } from './generate-sql.mjs'
import { makeValidBlock } from './content-fixtures.mjs'

const blocks = [{ name: 'test.json', scenarios: makeValidBlock() }]

describe('generateSql', () => {
  const sql = generateSql(blocks)

  it('emits an upsert for the scenario with emoji', () => {
    expect(sql).toContain('INSERT INTO public.scenarios (id, category, level, sort_order, emoji)')
    expect(sql).toContain("'basics', 'beginner', 100, '🧪'")
  })

  it('emits both scenario translations', () => {
    expect(sql).toContain("'Test Scenario'")
    expect(sql).toContain("'Escenario de prueba'")
  })

  it('emits word translations for en and es', () => {
    expect(sql.match(/INSERT INTO public\.word_translations/g)).toHaveLength(8)
    expect(sql).toContain(
      "SELECT w.id, 'en', 'hello', 'hello' FROM public.words w WHERE w.base_key = 'hello'",
    )
  })

  it('stores the Spanish prompt as question_text and fixes the direction to es -> en', () => {
    expect(sql).toContain("'¿Cómo se dice ''hola'' en inglés?'")
    expect(sql).toContain("  'es',\n  'en'\n)")
  })

  it('never emits the literal undefined', () => {
    expect(sql).not.toContain("'undefined'")
  })

  it('escapes single quotes in strings', () => {
    expect(sql).toContain("''hola''")
  })

  it('emits data as jsonb with tts structure', () => {
    expect(sql).toContain('"tts":[{"text":"hello","lang":"en"}]')
    expect(sql).toContain('::jsonb')
  })

  it('populates question_text_tts for listening and word_order only', () => {
    // listening -> audio_text
    expect(sql).toContain("'hello',\n  2,") // question_text_tts for listening (sort 2)
    // word_order -> the sentence
    expect(sql).toContain("'I drink water.',\n  5,")
  })

  it('links choice questions to words via base_key subselect', () => {
    expect(sql).toContain("(SELECT id FROM public.words WHERE base_key = 'hello')")
    expect(sql).toContain("(SELECT id FROM public.words WHERE base_key = 'water')")
  })

  it('is deterministic (byte-identical on re-run)', () => {
    expect(generateSql(blocks)).toBe(sql)
  })

  it('prepends TRUNCATE when wipe is set', () => {
    const wiped = generateSql(blocks, { wipe: true })
    expect(wiped).toContain(
      'TRUNCATE public.questions, public.word_translations, public.words, public.scenario_translations, public.scenarios RESTART IDENTITY CASCADE;',
    )
    expect(wiped.indexOf('TRUNCATE')).toBeLessThan(wiped.indexOf('INSERT INTO'))
  })

  it('assigns increasing sort_order per level', () => {
    const two = [
      { name: 'a.json', scenarios: makeValidBlock() },
      { name: 'b.json', scenarios: makeValidBlock() },
    ]
    const out = generateSql(two)
    expect(out).toContain("'beginner', 100,")
    expect(out).toContain("'beginner', 101,")
  })
})
