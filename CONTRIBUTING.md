# Contributing to PalabraBox

Thanks for helping improve PalabraBox! 📦

## Getting started

1. Follow the [README quick start](./README.md#-quick-start) — `npm install` should finish without errors.
2. Make sure the checks pass before you start: `npm run lint && npm run typecheck && npm run test && npm run build`.

## Workflow

1. **Never push directly to `main`.** Create a feature branch from the latest `main`:

   ```bash
   git checkout main && git pull
   git checkout -b feat/short-description
   ```

2. Make **small, focused commits** using [Conventional Commits](https://www.conventionalcommits.org/):

   | Prefix      | Use for                                  |
   | ----------- | ---------------------------------------- |
   | `feat:`     | new feature                              |
   | `fix:`      | bug fix                                  |
   | `refactor:` | code change that is neither feat nor fix |
   | `test:`     | adding/adjusting tests                   |
   | `docs:`     | documentation only                       |
   | `chore:`    | tooling, deps, config                    |
   | `perf:`     | performance improvement                  |

   Example: `feat(tts): segment mixed-language sentences per voice`

3. Keep PRs **small** — one task from [docs/PLAN.md](./docs/PLAN.md) per PR when possible. Reference the task ID in the PR description.

4. Open a Pull Request against `main`. CI must pass (lint, typecheck, tests, build). At least one review is recommended for larger changes.

5. Merge with **squash** (keeps history readable).

## Code conventions

- **TypeScript strict** — no `any` unless unavoidable, no unused code (`tsc` enforces).
- **Components** in `src/components` are presentational; data logic lives in hooks (`src/hooks`) and services (`src/services`).
- **Tests**: new pure logic (utils, stores, services) ships with unit tests (Vitest). UI changes get a screenshot in the PR.
- **Docs**: if your change affects architecture, database or setup, update the relevant file in `docs/` in the same PR.
- **Database**: schema/content changes go through SQL migrations in `supabase/migrations/` — never edit the remote DB by hand.
- **Dependencies**: adding a dependency requires justification in the PR (actively maintained, free, no dupes).

## Naming conventions

One convention for the whole project — no exceptions:

- **Migrations**: `YYYYMMDDHHMMSS_snake_case.sql` (UTC timestamp + snake_case name), e.g. `20261008120000_baseline.sql`.
- **Files and directories**: lowercase, `kebab-case` (preferred for new files) or `snake_case` where an existing convention applies (e.g. `scripts/content_blocks/`, `scripts/generate-sql.mjs`).
- **Code and database identifiers**: English (`camelCase` in TypeScript, `snake_case` in SQL).
- **Language codes**: `en` / `es` / `pl` everywhere (database, content, settings).
- **Comments and docs**: English preferred, applied consistently within a file.
- **Commits**: English, Conventional Commits (see above).

## Committing content (questions/words)

Content is generated from JSON blocks in `scripts/content_blocks/` via `scripts/generate-sql.mjs` — see [docs/DATABASE.md](./docs/DATABASE.md). Do not hand-edit generated migrations.

## Questions?

Open an issue with the `bug` or `feature` template.
