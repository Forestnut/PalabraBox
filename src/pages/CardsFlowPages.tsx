import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { BackButton } from '../components/layout/BackButton'

export function CardsLanguageSelect() {
  return (
    <PageTransition>
      <ScreenWrapper>
        <BackButton />
        <h1 className="text-2xl font-bold mt-4">Tarjetas: Idioma</h1>
      </ScreenWrapper>
    </PageTransition>
  )
}

export function CardsLevelSelect() {
  return (
    <PageTransition>
      <ScreenWrapper>
        <BackButton />
        <h1 className="text-2xl font-bold mt-4">Tarjetas: Nivel</h1>
      </ScreenWrapper>
    </PageTransition>
  )
}

export function CardsScenarioSelect() {
  return (
    <PageTransition>
      <ScreenWrapper>
        <BackButton />
        <h1 className="text-2xl font-bold mt-4">Tarjetas: Escenario</h1>
      </ScreenWrapper>
    </PageTransition>
  )
}
