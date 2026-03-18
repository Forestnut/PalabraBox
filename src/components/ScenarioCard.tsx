import type { ScenarioWithProgress } from '../hooks/useScenarios'

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
      className={`
        relative w-full p-4 rounded-box text-left transition-all duration-150 select-none
        ${
          isLocked
            ? 'bg-gray-200 text-gray-500 cursor-not-allowed opacity-80'
            : 'bg-white shadow-box hover:-translate-y-0.5 active:translate-y-0.5 hover:shadow-box-hover active:shadow-box-pressed focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-pb-amber'
        }
      `}
    >
      <div className="flex items-center justify-between mb-2">
        <span className="text-4xl">{isLocked ? '🔒' : emoji}</span>
        <div className="flex gap-1">
          {[1, 2, 3].map((star) => (
            <span
              key={star}
              className={`text-xl ${!isLocked && star <= stars ? 'text-pb-amber' : 'text-gray-300'}`}
            >
              ★
            </span>
          ))}
        </div>
      </div>
      
      <h3 className="font-bold text-lg mb-1">{title_display}</h3>
      {description && <p className="text-sm opacity-80">{description}</p>}
    </button>
  )
}
