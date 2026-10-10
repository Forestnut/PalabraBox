// Validates all content blocks: zod schema + semantic checks.
// Exits non-zero when there are errors — usable as a pre-commit/CI gate.
//
// Usage: node scripts/verify-content.mjs [--warnings-as-errors]

import fs from 'fs'
import path from 'path'
import { parseBlock } from './content-schema.mjs'
import { checkBlocks } from './content-checks.mjs'

const CONTENT_DIR = path.join(process.cwd(), 'scripts', 'content_blocks')

function main() {
  const warningsAsErrors = process.argv.includes('--warnings-as-errors')
  const files = fs
    .readdirSync(CONTENT_DIR)
    .filter((file) => file.endsWith('.json'))
    .sort()

  const blocks = []
  let failed = false

  for (const file of files) {
    try {
      const raw = JSON.parse(fs.readFileSync(path.join(CONTENT_DIR, file), 'utf8'))
      blocks.push(parseBlock(raw, file))
      console.log(`✓ ${file}: schema OK`)
    } catch (err) {
      failed = true
      console.error(`✗ ${file}: ${err.message}`)
    }
  }

  if (!failed) {
    const { errors, warnings } = checkBlocks(blocks)
    for (const warning of warnings) console.warn(`⚠ ${warning}`)
    for (const error of errors) console.error(`✗ ${error}`)

    const scenarioCount = blocks.reduce((sum, block) => sum + block.length, 0)
    const questionCount = blocks.reduce(
      (sum, block) => sum + block.reduce((s, sc) => s + sc.questions.length, 0),
      0,
    )
    const wordCount = blocks.reduce(
      (sum, block) => sum + block.reduce((s, sc) => s + sc.words.length, 0),
      0,
    )

    if (errors.length > 0) {
      console.error(`\n${errors.length} error(s), ${warnings.length} warning(s)`)
      process.exit(1)
    }
    console.log(
      `\nContent OK: ${files.length} blocks, ${scenarioCount} scenarios, ${wordCount} words, ${questionCount} questions (${warnings.length} warning(s))`,
    )
    if (warningsAsErrors && warnings.length > 0) process.exit(1)
  } else {
    process.exit(1)
  }
}

main()
