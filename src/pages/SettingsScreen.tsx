import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { BackButton } from '../components/layout/BackButton'

export default function SettingsScreen() {
  return (
    <PageTransition>
      <ScreenWrapper>
        <BackButton />
        <h1 className="text-2xl font-bold mt-4">Configuración</h1>
        <p>Aún no implementado</p>
      </ScreenWrapper>
    </PageTransition>
  )
}
