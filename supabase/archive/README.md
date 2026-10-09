# Supabase archive

Reference snapshots — **not** applied by the Supabase CLI (only `supabase/migrations/` is).

- `20261007203525_remote_schema.sql` — partial `db pull` diff captured on 2026-10-07. It documents the known production drift (legacy columns still present on `questions` and `words`). Moved out of `supabase/migrations/` on 2026-10-08: the CLI was applying it to the shadow database on every `db pull` / `db reset`, which broke both (the `storage.protect_bucket_control_columns()` function does not exist in the shadow DB).
- `prod_schema_20261008.sql` — full schema dump of the production database (task E0). Reference for the pre-baseline state; confirmed the drift described in `20261007203525_remote_schema.sql`.
- `backup_data_20261008.sql` — data-only dump of the production database (task E0). Kept as the **pre-wipe content backup**: the E5 content migration wipes all content tables and replaces them with normalized content (owner decision, 2026-10-08).

Verification results are recorded in [docs/DATABASE.md](../../docs/DATABASE.md).
