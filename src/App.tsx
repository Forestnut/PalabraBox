import { AnimatePresence } from 'framer-motion'
import { Navigate, Route, Routes, useLocation } from 'react-router-dom'
import { useEffect, useState } from 'react'
import { audioService } from './services/audioService'
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
        const didReset = await runMigrations();
        if (didReset) {
          console.log('App state was reset for new version.');
          // You could potentially trigger a full reload here: window.location.reload();
          // but react state will initialize fresh anyway.
        }
        
        await audioService.preloadSounds()
        // Wait at least a tiny bit for the splash screen feel if everything loaded instantly
        await new Promise(resolve => setTimeout(resolve, 800))
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
