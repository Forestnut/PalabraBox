import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { BackButton } from '../components/layout/BackButton'

export default function LanguageSelect() {
  return (
    <PageTransition>
      <ScreenWrapper>
        <BackButton />
        <h1 className="text-2xl font-bold mt-4">Select Language</h1>
        <p>Empty placeholder</p>
      </ScreenWrapper>
    </PageTransition>
  )
}
