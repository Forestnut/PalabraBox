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
        "relative flex flex-col items-center justify-center p-4 sm:p-5 border-4 rounded-2xl transition-all duration-300 min-h-40 sm:min-h-45 text-center focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-pb-amber",
        isLocked 
          ? "bg-pb-bg/50 border-pb-bg opacity-75 grayscale cursor-not-allowed" 
          : "bg-white border-pb-bg shadow-box cursor-pointer hover:border-pb-amber hover:-translate-y-1 hover:shadow-box-hover active:translate-y-1 active:shadow-box-pressed group"
      )}
    >
      {/* If locked, display big transparent padlock overlay */}
      {isLocked && (
        <div className="absolute inset-0 flex items-center justify-center bg-white/50 rounded-2xl z-10">
          <span className="text-6xl">🔒</span>
        </div>
      )}

      {/* Stars Header */}
      <div className="flex items-center justify-center w-full absolute top-3 sm:top-4 z-20">
        <div className="flex gap-1">
          {[1, 2, 3].map((star) => (
            <span 
              key={star} 
              className={cn("text-lg sm:text-xl", !isLocked && star <= stars ? 'text-pb-amber' : 'text-pb-bg')}
            >
              ★
            </span>
          ))}
        </div>
      </div>

      <span className={cn(
        "text-5xl sm:text-6xl mb-1 sm:mb-3 mt-4 transition-transform duration-300",
        !isLocked && "group-hover:scale-110 group-hover:-rotate-6"
      )}>
        {emoji}
      </span>
      <h2 className="text-xs sm:text-lg font-black text-pb-dark leading-tight relative z-20 mt-1 line-clamp-2">{title_display}</h2>
      {description && <p className="text-[10px] sm:text-xs text-pb-text-light font-bold mt-1 relative z-20 px-1 line-clamp-2 hidden sm:block">{description}</p>}
    </button>
  )
}
