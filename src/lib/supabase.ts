import { createClient } from '@supabase/supabase-js'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL as string | undefined
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY as string | undefined

/**
 * True when both required env vars are present.
 * Hooks use this to surface a clear configuration error instead of firing
 * doomed requests (no more silent localhost fallback).
 */
export const isSupabaseConfigured = Boolean(supabaseUrl && supabaseAnonKey)

export const SUPABASE_CONFIG_ERROR =
  'Error de configuración: faltan VITE_SUPABASE_URL y/o VITE_SUPABASE_ANON_KEY. ' +
  'Copia .env.example a .env.local y rellénalo con los valores de tu proyecto.'

if (!isSupabaseConfigured) {
  // Loud and early — in dev this must be impossible to miss.
  console.error(`[supabase] ${SUPABASE_CONFIG_ERROR}`)
}

// createClient tolerates empty strings; requests would fail anyway.
// Guarding here keeps the module import-safe for tests and storybook-like contexts.
export const supabase = createClient(
  supabaseUrl ?? 'https://placeholder.invalid',
  supabaseAnonKey ?? 'placeholder',
)
