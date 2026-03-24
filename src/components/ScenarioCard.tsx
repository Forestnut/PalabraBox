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
        "relative flex flex-col items-center justify-center p-4 sm:p-6 border-4 rounded-3xl transition-all duration-300 aspect-square text-center focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-pb-amber",
        isLocked 
          ? "bg-pb-bg/50 border-pb-bg opacity-75 grayscale cursor-not-allowed" 
          : "bg-white border-pb-bg shadow-box cursor-pointer hover:border-pb-amber hover:-translate-y-1 hover:shadow-box-hover active:translate-y-1 active:shadow-box-pressed group"
      )}
    >
      {/* If locked, display big transparent mask overlay */}
      {isLocked && (
        <div className="absolute inset-0 bg-pb-bg/30 rounded-2xl z-10 backdrop-blur-[1px]"></div>
      )}

      {/* Stars Header */}
      <div className="flex items-center justify-center w-full absolute top-3 sm:top-4 z-20">
        <div className="flex gap-1">
          {[1, 2, 3].map((star) => (
            <span 
              key={star} 
              className={cn("text-lg sm:text-xl drop-shadow-sm", !isLocked && star <= stars ? 'text-pb-amber' : 'text-pb-bg drop-shadow-none')}
            >
              ★
            </span>
          ))}
        </div>
      </div>

      <span className={cn(
        "text-5xl sm:text-6xl mb-2 sm:mb-3 mt-4 transition-transform duration-300 relative z-20",
        !isLocked && "group-hover:scale-110 group-hover:-rotate-6 drop-shadow-sm"
      )}>
        {isLocked ? "🔒" : emoji}
      </span>
      <h2 className="text-base sm:text-lg font-black text-pb-dark leading-tight relative z-20">{title_display}</h2>
      {description && <p className="text-[10px] sm:text-xs text-pb-text-light font-bold mt-1 line-clamp-2 relative z-20">{description}</p>}
    </button>
  )
}
