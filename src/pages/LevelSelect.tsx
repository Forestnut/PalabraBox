import { useEffect, useMemo } from 'react'
import { useNavigate } from 'react-router-dom'

import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { BackButton } from '../components/layout/BackButton'
import { Button } from '../components/ui/Button'
import { SelectableCard } from '../components/ui/SelectableCard'
import { useSettingsStore } from '../store/settingsStore'
import type { LearningLevel } from '../store/settingsStore'

const levels: Array<{ key: LearningLevel; label: string; description: string }> = [
  {
    key: 'beginner',
    label: 'Beginner',
    description: 'Simple words and short sentences. Great for first steps.',
  },
  {
    key: 'intermediate',
    label: 'Intermediate',
    description: 'More vocabulary, longer sentences, and slightly faster pace.',
  },
]

export default function LevelSelect() {
  const navigate = useNavigate()
  const { learningLanguage, learningLevel, setLearningLevel } = useSettingsStore(
    (state) => ({
      learningLanguage: state.learningLanguage,
      learningLevel: state.learningLevel,
      setLearningLevel: state.setLearningLevel,
    }),
  )

  useEffect(() => {
    if (!learningLanguage) {
      navigate('/language', { replace: true })
    }
  }, [learningLanguage, navigate])

  const selectedLabel = useMemo(
    () => levels.find((l) => l.key === learningLevel)?.label,
    [learningLevel],
  )

  return (
    <PageTransition>
      <ScreenWrapper>
        <BackButton />
        <h1 className="text-2xl font-bold mt-4">Select Level</h1>
        <p className="mt-2 text-sm text-pb-text-light">
          Choose a difficulty level. You can change it later in Settings.
        </p>

        <div className="grid grid-cols-1 gap-4 mt-6">
          {levels.map((level) => (
            <SelectableCard
              key={level.key}
              title={level.label}
              description={level.description}
              selected={learningLevel === level.key}
              onClick={() => setLearningLevel(level.key)}
            />
          ))}
        </div>

        <div className="mt-6 flex justify-end gap-2">
          <Button
            variant="secondary"
            size="md"
            onClick={() => navigate('/language')}
            className="w-32"
          >
            Back
          </Button>
          <Button
            size="md"
            className="w-32"
            disabled={!learningLevel}
            onClick={() => navigate('/scenarios')}
          >
            Start
          </Button>
        </div>

        {learningLevel && (
          <p className="mt-4 text-xs text-pb-text-light">
            Selected: <span className="font-bold">{selectedLabel}</span>
          </p>
        )}
      </ScreenWrapper>
    </PageTransition>
  )
}
