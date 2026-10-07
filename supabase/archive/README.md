# Supabase archive

Reference snapshots — **not** applied by the Supabase CLI (only `supabase/migrations/` is).

- `20261007203525_remote_schema.sql` — partial `db pull` diff captured on 2026-10-07. It documents the known production drift (legacy columns still present on `questions` and `words`). Moved out of `supabase/migrations/` on 2026-10-08: the CLI was applying it to the shadow database on every `db pull` / `db reset`, which broke both (the `storage.protect_bucket_control_columns()` function does not exist in the shadow DB).

During E0 (see [docs/PLAN.md](../../docs/PLAN.md)) a full production schema dump will be added here as `prod_schema_20261008.sql`, together with the verification results recorded in [docs/DATABASE.md](../../docs/DATABASE.md).
