import { describe, expect, it } from 'vitest'
import { checkBlocks } from './content-checks.mjs'
import { makeValidBlock, makeValidScenario } from './content-fixtures.mjs'

function errorsFor(block) {
  return checkBlocks([block]).errors
}

describe('checkBlocks', () => {
  it('passes a valid block without errors or warnings', () => {
    const { errors, warnings } = checkBlocks([makeValidBlock()])
    expect(errors).toEqual([])
    expect(warnings).toEqual([])
  })

  it('flags options that do not include the correct answer', () => {
    const scenario = makeValidScenario()
    scenario.questions[0].data.options = ['cat', 'water', 'book', 'hello ']
    // 'hello ' normalizes to 'hello' so this passes; use a real mismatch instead
    scenario.questions[0].data.options = ['cat', 'water', 'book', 'goodbye']
    expect(errorsFor([scenario])).toHaveLength(1)
    expect(errorsFor([scenario])[0]).toContain('do not include the correct answer')
  })

  it('flags duplicate options', () => {
    const scenario = makeValidScenario()
    scenario.questions[0].data.options = ['hello', 'hello', 'cat', 'water']
    expect(errorsFor([scenario])[0]).toContain('duplicate options')
  })

  it('flags a Spanish-looking multiple_choice answer (wrong direction)', () => {
    const scenario = makeValidScenario()
    scenario.questions[0].data.correct = 'hola'
    scenario.questions[0].data.options = ['hola', 'cat', 'water', 'book']
    expect(errorsFor([scenario])[0]).toContain('Spanish')
  })

  it('flags Spanish-looking listening audio (must be English)', () => {
    const scenario = makeValidScenario()
    scenario.questions[1].data.audio_text = 'hola'
    expect(errorsFor([scenario])[0]).toContain('audio_text')
    expect(errorsFor([scenario])[0]).toContain('must be English')
  })

  it('flags word_order whose pool misses a correct token', () => {
    const scenario = makeValidScenario()
    scenario.questions[4].data.words = ['I', 'drink', 'hello', 'cat']
    expect(errorsFor([scenario])[0]).toContain('does not contain all correct tokens')
  })

  it('flags word_order without distractors', () => {
    const scenario = makeValidScenario()
    scenario.questions[4].data.words = ['I', 'drink', 'water.']
    expect(errorsFor([scenario])[0]).toContain('no distractor tokens')
  })

  it('flags a Spanish-looking word_order sentence', () => {
    const scenario = makeValidScenario()
    scenario.questions[4].data.correct = ['Yo', 'bebo', 'agua.']
    scenario.questions[4].data.words = ['Yo', 'bebo', 'agua.', 'hola']
    expect(errorsFor([scenario])[0]).toContain('Spanish')
  })

  it('flags fill_blank without a blank marker', () => {
    const scenario = makeValidScenario()
    scenario.questions[2].question.es = 'Yo bebo agua todos los días.'
    expect(errorsFor([scenario])[0]).toContain('blank marker')
  })

  it('flags literal "undefined" anywhere in a question', () => {
    const scenario = makeValidScenario()
    scenario.questions[0].question.es = 'undefined'
    expect(errorsFor([scenario]).some((e) => e.includes('undefined'))).toBe(true)
  })

  it('flags conflicting base_key definitions across scenarios', () => {
    const a = makeValidScenario()
    const b = makeValidScenario()
    b.words[0] = { base_key: 'hello', en: 'hi', es: 'hola' }
    const { errors } = checkBlocks([[a], [b]])
    expect(errors.some((e) => e.includes('conflicts'))).toBe(true)
  })

  it('accepts the same base_key with identical translations across scenarios', () => {
    const a = makeValidScenario()
    const b = makeValidScenario()
    const { errors } = checkBlocks([[a], [b]])
    expect(errors).toEqual([])
  })

  it('warns when a scenario has fewer than 3 question types', () => {
    const scenario = makeValidScenario()
    scenario.questions = scenario.questions.filter((q) => q.type === 'multiple_choice')
    const { warnings } = checkBlocks([[scenario]])
    expect(warnings.some((w) => w.includes('distinct question types'))).toBe(true)
  })

  it('flags a tts segment marked en that looks Spanish', () => {
    const scenario = makeValidScenario()
    scenario.questions[0].data.tts = [{ text: '¿Cómo estás?', lang: 'en' }]
    expect(errorsFor([scenario])[0]).toContain('looks Spanish')
  })
})
