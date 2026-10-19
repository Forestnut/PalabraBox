-- Drop the legacy "vestige" columns and restore words.base_key NOT NULL.
--
-- These columns were re-added outside migrations (2026-10-07 drift) to keep the
-- pre-E7 app working. The E7 data layer reads only the normalized schema
-- (questions.data, word_translations, …), so this migration must be pushed
-- ONLY after the E7 build is deployed — the live app no longer reads them.
--
-- Push order on production (see docs/DATABASE.md):
--   1. 20261010120000_add_words_emoji.sql + 20261010130000_content_normalized.sql
--      (after the E7 deploy — full content rebuild)
--   2. this migration (drop legacy columns)

ALTER TABLE public.questions DROP COLUMN IF EXISTS correct_answer;
ALTER TABLE public.questions DROP COLUMN IF EXISTS wrong_answers;
ALTER TABLE public.questions DROP COLUMN IF EXISTS image_emoji;

ALTER TABLE public.words DROP COLUMN IF EXISTS word;
ALTER TABLE public.words DROP COLUMN IF EXISTS language;
ALTER TABLE public.words DROP COLUMN IF EXISTS translation_es;
ALTER TABLE public.words DROP COLUMN IF EXISTS translation_en;
ALTER TABLE public.words DROP COLUMN IF EXISTS image_emoji;
ALTER TABLE public.words DROP COLUMN IF EXISTS audio_text;

ALTER TABLE public.words ALTER COLUMN base_key SET NOT NULL;
