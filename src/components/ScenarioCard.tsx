import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faStar, faLock } from '@fortawesome/free-solid-svg-icons'
import type { ScenarioWithProgress } from '../hooks/useScenarios'
import { cn } from '../utils/cn'

interface Props {
  scenario: ScenarioWithProgress
  onClick: (scenario: ScenarioWithProgress) => void
}

export function ScenarioCard({ scenario, onClick }: Props) {
  const { title_display, emoji, stars, isLocked, description } = scenario

  return (
    <button
      onClick={() => !isLocked && onClick(scenario)}
      disabled={isLocked}
      className={cn(
        "w-full h-full relative flex flex-col items-center justify-center p-4 sm:p-5 rounded-2xl transition-all duration-200 text-center focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-pb-amber",
        isLocked 
          ? "bg-white/30 backdrop-blur-sm opacity-60 cursor-not-allowed" 
          : "bg-white/75 backdrop-blur-xl ring-1 ring-black/4 shadow-glass cursor-pointer hover:shadow-elevated hover:-translate-y-1 active:translate-y-0.5 active:shadow-soft group"
      )}
    >
      {/* Locked overlay */}
      {isLocked && (
        <div className="absolute inset-0 bg-pb-bg/30 backdrop-blur-[1px] flex items-center justify-center rounded-2xl z-10">
          <FontAwesomeIcon icon={faLock} className="text-3xl text-pb-text-light/40 drop-shadow-sm" />
        </div>
      )}

      {/* Stars */}
      <div className="flex items-center justify-center w-full absolute top-3 sm:top-4 z-20">
        <div className="flex gap-0.5">
          {[1, 2, 3].map((star) => (
            <FontAwesomeIcon 
              key={star}
              icon={faStar}
              className={cn(
                "text-sm sm:text-base transition-colors duration-300",
                !isLocked && star <= stars ? 'text-pb-amber' : 'text-black/6'
              )}
            />
          ))}
        </div>
      </div>

      <span className={cn(
        "text-5xl sm:text-6xl mb-2 sm:mb-3 mt-4 transition-transform duration-300 relative z-20",
        !isLocked && "group-hover:scale-110 group-hover:-rotate-6 drop-shadow-sm"
      )}>
        {isLocked ? "🔒" : emoji}
      </span>
      <h2 className="text-xs sm:text-sm font-black text-pb-dark leading-tight relative z-20 mt-1 line-clamp-2">{title_display}</h2>
      {description && <p className="text-[10px] sm:text-xs text-pb-text-light font-medium mt-1 relative z-20 px-1 line-clamp-2 hidden sm:block">{description}</p>}
    </button>
  )
}
