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

/**
 * Reusable labeled slider used for audio-related preference controls.
 */
function RangeSlider({ label, value, onChange, icon }: RangeSliderProps) {
  return (
    <div className="flex flex-col gap-3 w-full">
      <div className="flex justify-between items-center">
        <span className="flex items-center gap-2 text-pb-text-light font-bold text-xs uppercase tracking-wider">
          <FontAwesomeIcon icon={icon} className="text-sm text-pb-dark/40" />
          {label}
        </span>
        <span className="text-pb-amber font-bold text-sm tabular-nums">
          {Math.round(value * 100)}%
        </span>
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
          <h2 className="text-sm font-bold text-pb-text-light uppercase tracking-wider">
            Sonido y Audio
          </h2>

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
                  'py-3 rounded-xl font-black text-xs sm:text-sm transition-all duration-200 focus:outline-none cursor-pointer',
                  speechSpeed === s
                    ? 'bg-linear-to-b from-[#FFB347] to-pb-amber text-white shadow-[0_3px_0_0_#c97a1a] scale-105'
                    : 'bg-white/60 text-pb-text-light ring-1 ring-black/4 hover:bg-white active:scale-95',
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
            <button className="py-3 px-2 flex items-center justify-center gap-2 rounded-xl font-black text-xs sm:text-sm transition-all focus:outline-none bg-linear-to-b from-[#FFB347] to-pb-amber text-white shadow-[0_3px_0_0_#c97a1a] scale-105">
              <img
                src="https://flagcdn.com/es.svg"
                alt="Español"
                className="w-5 h-5 rounded-sm object-cover"
                loading="lazy"
              />
              Español
            </button>
            <button
              disabled
              className="py-3 px-2 flex items-center justify-center gap-2 rounded-xl font-black text-xs sm:text-sm transition-all focus:outline-none bg-white/40 text-pb-text-light opacity-50 cursor-not-allowed"
            >
              <img
                src="https://flagcdn.com/pl.svg"
                alt="Polaco"
                className="w-5 h-5 rounded-sm object-cover"
                loading="lazy"
              />
              Polaco
            </button>
          </div>
        </Card>

        {/* Acerca de */}
        <Card className="flex flex-col gap-4">
          <h2 className="text-sm font-bold text-pb-text-light uppercase tracking-wider">
            Acerca de
          </h2>

          <div className="flex flex-col items-center gap-3 py-1">
            <a
              href="https://www.asociacionarrabal.org"
              target="_blank"
              rel="noopener noreferrer"
              aria-label="Asociación Arrabal"
              className="opacity-80 hover:opacity-100 transition-opacity duration-200"
            >
              <img
                src="/ArrabalLogo.png"
                alt="Asociación Arrabal"
                className="h-10 w-auto object-contain"
                loading="lazy"
              />
            </a>
            <p className="text-xs text-pb-text-light font-semibold text-center">
              Asociación Arrabal
            </p>
          </div>

          <div className="h-px bg-black/4" />

          <div className="flex flex-col gap-1.5">
            <p className="text-[11px] text-pb-text-light font-bold uppercase tracking-wider mb-1">
              Autores
            </p>
            <div className="flex flex-col gap-2">
              <a
                href="https://www.linkedin.com/in/blazejgoliszek/"
                target="_blank"
                rel="noopener noreferrer"
                className="flex items-center gap-2 text-sm font-bold text-pb-dark hover:text-pb-amber transition-colors duration-200"
              >
                <div className="w-6 h-6 flex items-center justify-center shrink-0 text-[#0A66C2]">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 448 512"
                    className="w-full h-full"
                    fill="currentColor"
                  >
                    <path d="M100.28 448H7.4V148.9h92.88zM53.79 108.1C24.09 108.1 0 83.5 0 53.8a53.79 53.79 0 0 1 107.58 0c0 29.7-24.1 54.3-53.79 54.3zM447.9 448h-92.68V302.4c0-34.7-.7-79.2-48.29-79.2-48.29 0-55.69 37.7-55.69 76.7V448h-92.78V148.9h89.08v40.8h1.3c12.4-23.5 42.69-48.3 87.88-48.3 94 0 111.28 61.9 111.28 142.3V448z" />
                  </svg>
                </div>
                Błażej Goliszek
              </a>
              <a
                href="https://www.linkedin.com/in/jakub-laskowski-dev/"
                target="_blank"
                rel="noopener noreferrer"
                className="flex items-center gap-2 text-sm font-bold text-pb-dark hover:text-pb-amber transition-colors duration-200"
              >
                <div className="w-6 h-6 flex items-center justify-center shrink-0 text-[#0A66C2]">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 448 512"
                    className="w-full h-full"
                    fill="currentColor"
                  >
                    <path d="M100.28 448H7.4V148.9h92.88zM53.79 108.1C24.09 108.1 0 83.5 0 53.8a53.79 53.79 0 0 1 107.58 0c0 29.7-24.1 54.3-53.79 54.3zM447.9 448h-92.68V302.4c0-34.7-.7-79.2-48.29-79.2-48.29 0-55.69 37.7-55.69 76.7V448h-92.78V148.9h89.08v40.8h1.3c12.4-23.5 42.69-48.3 87.88-48.3 94 0 111.28 61.9 111.28 142.3V448z" />
                  </svg>
                </div>
                Jakub Laskowski
              </a>
            </div>
          </div>
        </Card>

        {/* Version footer */}
        <div className="mt-auto pt-2 flex items-center justify-center gap-1.5 opacity-40">
          <Mascot mood="idle" size="sm" />
          <span className="font-bold text-pb-dark text-xs">
            PalabraBox <span className="font-normal text-pb-text-light">v1.0.0</span>
          </span>
        </div>
      </ScreenWrapper>
    </PageTransition>
  )
}
