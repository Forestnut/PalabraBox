import { createClient } from '@supabase/supabase-js'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL || ''
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY || ''

// Dev-friendly warning if env vars are missing
if (!supabaseUrl || !supabaseAnonKey) {
  console.warn(
    '⚠️ Supabase URL or Anon Key is missing. Ensure you have created a .env.local file ' +
      'with VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY defined. ' +
      'Data fetching will fail until these are provided.'
  )
}

// Create and export the Supabase client instance
export const supabase = createClient(
  supabaseUrl || 'http://localhost:54321', // Fallback to local dev if empty
  supabaseAnonKey || 'placeholder-key-to-prevent-crash'
)
