import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'

export default function MainMenu() {
  return (
    <PageTransition>
      <ScreenWrapper className="flex flex-col items-center justify-center gap-6">
        <h1 className="text-4xl font-bold">Main Menu</h1>
        <p>Empty placeholder</p>
      </ScreenWrapper>
    </PageTransition>
  )
}
