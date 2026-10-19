import { describe, expect, it } from 'vitest'
import { blockSchema, parseBlock } from './content-schema.mjs'
import { makeValidBlock, makeValidScenario } from './content-fixtures.mjs'

describe('content block schema', () => {
  it('accepts a valid block covering all question types', () => {
    expect(() => parseBlock(makeValidBlock(), 'test.json')).not.toThrow()
  })

  it('accepts the parsed output of safeParse', () => {
    const result = blockSchema.safeParse(makeValidBlock())
    expect(result.success).toBe(true)
  })

  it('rejects a scenario without emoji', () => {
    const scenario = makeValidScenario()
    delete scenario.emoji
    expect(blockSchema.safeParse([scenario]).success).toBe(false)
  })

  it('rejects a question with a single option', () => {
    const scenario = makeValidScenario()
    scenario.questions[0].data.options = ['hello']
    expect(blockSchema.safeParse([scenario]).success).toBe(false)
  })

  it('rejects listening without audio_text', () => {
    const scenario = makeValidScenario()
    delete scenario.questions[1].data.audio_text
    expect(blockSchema.safeParse([scenario]).success).toBe(false)
  })

  it('rejects image_match without image_emoji', () => {
    const scenario = makeValidScenario()
    delete scenario.questions[3].data.image_emoji
    expect(blockSchema.safeParse([scenario]).success).toBe(false)
  })

  it('rejects word_order with fewer than 2 correct tokens', () => {
    const scenario = makeValidScenario()
    scenario.questions[4].data.correct = ['I']
    expect(blockSchema.safeParse([scenario]).success).toBe(false)
  })

  it('rejects an unknown question type', () => {
    const scenario = makeValidScenario()
    scenario.questions[0].type = 'mystery'
    expect(blockSchema.safeParse([scenario]).success).toBe(false)
  })

  it('rejects a word without Spanish translation', () => {
    const scenario = makeValidScenario()
    delete scenario.words[0].es
    expect(blockSchema.safeParse([scenario]).success).toBe(false)
  })

  it('rejects an unknown level', () => {
    const scenario = makeValidScenario()
    scenario.level = 'advanced'
    expect(blockSchema.safeParse([scenario]).success).toBe(false)
  })

  it('parseBlock throws a readable error with the issue path', () => {
    const scenario = makeValidScenario()
    scenario.questions[0].data.options = []
    expect(() => parseBlock([scenario], 'bad.json')).toThrow(/bad\.json/)
    expect(() => parseBlock([scenario], 'bad.json')).toThrow(/options/)
  })
})
