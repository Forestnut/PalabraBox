import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'
import { VitePWA } from 'vite-plugin-pwa'

export default defineConfig({
  build: {
    chunkSizeWarningLimit: 900,
    rollupOptions: {
      output: {
        // Vite 8 uses Rolldown — object-form manualChunks is no longer available.
        advancedChunks: {
          groups: [
            {
              name: 'react',
              test: /[\\/]node_modules[\\/](react|react-dom|react-router|scheduler)[\\/]/,
            },
            { name: 'animation', test: /[\\/]node_modules[\\/]motion[\\/]/ },
            { name: 'dnd', test: /[\\/]node_modules[\\/]@dnd-kit[\\/]/ },
            { name: 'supabase', test: /[\\/]node_modules[\\/](@supabase)[\\/]/ },
          ],
        },
      },
    },
  },
  plugins: [
    react(),
    tailwindcss(),
    VitePWA({
      registerType: 'autoUpdate',
      manifest: {
        name: 'PalabraBox — Aprende idiomas jugando',
        short_name: 'PalabraBox',
        description: 'Un juego divertido para aprender idiomas con tarjetas, quizzes y más.',
        theme_color: '#080C08',
        background_color: '#F0F5F1',
        display: 'standalone',
        orientation: 'portrait',
        start_url: '/',
        icons: [
          {
            src: '/favicon.svg',
            sizes: 'any',
            type: 'image/svg+xml',
            purpose: 'any maskable',
          },
          {
            src: '/favicon-128.png',
            sizes: '128x128',
            type: 'image/png',
            purpose: 'any',
          },
        ],
      },
      workbox: {
        globPatterns: ['**/*.{js,css,html,svg,png,woff2}'],
        maximumFileSizeToCacheInBytes: 3 * 1024 * 1024, // 3 MB
        globIgnores: ['**/BoxLogo.svg'],
        runtimeCaching: [
          {
            // Content data: fresh when online, cached copy when offline.
            // (CacheFirst made updates lag up to 7 days behind deploys.)
            urlPattern: /^https:\/\/.*\.supabase\.co\/rest\/v1\/.*/i,
            handler: 'NetworkFirst',
            options: {
              cacheName: 'supabase-rest-cache',
              networkTimeoutSeconds: 5,
              expiration: {
                maxEntries: 200,
                maxAgeSeconds: 60 * 60 * 24 * 7, // 7 days
              },
              cacheableResponse: {
                statuses: [0, 200],
              },
            },
          },
        ],
      },
    }),
  ],
})
