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
    label: 'Principiante',
    description: 'Palabras simples y oraciones cortas. Ideal para dar los primeros pasos.',
  },
  {
    key: 'intermediate',
    label: 'Intermedio',
    description: 'Más vocabulario, oraciones más largas y un ritmo ligeramente más rápido.',
  },
]

export default function LevelSelect() {
  const navigate = useNavigate()
  const { learningLanguage, learningLevel, setLearningLevel } = useSettingsStore()

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
        <h1 className="text-2xl font-bold mt-4">Seleccionar Nivel</h1>
        <p className="mt-2 text-sm text-pb-text-light">
          Elige un nivel de dificultad. Puedes cambiarlo luego.
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
            Atrás
          </Button>
          <Button
            size="md"
            className="w-32"
            disabled={!learningLevel}
            onClick={() => navigate('/scenarios')}
          >
            Comenzar
          </Button>
        </div>

        {learningLevel && (
          <p className="mt-4 text-xs text-pb-text-light">
            Seleccionado: <span className="font-bold">{selectedLabel}</span>
          </p>
        )}
      </ScreenWrapper>
    </PageTransition>
  )
}
