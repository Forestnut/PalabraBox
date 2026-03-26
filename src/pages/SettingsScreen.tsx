import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faBell, faCommentDots, faBolt, faGlobe } from '@fortawesome/free-solid-svg-icons'
import { PageTransition } from '../components/layout/PageTransition'
import { ScreenWrapper } from '../components/layout/ScreenWrapper'
import { BackButton } from '../components/layout/BackButton'
import { Card } from '../components/ui/Card'
import { useSettingsStore } from '../store/settingsStore'
import { Mascot } from '../components/ui/Mascot'
import { cn } from '../utils/cn'

interface RangeSliderProps {
  label: string
  value: number
  onChange: (val: number) => void
  icon: typeof faBell
}

function RangeSlider({ label, value, onChange, icon }: RangeSliderProps) {
  return (
    <div className="flex flex-col gap-3 w-full">
      <div className="flex justify-between items-center">
        <span className="flex items-center gap-2 text-pb-text-light font-bold text-xs uppercase tracking-wider">
          <FontAwesomeIcon icon={icon} className="text-sm text-pb-dark/40" />
          {label}
        </span>
        <span className="text-pb-amber font-bold text-sm tabular-nums">{Math.round(value * 100)}%</span>
      </div>
      <input
        type="range"
        min={0}
        max={1}
        step={0.05}
        value={value}
        onChange={(e) => onChange(parseFloat(e.target.value))}
        className="w-full"
      />
    </div>
  )
}

export default function SettingsScreen() {
  const { volume, speechSpeed, setSoundVolume, setTtsVolume, setSpeechSpeed } = useSettingsStore()

  const speeds = [0.5, 0.75, 1, 1.25, 1.5]

  return (
    <PageTransition>
      <ScreenWrapper className="flex flex-col gap-5 py-6 pb-12">
        <div className="flex items-center gap-4 mb-1">
          <BackButton fallbackUrl="/menu" />
          <h1 className="text-2xl font-black text-pb-dark tracking-tight">Opciones</h1>
        </div>

        <Card className="flex flex-col gap-5">
          <h2 className="text-sm font-bold text-pb-text-light uppercase tracking-wider">Sonido y Audio</h2>
          
          <RangeSlider
            label="Efectos de Sonido"
            value={volume.sound}
            onChange={setSoundVolume}
            icon={faBell}
          />

          <div className="h-px bg-black/4" />

          <RangeSlider
            label="Voz del Lector (TTS)"
            value={volume.tts}
            onChange={setTtsVolume}
            icon={faCommentDots}
          />
        </Card>

        <Card className="flex flex-col gap-4">
          <div className="flex items-center gap-2 text-pb-text-light font-bold text-xs uppercase tracking-wider">
            <FontAwesomeIcon icon={faBolt} className="text-sm text-pb-dark/40" />
            Velocidad del Lector
          </div>
          
          <div className="grid grid-cols-5 gap-2 mt-1">
            {speeds.map((s) => (
              <button
                key={s}
                onClick={() => setSpeechSpeed(s)}
                className={cn(
                  "py-3 rounded-xl font-black text-xs sm:text-sm transition-all duration-200 focus:outline-none cursor-pointer",
                  speechSpeed === s
                    ? "bg-linear-to-b from-[#FFB347] to-pb-amber text-white shadow-[0_3px_0_0_#c97a1a] scale-105"
                    : "bg-white/60 text-pb-text-light ring-1 ring-black/4 hover:bg-white active:scale-95"
                )}
              >
                {s}x
              </button>
            ))}
          </div>
        </Card>

        <Card className="flex flex-col gap-4">
          <div className="flex items-center gap-2 text-pb-text-light font-bold text-xs uppercase tracking-wider">
            <FontAwesomeIcon icon={faGlobe} className="text-sm text-pb-dark/40" />
            Idioma de la Aplicación
          </div>
          
          <div className="grid grid-cols-2 gap-2 mt-1">
            <button
              className="py-3 rounded-xl font-black text-xs sm:text-sm transition-all focus:outline-none bg-linear-to-b from-[#FFB347] to-pb-amber text-white shadow-[0_3px_0_0_#c97a1a] scale-105"
            >
              🇪🇸 Español
            </button>
            <button
              disabled
              className="py-3 rounded-xl font-black text-xs sm:text-sm transition-all focus:outline-none bg-white/40 text-pb-text-light opacity-50 cursor-not-allowed"
            >
              🇵🇱 Polaco (Próximamente)
            </button>
          </div>
        </Card>

        {/* Credits */}
        <div className="mt-auto pt-8 flex flex-col items-center justify-center text-center gap-2 opacity-60">
          <Mascot mood="idle" size="sm" className="mb-1" />
          <p className="font-bold text-pb-dark text-sm">
            PalabraBox <span className="text-xs font-normal text-pb-text-light">v1.0.0</span>
          </p>
          <p className="text-[11px] text-pb-text-light font-medium max-w-52 leading-relaxed">
            Diseñado y desarrollado por <br/>
            <span className="text-pb-amber font-bold">Jakub Laskowski</span> & <span className="text-pb-amber font-bold">Błażej Goliszek</span>
          </p>
        </div>
      </ScreenWrapper>
    </PageTransition>
  )
}
