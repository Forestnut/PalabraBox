-- Schema hardening (task E3 in docs/PLAN.md):
-- language code CHECK constraints, missing indexes, scenarios.emoji,
-- consistent constraint names.
--
-- Safe to push to production at any time: purely additive (the live app
-- does not read the new column yet — E7 does), and existing data passes
-- the CHECKs (verified 2026-10-10: only 'en'/'es'/NULL values present).

-- 1. Language codes: 'en' / 'es' / 'pl' everywhere.
--    Nullable columns (questions.source_language/target_language) pass
--    CHECK on NULL by definition.
ALTER TABLE public.scenario_translations
  ADD CONSTRAINT scenario_translations_language_check CHECK (language IN ('en', 'es', 'pl'));
ALTER TABLE public.word_translations
  ADD CONSTRAINT word_translations_language_check CHECK (language IN ('en', 'es', 'pl'));
ALTER TABLE public.questions
  ADD CONSTRAINT questions_source_language_check CHECK (source_language IN ('en', 'es', 'pl'));
ALTER TABLE public.questions
  ADD CONSTRAINT questions_target_language_check CHECK (target_language IN ('en', 'es', 'pl'));

-- 2. Indexes.
--    Scenario browsing filters by level and orders by sort_order.
CREATE INDEX IF NOT EXISTS idx_scenarios_level_sort ON public.scenarios (level, sort_order);
--    FK lookups questions -> words.
CREATE INDEX IF NOT EXISTS idx_questions_word_id ON public.questions (word_id);
--    The remaining FK columns are already covered by the composite UNIQUE
--    indexes: scenario_translations (scenario_id, language) and
--    word_translations (word_id, language); questions.scenario_id is covered
--    by idx_questions_scenario from the baseline.

-- 3. Scenario emoji lives in the database (replaces idEmojiMap in code — E7).
--    Populated by the content migration (E5); the live app keeps using the
--    in-code map until E7 is deployed.
ALTER TABLE public.scenarios ADD COLUMN emoji TEXT;

-- 4. Consistent constraint names. Production still carries names leaked from
--    the 2026-03-27 refactor's table renames (scenarios_new_* / words_new_*),
--    while the baseline creates clean names — so the renames are guarded and
--    run only where the legacy names exist (production), no-op locally.
DO $$
DECLARE
  r RECORD;
BEGIN
  FOR r IN
    SELECT conrelid::regclass AS table_name, conname AS old_name
    FROM pg_constraint
    WHERE conname IN (
      'scenarios_new_pkey', 'words_new_pkey',
      'scenarios_new_level_check', 'words_new_level_check',
      'words_new_base_key_key'
    )
  LOOP
    EXECUTE format(
      'ALTER TABLE %s RENAME CONSTRAINT %I TO %I',
      r.table_name,
      r.old_name,
      replace(r.old_name, '_new_', '_')
    );
  END LOOP;
END $$;
