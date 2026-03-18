import { Button } from './components/ui/Button'
import { Card } from './components/ui/Card'
import { ScreenWrapper } from './components/layout/ScreenWrapper'

function App() {
  return (
    <ScreenWrapper className="bg-pb-bg flex flex-col gap-8">
      {/* Header */}
      <div className="text-center pt-4">
        <p className="text-5xl mb-2">📦</p>
        <h1 className="text-3xl font-extrabold text-pb-dark">PalabraBox</h1>
        <p className="text-pb-text-light text-sm mt-1">Design System Preview</p>
      </div>

      {/* Button Variants */}
      <Card>
        <h2 className="text-xl font-bold text-pb-dark mb-4">Button Variants</h2>
        <div className="flex flex-col gap-3">
          <Button variant="primary">▶ JUGAR</Button>
          <Button variant="secondary">🃏 TARJETAS</Button>
          <Button variant="ghost">← Volver</Button>
          <Button variant="danger">Eliminar</Button>
        </div>
      </Card>

      {/* Button Sizes */}
      <Card>
        <h2 className="text-xl font-bold text-pb-dark mb-4">Button Sizes</h2>
        <div className="flex flex-col gap-3">
          <Button size="sm">Small</Button>
          <Button size="md">Medium (default)</Button>
          <Button size="lg">Large</Button>
        </div>
      </Card>

      {/* Disabled State */}
      <Card>
        <h2 className="text-xl font-bold text-pb-dark mb-4">Disabled State</h2>
        <div className="flex flex-col gap-3">
          <Button variant="primary" disabled>Disabled Primary</Button>
          <Button variant="secondary" disabled>Disabled Secondary</Button>
        </div>
      </Card>

      {/* Interactive Card */}
      <div>
        <h2 className="text-xl font-bold text-pb-dark mb-3">Interactive Card</h2>
        <Card interactive>
          <div className="flex items-center gap-3">
            <span className="text-3xl">🎨</span>
            <div>
              <p className="font-bold text-pb-dark">Colores en inglés</p>
              <p className="text-sm text-pb-text-light">Principiante · 10 preguntas</p>
            </div>
          </div>
        </Card>
      </div>

      {/* Static Card */}
      <div>
        <h2 className="text-xl font-bold text-pb-dark mb-3">Static Card</h2>
        <Card>
          <p className="font-semibold text-pb-dark">Progreso rápido</p>
          <p className="text-sm text-pb-text-light mt-1">Completado: 2 / 12</p>
        </Card>
      </div>

      {/* Color Swatch */}
      <Card>
        <h2 className="text-xl font-bold text-pb-dark mb-4">Color Palette</h2>
        <div className="grid grid-cols-4 gap-2">
          <div className="flex flex-col items-center gap-1">
            <div className="w-12 h-12 rounded-box bg-pb-dark" />
            <span className="text-xs text-pb-text-light">Dark</span>
          </div>
          <div className="flex flex-col items-center gap-1">
            <div className="w-12 h-12 rounded-box bg-pb-green" />
            <span className="text-xs text-pb-text-light">Green</span>
          </div>
          <div className="flex flex-col items-center gap-1">
            <div className="w-12 h-12 rounded-box bg-pb-emerald" />
            <span className="text-xs text-pb-text-light">Emerald</span>
          </div>
          <div className="flex flex-col items-center gap-1">
            <div className="w-12 h-12 rounded-box bg-pb-amber" />
            <span className="text-xs text-pb-text-light">Amber</span>
          </div>
          <div className="flex flex-col items-center gap-1">
            <div className="w-12 h-12 rounded-box bg-pb-success" />
            <span className="text-xs text-pb-text-light">Success</span>
          </div>
          <div className="flex flex-col items-center gap-1">
            <div className="w-12 h-12 rounded-box bg-pb-error" />
            <span className="text-xs text-pb-text-light">Error</span>
          </div>
          <div className="flex flex-col items-center gap-1">
            <div className="w-12 h-12 rounded-box bg-pb-bg border border-gray-200" />
            <span className="text-xs text-pb-text-light">BG</span>
          </div>
          <div className="flex flex-col items-center gap-1">
            <div className="w-12 h-12 rounded-box bg-white shadow-box" />
            <span className="text-xs text-pb-text-light">Surface</span>
          </div>
        </div>
      </Card>

      <div className="h-4" />
    </ScreenWrapper>
  )
}

export default App
