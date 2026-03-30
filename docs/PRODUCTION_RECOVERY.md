# Production Recovery and Deploy Guide (Supabase + Vercel)

This guide restores and stabilizes production for PalabraBox.
It assumes the app is deployed on Vercel and Supabase is the backend.

## 1. Immediate safety steps

1. Create a backup in Supabase Dashboard:
- Go to project Settings -> Database -> Backups.
- Create a manual backup/snapshot before applying changes.

2. Freeze manual DB edits:
- Stop changing tables from Supabase Dashboard SQL editor unless it is an emergency.
- From now on, apply schema/content through versioned migrations only.

3. Rotate exposed secrets if needed:
- If any sensitive token was shared accidentally, rotate it now.

## 2. Verify local source of truth

In this repository, production content should come from migrations in supabase/migrations.
The file supabase/seed.sql is intentionally a no-op to avoid duplicate inserts.

## 3. Link CLI to production Supabase project

Run these commands from project root:

1) Install deps
npm install

2) Login to Supabase CLI
npx supabase login

3) Link local project to remote project
npx supabase link --project-ref vdfgmujjkyhirlfwycwe

Notes:
- You may be asked for the database password from Supabase project settings.
- The project ref comes from your current VITE_SUPABASE_URL.

## 4. Push migrations to production

Run:

npx supabase db push

This applies all pending files from supabase/migrations to the remote database.

## 5. Validate production database state

Run in Supabase SQL Editor:

select count(*) as scenarios_count from public.scenarios;
select count(*) as words_count from public.words;
select count(*) as questions_count from public.questions;

Expected outcome:
- Non-zero counts in all three queries.
- No errors about missing relations or RLS policies.

Optional health checks:

select schemaname, tablename, policyname
from pg_policies
where schemaname = 'public'
and tablename in ('scenarios','scenario_translations','words','word_translations','questions')
order by tablename, policyname;

## 6. Configure Vercel environment variables

In Vercel project settings (Production, Preview, Development), set:

VITE_SUPABASE_URL=https://vdfgmujjkyhirlfwycwe.supabase.co
VITE_SUPABASE_ANON_KEY=<your current publishable anon key>

Important:
- Use the key from Supabase Settings -> API.
- Do not use service_role key in frontend env vars.

## 7. Redeploy production

Option A (Dashboard):
- Open Vercel Deployments and click Redeploy on the latest production deployment.

Option B (CLI):
vercel --prod

## 8. Post-deploy smoke tests

1. Open the production site and verify scenario list loads.
2. Start one scenario and verify questions load.
3. Check browser console for fetch/auth errors.
4. Verify REST endpoint manually:

GET https://vdfgmujjkyhirlfwycwe.supabase.co/rest/v1/scenarios?select=id,category,level&limit=5
Headers:
- apikey: <publishable anon key>
- Authorization: Bearer <publishable anon key>

## 9. Team workflow to prevent future breakage

1. Every DB change must be added as a migration file in supabase/migrations.
2. Never edit production tables manually unless hotfix is unavoidable.
3. After adding migration:
- test locally with npx supabase start
- then run npx supabase db push for remote
4. Keep Vercel env vars aligned with the intended Supabase project.

## 10. Fast rollback plan

If production fails after a migration:

1. Restore backup/snapshot in Supabase.
2. Redeploy last known good Vercel deployment.
3. Re-apply migrations in a staging project before retrying production.
