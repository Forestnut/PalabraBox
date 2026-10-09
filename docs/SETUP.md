# 🛠️ Development Setup Guide

Follow these steps to set up the **PalabraBox** development environment on your local machine.

## Prerequisites

Before you begin, ensure you have the following installed:

- **Node.js** (v18 or higher)
- **npm** (v9 or higher)
- **Git** (for version control)
- **A Supabase Account** (for the backend)

## 1. Clone & Install

```bash
# Clone the repository
git clone https://github.com/yourusername/palabrabox.git
cd palabrabox

# Install dependencies
npm install
```

## 2. Supabase Database

The schema is versioned in `supabase/migrations/` — never edit the database by hand; add a migration and push it (see **[DATABASE.md](./DATABASE.md)** for the full workflow).

### Local development (recommended)

Requires Docker Desktop and the Supabase CLI (via `npx`, no global install needed):

```bash
npx supabase start      # start the local Supabase stack
npx supabase status     # URLs + anon key for .env.local
npx supabase db reset   # rebuild the local DB from migrations + seed
npx supabase stop
```

Local services: API `http://127.0.0.1:54321` · Studio `http://127.0.0.1:54323` · DB `postgresql://postgres:postgres@127.0.0.1:54322/postgres`.

Create a `.env.local` file in the project root (see `.env.example`). For local development point it at the local stack:

```env
VITE_SUPABASE_URL=http://127.0.0.1:54321
VITE_SUPABASE_ANON_KEY=<anon key from `npx supabase status`>
```

### Production

Link the project once, then push migrations (never edit the remote DB by hand):

```bash
npx supabase link --project-ref <project-ref>
npx supabase db push
```

Review the diff before pushing: `npx supabase db diff`.

## 3. Mandatory Sound Files

For the game and UI to work, place the following short `.mp3` files in `/public/sounds/`:

- `correct.mp3`
- `wrong.mp3`
- `click.mp3`
- `level-complete.mp3`
- `game-over.mp3`

> **Note:** You can find free sounds at [Mixkit.co](https://mixkit.co/free-sound-effects/).

## 4. Run Development Server

```bash
# Start the Vite dev server
npm run dev
```

The app will be available at [http://localhost:5173](http://localhost:5173).

## 5. VS Code Recommended Extensions

To maintain code quality and follow the project's style:

- **ESLint** (dbaeumer.vscode-eslint)
- **Tailwind CSS IntelliSense** (bradlc.vscode-tailwindcss)
- **Prisma** (if using for DB, otherwise not needed)
- **Markdown All in One** (yzhang.markdown-all-in-one)

## Available Commands

- `npm run dev` — starts dev server
- `npm run build` — creates production bundle in `/dist`
- `npm run preview` — previews production build
- `npm run lint` — checks for code style issues

## Deployment (Vercel)

The project is pre-configured for Vercel.

1. Push your code to GitHub.
1. Connect your repository in the Vercel dashboard.
1. Add environment variables: `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY`.
1. Deploy!
