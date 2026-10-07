import { AnimatePresence } from 'motion/react'
import { Navigate, Route, Routes, useLocation } from 'react-router-dom'
import { Suspense, lazy, useEffect, useState } from 'react'
import { sfxService } from './services/sfxService'
import { runMigrations } from './services/migrationService'

import { ErrorBoundary } from './components/ui/ErrorBoundary'
import { LoaderOverlay } from './components/ui/LoaderOverlay'
import { Mascot } from './components/ui/Mascot'
import MainMenu from './pages/MainMenu'
import LanguageSelect from './pages/LanguageSelect'
import LevelSelect from './pages/LevelSelect'
import ScenarioSelect from './pages/ScenarioSelect'

// Heavier screens are code-split — they are not needed for the first paint.
const GameScreen = lazy(() => import('./pages/GameScreen'))
const CardsDeck = lazy(() => import('./pages/CardsDeck'))
const ResultsScreen = lazy(() => import('./pages/ResultsScreen'))
const SettingsScreen = lazy(() => import('./pages/SettingsScreen'))

function RouteLoader() {
  return (
    <div className="h-dvh w-full flex flex-col items-center justify-center gap-4">
      <Mascot mood="idle" size="lg" />
      <p className="text-sm font-bold text-pb-text-light animate-pulse">Cargando…</p>
    </div>
  )
}

function AppRoutes() {
  const location = useLocation()

  return (
    <ErrorBoundary>
      <Suspense fallback={<RouteLoader />}>
        <AnimatePresence mode="wait">
          <Routes location={location} key={location.pathname}>
            <Route path="/" element={<Navigate to="/menu" replace />} />
            <Route path="/menu" element={<MainMenu />} />
            <Route path="/scenarios" element={<ScenarioSelect />} />
            <Route path="/game/:scenarioId" element={<GameScreen />} />
            <Route path="/cards" element={<CardsDeck />} />
            <Route path="/results" element={<ResultsScreen />} />
            <Route path="/settings" element={<SettingsScreen />} />
            <Route path="/language" element={<LanguageSelect />} />
            <Route path="/level" element={<LevelSelect />} />
            <Route path="*" element={<Navigate to="/menu" replace />} />
          </Routes>
        </AnimatePresence>
      </Suspense>
    </ErrorBoundary>
  )
}

export default function App() {
  const [isInitializing, setIsInitializing] = useState(true)

  useEffect(() => {
    // Versioned, non-destructive local state migrations (never wipes progress)
    runMigrations()
    sfxService.preload()

    // Brief splash so the LoaderOverlay can act as the loading screen
    const timeout = window.setTimeout(() => setIsInitializing(false), 1600)
    return () => window.clearTimeout(timeout)
  }, [])

  return (
    <>
      <LoaderOverlay isLoading={isInitializing} />
      {!isInitializing && <AppRoutes />}
    </>
  )
}
