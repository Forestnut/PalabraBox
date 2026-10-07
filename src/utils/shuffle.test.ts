import { describe, it, expect } from 'vitest'
import { shuffleArray } from './shuffle'

describe('shuffleArray', () => {
  it('returns a permutation of the input (same elements, same length)', () => {
    const input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    const output = shuffleArray(input)

    expect(output).toHaveLength(input.length)
    expect([...output].sort((a, b) => a - b)).toEqual(input)
  })

  it('does not mutate the input array', () => {
    const input = ['a', 'b', 'c', 'd']
    const copy = [...input]
    shuffleArray(input)

    expect(input).toEqual(copy)
  })

  it('handles empty and single-element arrays', () => {
    expect(shuffleArray([])).toEqual([])
    expect(shuffleArray([42])).toEqual([42])
  })
})
