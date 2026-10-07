import { defineConfig } from 'vitest/config'

export default defineConfig({
  test: {
    environment: 'jsdom',
    include: ['src/**/*.test.{ts,tsx}'],
    // Restore mocked globals (Date, timers) after each test automatically
    restoreMocks: true,
  },
})
