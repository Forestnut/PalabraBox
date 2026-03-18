import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { Button } from '../components/ui/Button'
import { useNavigate } from 'react-router-dom'

export default function ResultsScreen() {
  const navigate = useNavigate()

  return (
    <PageTransition>
      <ScreenWrapper className="flex flex-col items-center justify-center gap-6">
        <h1 className="text-4xl font-bold">Results</h1>
        <p>Empty placeholder</p>
        <Button onClick={() => navigate('/menu')}>Volver al inicio</Button>
      </ScreenWrapper>
    </PageTransition>
  )
}
