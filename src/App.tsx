import { AnimatePresence } from 'motion/react'
import { Navigate, Route, Routes, useLocation } from 'react-router-dom'
import { useEffect, useState } from 'react'
import { sfxService } from './services/sfxService'
import { runMigrations } from './services/migrationService'

import { LoaderOverlay } from './components/ui/LoaderOverlay'
import MainMenu from './pages/MainMenu'
import ScenarioSelect from './pages/ScenarioSelect'
import GameScreen from './pages/GameScreen'
import CardsDeck from './pages/CardsDeck'
import ResultsScreen from './pages/ResultsScreen'
import SettingsScreen from './pages/SettingsScreen'
import LanguageSelect from './pages/LanguageSelect'
import LevelSelect from './pages/LevelSelect'

function AppRoutes() {
  const location = useLocation()

  return (
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
  )
}

export default function App() {
  const [isInitializing, setIsInitializing] = useState(true)

  useEffect(() => {
    // Simulate real initialization process (e.g. fetching user session, caching sounds)
    const initApp = async () => {
      try {
        const didReset = await runMigrations()
        if (didReset) {
          console.log('App state was reset for new version.')
          window.location.reload()
          return
        }

        sfxService.preload()
        // Use a longer timeout so the LoaderOverlay acts as the primary splash screen
        await new Promise((resolve) => setTimeout(resolve, 1600))
      } finally {
        setIsInitializing(false)
      }
    }

    initApp()
  }, [])

  return (
    <>
      <LoaderOverlay isLoading={isInitializing} />
      {!isInitializing && <AppRoutes />}
    </>
  )
}
