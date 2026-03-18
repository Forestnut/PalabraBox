import { PageTransition } from '../components/layout/PageTransition'

export default function SplashScreen() {
  return (
    <PageTransition className="flex items-center justify-center bg-pb-dark text-white">
      <div className="text-center">
        <span className="text-6xl animate-bounce">📦</span>
        <h1 className="text-4xl font-extrabold mt-4">PalabraBox</h1>
      </div>
    </PageTransition>
  )
}
