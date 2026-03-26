import { useEffect, useMemo } from 'react'
import { useNavigate } from 'react-router-dom'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faArrowRight } from '@fortawesome/free-solid-svg-icons'

import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { BackButton } from '../components/layout/BackButton'
import { Button } from '../components/ui/Button'
import { SelectableCard } from '../components/ui/SelectableCard'
import { useSettingsStore } from '../store/settingsStore'
import type { LearningLevel } from '../store/settingsStore'

const levels: Array<{ key: LearningLevel; label: string; description: string; emoji: string }> = [
  {
    key: 'beginner',
    label: 'Principiante',
    description: 'Palabras simples y oraciones cortas. Ideal para dar los primeros pasos.',
    emoji: '🌱',
  },
  {
    key: 'intermediate',
    label: 'Intermedio',
    description: 'Más vocabulario, oraciones más largas y un ritmo ligeramente más rápido.',
    emoji: '🚀',
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
        <div className="flex items-center gap-4 mb-2">
          <BackButton fallbackUrl="/language" />
          <h1 className="text-2xl font-black text-pb-dark tracking-tight">Seleccionar Nivel</h1>
        </div>
        <p className="mt-1 mb-6 text-sm text-pb-text-light leading-relaxed">
          Elige un nivel de dificultad. Puedes cambiarlo luego.
        </p>

        <div className="grid grid-cols-1 gap-3">
          {levels.map((level) => (
            <SelectableCard
              key={level.key}
              title={level.label}
              description={level.description}
              icon={level.emoji}
              selected={learningLevel === level.key}
              onClick={() => setLearningLevel(level.key)}
            />
          ))}
        </div>

        <div className="mt-6 flex justify-end gap-2">
          <Button
            variant="ghost"
            size="md"
            onClick={() => navigate('/language')}
            className="w-28"
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
            <FontAwesomeIcon icon={faArrowRight} className="text-sm" />
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
