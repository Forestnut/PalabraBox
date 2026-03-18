import { useParams } from 'react-router-dom'
import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { BackButton } from '../components/layout/BackButton'

export default function CardsDeck() {
  const { scenarioId } = useParams<{ scenarioId: string }>()

  return (
    <PageTransition>
      <ScreenWrapper>
        <BackButton />
        <h1 className="text-2xl font-bold mt-4">Flashcards</h1>
        <p>Scenario ID: {scenarioId}</p>
        <p>Empty placeholder</p>
      </ScreenWrapper>
    </PageTransition>
  )
}
