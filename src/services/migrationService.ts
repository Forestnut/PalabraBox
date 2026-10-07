/**
 * Versioned, non-destructive migrations for client-side persisted state.
 *
 * History: the previous implementation wiped every `pb_*` / `palabrabox_*`
 * localStorage key (i.e. the user's stars, points and streak) whenever the
 * app version changed. This module replaces that with a classic migration
 * registry: each migration transforms old state in place and user progress
 * is never destroyed.
 *
 * Rules:
 * - One migration per state version step: `migrations[n]` moves state from
 *   version `n` to `n+1`.
 * - Migrations must be idempotent and safe to run on partially-migrated state.
 * - NEVER delete user progress (stars, points, streak, word stats).
 */

const STATE_VERSION_KEY = 'pb_state_version'
const CURRENT_STATE_VERSION = 1

type StateMigration = () => void

/** Registry of state migrations: key N migrates state from version N to N+1. */
const migrations: Record<number, StateMigration> = {
  // 1: () => { ... } // example: migrate stars from scattered pb_stars_* keys
}

export function getStateVersion(): number {
  if (typeof window === 'undefined') return CURRENT_STATE_VERSION
  const raw = window.localStorage.getItem(STATE_VERSION_KEY)
  const parsed = Number.parseInt(raw ?? '1', 10)
  return Number.isFinite(parsed) && parsed >= 1 ? parsed : 1
}

/**
 * Runs all pending state migrations exactly once per version step.
 * Call synchronously during app bootstrap — no reloads needed.
 */
export function runMigrations(): void {
  if (typeof window === 'undefined') return

  const from = getStateVersion()

  if (from < CURRENT_STATE_VERSION) {
    for (let version = from; version < CURRENT_STATE_VERSION; version++) {
      try {
        migrations[version]?.()
      } catch (err) {
        // A failed migration must not brick the app — log and keep going.
        console.error(`[migrations] state migration v${version} → v${version + 1} failed`, err)
      }
    }
  }

  // Always stamp the current version (also repairs a corrupted stamp)
  window.localStorage.setItem(STATE_VERSION_KEY, String(CURRENT_STATE_VERSION))
}
