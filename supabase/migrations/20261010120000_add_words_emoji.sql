-- Word emoji for visual flashcards (task E3 follow-up: emoji lives in the
-- database, not in code — same as scenarios.emoji). Populated by the content
-- migration (20261010130000_content_normalized.sql).
ALTER TABLE public.words ADD COLUMN IF NOT EXISTS emoji TEXT;
