import type { Config } from 'tailwindcss'

export default {
  content: ['./index.html', './src/**/*.{js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        'pb-dark': '#080C08',
        'pb-green': '#56876D',
        'pb-emerald': '#04724D',
        'pb-amber': '#FFA42C',
        'pb-bg': '#F0F5F1',
        'pb-success': '#10B981',
        'pb-error': '#EF4444',
        'pb-text-light': '#6B7B71',
      },
      fontFamily: {
        sans: ['Nunito', 'system-ui', 'sans-serif'],
      },
      borderRadius: {
        'box': '12px',
        'box-lg': '16px',
      },
      boxShadow: {
        'box': '0 4px 0 0 rgba(8, 12, 8, 0.15), 0 2px 8px rgba(8, 12, 8, 0.08)',
        'box-hover': '0 6px 0 0 rgba(8, 12, 8, 0.15), 0 4px 12px rgba(8, 12, 8, 0.12)',
        'box-pressed': '0 2px 0 0 rgba(8, 12, 8, 0.15), 0 1px 4px rgba(8, 12, 8, 0.08)',
      },
    },
  },
  plugins: [],
} satisfies Config