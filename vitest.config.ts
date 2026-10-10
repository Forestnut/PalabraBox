import { defineConfig } from 'vitest/config'

export default defineConfig({
  test: {
    environment: 'jsdom',
    include: ['src/**/*.test.{ts,tsx}', 'scripts/**/*.test.mjs'],
    // Restore mocked globals (Date, timers) after each test automatically
    restoreMocks: true,
  },
})
