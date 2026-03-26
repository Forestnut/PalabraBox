import { useMemo } from 'react'
import { useNavigate } from 'react-router-dom'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faArrowRight } from '@fortawesome/free-solid-svg-icons'

import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { BackButton } from '../components/layout/BackButton'
import { Button } from '../components/ui/Button'
import { SelectableCard } from '../components/ui/SelectableCard'
import { useSettingsStore } from '../store/settingsStore'
import type { LearningLanguage } from '../store/settingsStore'

const languages: Array<{ key: LearningLanguage | 'polish'; label: string; emoji: string; disabled?: boolean }> = [
  { key: 'english', label: 'Inglés', emoji: '🇺🇸' },
  { key: 'polish', label: 'Polaco(Próximamente)', emoji: '🇵🇱', disabled: true },
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
        <div className="flex items-center gap-4 mb-2">
          <BackButton fallbackUrl="/menu" />
          <h1 className="text-2xl font-black text-pb-dark tracking-tight">Seleccionar Idioma</h1>
        </div>
        <p className="mt-1 mb-6 text-sm text-pb-text-light leading-relaxed">
          Elige el idioma que quieres aprender. Entorno optimizado para hispanohablantes.
        </p>

        <div className="grid grid-cols-1 gap-3">
          {languages.map((language) => (
            <div key={language.key} className={language.disabled ? "opacity-50 pointer-events-none" : ""}>
              <SelectableCard
                title={language.label}
                icon={language.emoji}
                selected={learningLanguage === language.key}
                onClick={() => {
                  if (!language.disabled) {
                    setLearningLanguage(language.key as LearningLanguage)
                  }
                }}
              />
            </div>
          ))}
        </div>

        <div className="mt-6 flex justify-end gap-2">
          <Button
            variant="ghost"
            size="md"
            onClick={() => navigate('/menu')}
            className="w-28"
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
            <FontAwesomeIcon icon={faArrowRight} className="text-sm" />
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
