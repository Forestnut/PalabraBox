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

## 2. Supabase Configuration

1. Log in to the [Supabase Dashboard](https://supabase.com/dashboard).
1. Create a new project named **PalabraBox**.
1. Copy your **Project URL** and **Anon Key** from the Settings → API page.
1. Create a `.env.local` file in the project root:

```env
VITE_SUPABASE_URL=your-project-url
VITE_SUPABASE_ANON_KEY=your-anon-key
```

1. Execute the SQL scripts from **[DATABASE.md](./DATABASE.md)** in the Supabase SQL Editor.

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
