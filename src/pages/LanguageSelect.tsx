import { useMemo } from 'react'
import { useNavigate } from 'react-router-dom'

import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { BackButton } from '../components/layout/BackButton'
import { Button } from '../components/ui/Button'
import { SelectableCard } from '../components/ui/SelectableCard'
import { useSettingsStore } from '../store/settingsStore'
import type { LearningLanguage } from '../store/settingsStore'

const languages: Array<{ key: LearningLanguage; label: string; emoji: string }> = [
  { key: 'english', label: 'Inglés', emoji: '🇺🇸' },
]

export default function LanguageSelect() {
  const navigate = useNavigate()
  const { learningLanguage, setLearningLanguage } = useSettingsStore()

  const selectedLabel = useMemo(
    () => languages.find((l) => l.key === learningLanguage)?.label,
    [learningLanguage],
  )

  return (
    <PageTransition>
      <ScreenWrapper>
        <BackButton fallbackUrl="/menu" />
        <h1 className="text-2xl font-bold mt-4">Seleccionar Idioma</h1>
        <p className="mt-2 text-sm text-pb-text-light">
          Elige el idioma que quieres aprender. Entorno optimizado para hispanohablantes.
        </p>

        <div className="grid grid-cols-1 gap-4 mt-6">
          {languages.map((language) => (
            <SelectableCard
              key={language.key}
              title={language.label}
              icon={language.emoji}
              selected={learningLanguage === language.key}
              onClick={() => setLearningLanguage(language.key)}
            />
          ))}
        </div>

        <div className="mt-6 flex justify-end gap-2">
          <Button
            variant="secondary"
            size="md"
            onClick={() => navigate('/menu')}
            className="w-32"
          >
            Cancelar
          </Button>
          <Button
            size="md"
            className="w-32"
            disabled={!learningLanguage}
            onClick={() => navigate('/level')}
          >
            Continuar
          </Button>
        </div>

        {learningLanguage && (
          <p className="mt-4 text-xs text-pb-text-light">
            Seleccionado: <span className="font-bold">{selectedLabel}</span>
          </p>
        )}
      </ScreenWrapper>
    </PageTransition>
  )
}
