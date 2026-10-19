-- Baseline schema for PalabraBox (task E2 in docs/PLAN.md).
--
-- Squashes the 10 historical migrations (2026-03-18 … 2026-03-30) into one
-- clean, intentional schema. The version deliberately keeps the earliest
-- historical timestamp (20260318000000) so the production migration history
-- already records it as applied — see the repair workflow in docs/DATABASE.md.
--
-- Content is NOT part of the baseline: it is loaded by the content migration
-- generated from scripts/content_blocks/ (task E5). supabase/seed.sql stays a
-- documented no-op (task E8).
--
-- Known production drift (verified 2026-10-10, see docs/DATABASE.md) is NOT
-- baked in here on purpose — it is removed by explicit migrations:
--   * legacy "vestige" columns on questions/words, dropped after E7 is deployed
--   * words.base_key nullable -> NOT NULL (same migration)
--   * leftover constraint names from the 2026-03-27 refactor, renamed in E3

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- 1. Scenarios (language-independent)
CREATE TABLE public.scenarios (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  category TEXT NOT NULL,
  level TEXT NOT NULL CHECK (level IN ('beginner', 'intermediate')),
  sort_order INTEGER DEFAULT 0
);

-- 1a. Scenario titles/descriptions per UI language
CREATE TABLE public.scenario_translations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  scenario_id UUID NOT NULL REFERENCES public.scenarios (id) ON DELETE CASCADE,
  language TEXT NOT NULL,
  title TEXT NOT NULL,
  description TEXT,
  UNIQUE (scenario_id, language)
);

-- 2. Words (language-independent registry)
CREATE TABLE public.words (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  base_key TEXT NOT NULL UNIQUE,
  category TEXT NOT NULL,
  level TEXT NOT NULL CHECK (level IN ('beginner', 'intermediate'))
);

-- 2a. Word translations per language
CREATE TABLE public.word_translations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  word_id UUID NOT NULL REFERENCES public.words (id) ON DELETE CASCADE,
  language TEXT NOT NULL,
  text TEXT NOT NULL,
  audio_text TEXT,
  UNIQUE (word_id, language)
);

-- 3. Questions (per scenario, type-specific payload in data jsonb)
CREATE TABLE public.questions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  scenario_id UUID NOT NULL REFERENCES public.scenarios (id) ON DELETE CASCADE,
  type TEXT NOT NULL CHECK (type IN ('multiple_choice', 'image_match', 'listening', 'fill_blank', 'word_order')),
  question_text TEXT NOT NULL,
  question_text_tts TEXT,
  hint TEXT,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now(),
  word_id UUID REFERENCES public.words (id) ON DELETE CASCADE,
  data JSONB,
  source_language TEXT,
  target_language TEXT
);

-- 4. Indexes
CREATE INDEX idx_questions_scenario ON public.questions (scenario_id);
CREATE INDEX idx_word_translations_word_lang ON public.word_translations (word_id, language);

-- 5. Row Level Security: public read for content (MVP has no auth yet);
--    writes stay restricted to service_role (dashboard / migrations).
ALTER TABLE public.scenarios ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.scenario_translations ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.words ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.word_translations ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.questions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public read - scenarios" ON public.scenarios FOR SELECT TO public USING (true);
CREATE POLICY "Allow public read - scenario_translations" ON public.scenario_translations FOR SELECT TO public USING (true);
CREATE POLICY "Allow public read - words" ON public.words FOR SELECT TO public USING (true);
CREATE POLICY "Allow public read - word_translations" ON public.word_translations FOR SELECT TO public USING (true);
CREATE POLICY "Allow public read - questions" ON public.questions FOR SELECT TO public USING (true);
