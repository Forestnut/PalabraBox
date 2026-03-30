-- Force drop legacy columns if they somehow still exist in remote/production 
ALTER TABLE public.scenarios
  DROP COLUMN IF EXISTS language,
  DROP COLUMN IF EXISTS title,
  DROP COLUMN IF EXISTS title_display,
  DROP COLUMN IF EXISTS description,
  DROP COLUMN IF EXISTS emoji;
