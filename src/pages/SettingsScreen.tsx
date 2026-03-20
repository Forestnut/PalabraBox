import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { BackButton } from '../components/layout/BackButton'
import { Card } from '../components/ui/Card'
import { useSettingsStore } from '../store/settingsStore'
import { cn } from '../utils/cn'

interface RangeSliderProps {
  label: string
  value: number
  onChange: (val: number) => void
  icon?: string
}

function RangeSlider({ label, value, onChange, icon }: RangeSliderProps) {
  return (
    <div className="flex flex-col gap-3 w-full">
      <div className="flex justify-between items-center text-pb-text-light font-bold text-xs uppercase tracking-wider">
        <span className="flex items-center gap-2">
          {icon && <span className="text-lg">{icon}</span>}
          {label}
        </span>
        <span className="text-pb-amber">{Math.round(value * 100)}%</span>
      </div>
      <input
        type="range"
        min={0}
        max={1}
        step={0.05}
        value={value}
        onChange={(e) => onChange(parseFloat(e.target.value))}
        className="w-full h-4 bg-pb-amber/20 rounded-full appearance-none outline-none cursor-pointer
          [&::-webkit-slider-thumb]:appearance-none [&::-webkit-slider-thumb]:w-7 [&::-webkit-slider-thumb]:h-7
          [&::-webkit-slider-thumb]:bg-pb-amber [&::-webkit-slider-thumb]:rounded-full [&::-webkit-slider-thumb]:shadow-md
          [&::-webkit-slider-thumb]:active:scale-95 [&::-webkit-slider-thumb]:transition-transform
          [&::-moz-range-thumb]:w-7 [&::-moz-range-thumb]:h-7 [&::-moz-range-thumb]:bg-pb-amber
          [&::-moz-range-thumb]:rounded-full [&::-moz-range-thumb]:border-none [&::-moz-range-thumb]:shadow-md"
      />
    </div>
  )
}

export default function SettingsScreen() {
  const { volume, speechSpeed, setSoundVolume, setTtsVolume, setSpeechSpeed } = useSettingsStore()

  const speeds = [0.5, 0.75, 1, 1.25, 1.5]

  return (
    <PageTransition>
      <ScreenWrapper className="flex flex-col gap-6 py-6 pb-12">
        <div className="flex items-center gap-4 mb-2">
          <BackButton fallbackUrl="/menu" />
          <h1 className="text-3xl font-black text-pb-dark tracking-wide uppercase">Opciones</h1>
        </div>

        <Card className="p-6 flex flex-col gap-6">
          <h2 className="text-lg font-bold text-pb-dark mb-2">Sonido y Audio</h2>
          
          <RangeSlider
            label="Efectos de Sonido"
            value={volume.sound}
            onChange={setSoundVolume}
            icon="🔔"
          />

          <hr className="border-t-2 border-pb-bg" />

          <RangeSlider
            label="Voz del Lector (TTS)"
            value={volume.tts}
            onChange={setTtsVolume}
            icon="🗣️"
          />
        </Card>

        <Card className="p-6 flex flex-col gap-4">
          <div className="flex items-center gap-2 text-pb-text-light font-bold text-xs uppercase tracking-wider">
            <span className="text-lg">⚡</span> Velocidad del Lector
          </div>
          
          <div className="grid grid-cols-5 gap-2 mt-2">
            {speeds.map((s) => (
              <button
                key={s}
                onClick={() => setSpeechSpeed(s)}
                className={cn(
                  "py-3 rounded-xl font-black text-xs sm:text-sm transition-all focus:outline-none",
                  speechSpeed === s
                    ? "bg-pb-amber text-white shadow-inner scale-105"
                    : "bg-pb-bg text-pb-text-light hover:bg-pb-amber/20 active:scale-95"
                )}
              >
                {s}x
              </button>
            ))}
          </div>
        </Card>

        {/* Info & Credits */}
        <div className="mt-auto pt-8 flex flex-col items-center justify-center text-center gap-2 opacity-70">
          <img src="/BoxLogo.svg" alt="PalabraBox Logo" className="w-16 h-16 grayscale opacity-60 mb-2" />
          <p className="font-bold text-pb-dark text-lg">PalabraBox <span className="text-sm font-normal text-pb-text-light">v1.0.0</span></p>
          <p className="text-xs text-pb-text-light font-medium max-w-50">
            Diseñado y desarrollado por <br/><span className="text-pb-amber font-bold">Jakub</span> & <span className="text-pb-amber font-bold">Błażej</span>
          </p>
        </div>
      </ScreenWrapper>
    </PageTransition>
  )
}
