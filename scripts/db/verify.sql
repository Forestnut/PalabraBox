-- ============================================================================
-- PalabraBox — production database verification (READ-ONLY)
-- Task E0 in docs/PLAN.md — run in Supabase Dashboard → SQL Editor.
--
-- The script only reads data; it never writes. It returns a single report
-- result set (section | item | value), because the SQL Editor displays only
-- one result grid per run.
-- ============================================================================

SELECT section, item, value
FROM (
  -- Migration history recorded on the production database.
  -- to_jsonb() keeps this robust across CLI versions (column sets differ;
  -- 'statements' is dropped because it would flood the report).
  SELECT 'migrations' AS section, version AS item, (to_jsonb(m) - 'statements')::text AS value
  FROM supabase_migrations.schema_migrations m

  UNION ALL
  -- Row counters
  SELECT 'count', 'scenarios', count(*)::text FROM public.scenarios
  UNION ALL
  SELECT 'count', 'scenario_translations', count(*)::text FROM public.scenario_translations
  UNION ALL
  SELECT 'count', 'words', count(*)::text FROM public.words
  UNION ALL
  SELECT 'count', 'word_translations', count(*)::text FROM public.word_translations
  UNION ALL
  SELECT 'count', 'questions', count(*)::text FROM public.questions

  UNION ALL
  -- Questions by type
  SELECT 'questions_by_type', type, count(*)::text
  FROM public.questions GROUP BY type

  UNION ALL
  -- Scenarios by level
  SELECT 'scenarios_by_level', level, count(*)::text
  FROM public.scenarios GROUP BY level

  UNION ALL
  -- Language code distribution (NULL shown as <null>)
  SELECT 'lang.scenario_translations', coalesce(language, '<null>'), count(*)::text
  FROM public.scenario_translations GROUP BY language
  UNION ALL
  SELECT 'lang.word_translations', coalesce(language, '<null>'), count(*)::text
  FROM public.word_translations GROUP BY language
  UNION ALL
  SELECT 'lang.questions.source_language', coalesce(source_language, '<null>'), count(*)::text
  FROM public.questions GROUP BY source_language
  UNION ALL
  SELECT 'lang.questions.target_language', coalesce(target_language, '<null>'), count(*)::text
  FROM public.questions GROUP BY target_language

  UNION ALL
  -- Data quality
  SELECT 'quality', 'question_text = ''undefined''', count(*)::text
  FROM public.questions WHERE question_text = 'undefined'
  UNION ALL
  SELECT 'quality', 'question_text null/empty', count(*)::text
  FROM public.questions WHERE question_text IS NULL OR btrim(question_text) = ''
  UNION ALL
  SELECT 'quality', 'question_text mojibake (Â/Ã chars)', count(*)::text
  FROM public.questions WHERE question_text ~ '[ÂÃ]'
  UNION ALL
  SELECT 'quality', 'questions with image_match type', count(*)::text
  FROM public.questions WHERE type = 'image_match'
  UNION ALL
  SELECT 'quality', 'choice-type questions with <2 options', count(*)::text
  FROM public.questions
  WHERE type IN ('multiple_choice', 'listening', 'fill_blank', 'image_match')
    AND (data -> 'options' IS NULL OR jsonb_array_length(data -> 'options') < 2)
  UNION ALL
  SELECT 'quality', 'questions linked to words (word_id)', count(*)::text
  FROM public.questions WHERE word_id IS NOT NULL
  UNION ALL
  SELECT 'quality', 'scenarios missing es translation', count(*)::text
  FROM public.scenarios s
  WHERE NOT EXISTS (
    SELECT 1 FROM public.scenario_translations t
    WHERE t.scenario_id = s.id AND t.language = 'es'
  )
  UNION ALL
  SELECT 'quality', 'words missing en translation', count(*)::text
  FROM public.words w
  WHERE NOT EXISTS (
    SELECT 1 FROM public.word_translations t
    WHERE t.word_id = w.id AND t.language = 'en'
  )
  UNION ALL
  SELECT 'quality', 'words missing es translation', count(*)::text
  FROM public.words w
  WHERE NOT EXISTS (
    SELECT 1 FROM public.word_translations t
    WHERE t.word_id = w.id AND t.language = 'es'
  )

  UNION ALL
  -- Known drift: legacy (vestige) columns still present on production.
  -- to_jsonb() keeps this safe even if a column does not exist.
  SELECT 'drift.questions', 'rows with correct_answer', count(*)::text
  FROM public.questions q WHERE (to_jsonb(q) ->> 'correct_answer') IS NOT NULL
  UNION ALL
  SELECT 'drift.questions', 'rows with wrong_answers', count(*)::text
  FROM public.questions q WHERE (to_jsonb(q) ->> 'wrong_answers') IS NOT NULL
  UNION ALL
  SELECT 'drift.questions', 'rows with image_emoji', count(*)::text
  FROM public.questions q WHERE (to_jsonb(q) ->> 'image_emoji') IS NOT NULL
  UNION ALL
  SELECT 'drift.words', 'rows with word', count(*)::text
  FROM public.words w WHERE (to_jsonb(w) ->> 'word') IS NOT NULL
  UNION ALL
  SELECT 'drift.words', 'rows with language', count(*)::text
  FROM public.words w WHERE (to_jsonb(w) ->> 'language') IS NOT NULL
  UNION ALL
  SELECT 'drift.words', 'rows with translation_es', count(*)::text
  FROM public.words w WHERE (to_jsonb(w) ->> 'translation_es') IS NOT NULL
  UNION ALL
  SELECT 'drift.words', 'rows with translation_en', count(*)::text
  FROM public.words w WHERE (to_jsonb(w) ->> 'translation_en') IS NOT NULL
  UNION ALL
  SELECT 'drift.words', 'rows with image_emoji', count(*)::text
  FROM public.words w WHERE (to_jsonb(w) ->> 'image_emoji') IS NOT NULL
  UNION ALL
  SELECT 'drift.words', 'rows with audio_text', count(*)::text
  FROM public.words w WHERE (to_jsonb(w) ->> 'audio_text') IS NOT NULL

  UNION ALL
  -- Duplicate groups (expected 0 — unique constraints cover base_key and translations)
  SELECT 'dupes', 'scenarios with same category+level', count(*)::text
  FROM (SELECT category, level FROM public.scenarios GROUP BY category, level HAVING count(*) > 1) d
  UNION ALL
  SELECT 'dupes', 'words with same base_key', count(*)::text
  FROM (SELECT base_key FROM public.words GROUP BY base_key HAVING count(*) > 1) d
  UNION ALL
  SELECT 'dupes', 'questions with same scenario+text', count(*)::text
  FROM (SELECT scenario_id, question_text FROM public.questions GROUP BY scenario_id, question_text HAVING count(*) > 1) d

  UNION ALL
  -- Column inventory (drift evidence — compare with docs/DATABASE.md)
  SELECT 'columns', table_name || '.' || column_name, data_type
  FROM information_schema.columns
  WHERE table_schema = 'public'
    AND table_name IN ('scenarios', 'scenario_translations', 'words', 'word_translations', 'questions')

  UNION ALL
  SELECT 'columns', 'schema_migrations.' || column_name, data_type
  FROM information_schema.columns
  WHERE table_schema = 'supabase_migrations' AND table_name = 'schema_migrations'

  UNION ALL
  -- RLS policies
  SELECT 'rls', tablename || ': ' || policyname, cmd
  FROM pg_policies
  WHERE schemaname = 'public'
) AS report
ORDER BY section, item;

-- Optional samples — the SQL Editor shows only the report above; run these
-- one at a time if you want to eyeball rows (full dumps are preferred, see below):
--   SELECT id, category, level, sort_order FROM public.scenarios ORDER BY level, sort_order;
--   SELECT id, type, question_text, source_language, target_language
--   FROM public.questions ORDER BY scenario_id, sort_order LIMIT 20;
--   SELECT w.base_key, wt.language, wt.text
--   FROM public.words w JOIN public.word_translations wt ON wt.word_id = w.id
--   ORDER BY w.base_key LIMIT 20;
