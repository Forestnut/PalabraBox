import { AnimatePresence } from 'framer-motion'
import { Navigate, Route, Routes, useLocation } from 'react-router-dom'

import SplashScreen from './pages/SplashScreen'
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
        <Route path="/" element={<SplashScreen />} />
        <Route path="/menu" element={<MainMenu />} />
        <Route path="/scenarios" element={<ScenarioSelect />} />
        <Route path="/game/:scenarioId" element={<GameScreen />} />
        <Route path="/cards" element={<CardsDeck />} />
        <Route path="/results" element={<ResultsScreen />} />
        <Route path="/settings" element={<SettingsScreen />} />
        <Route path="/language" element={<LanguageSelect />} />
        <Route path="/level" element={<LevelSelect />} />
        <Route path="*" element={<Navigate to="/" replace />} />
      </Routes>
    </AnimatePresence>
  )
}

export default function App() {
  return <AppRoutes />
}
