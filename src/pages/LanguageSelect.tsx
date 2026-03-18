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
  { key: 'english', label: 'English', emoji: '🇺🇸' },
  { key: 'spanish', label: 'Español', emoji: '🇪🇸' },
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
        <BackButton />
        <h1 className="text-2xl font-bold mt-4">Select Language</h1>
        <p className="mt-2 text-sm text-pb-text-light">
          Choose the language you want to learn. You can change it later in Settings.
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
            Anuluj
          </Button>
          <Button
            size="md"
            className="w-32"
            disabled={!learningLanguage}
            onClick={() => navigate('/level')}
          >
            Continue
          </Button>
        </div>

        {learningLanguage && (
          <p className="mt-4 text-xs text-pb-text-light">
            Selected: <span className="font-bold">{selectedLabel}</span>
          </p>
        )}
      </ScreenWrapper>
    </PageTransition>
  )
}
