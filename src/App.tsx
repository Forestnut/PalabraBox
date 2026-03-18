import { BrowserRouter as Router, Routes, Route, useLocation } from 'react-router-dom'
import { AnimatePresence } from 'framer-motion'

// Pages
import SplashScreen from './pages/SplashScreen'
import MainMenu from './pages/MainMenu'
import LanguageSelect from './pages/LanguageSelect'
import LevelSelect from './pages/LevelSelect'
import ScenarioSelect from './pages/ScenarioSelect'
import GameScreen from './pages/GameScreen'
import ResultsScreen from './pages/ResultsScreen'
import CardsDeck from './pages/CardsDeck'
import { CardsLanguageSelect, CardsLevelSelect, CardsScenarioSelect } from './pages/CardsFlowPages'
import SettingsScreen from './pages/SettingsScreen'

function AnimatedRoutes() {
  const location = useLocation()
  
  return (
    <AnimatePresence mode="wait">
      <Routes location={location} key={location.pathname}>
        <Route path="/" element={<SplashScreen />} />
        <Route path="/menu" element={<MainMenu />} />
        <Route path="/select-language" element={<LanguageSelect />} />
        <Route path="/select-level" element={<LevelSelect />} />
        <Route path="/scenarios" element={<ScenarioSelect />} />
        <Route path="/game/:scenarioId" element={<GameScreen />} />
        <Route path="/results" element={<ResultsScreen />} />
        <Route path="/cards/select-language" element={<CardsLanguageSelect />} />
        <Route path="/cards/select-level" element={<CardsLevelSelect />} />
        <Route path="/cards/select-scenario" element={<CardsScenarioSelect />} />
        <Route path="/cards/:scenarioId" element={<CardsDeck />} />
        <Route path="/settings" element={<SettingsScreen />} />
      </Routes>
    </AnimatePresence>
  )
}

function App() {
  return (
    <Router>
      <AnimatedRoutes />
    </Router>
  )
}

export default App
