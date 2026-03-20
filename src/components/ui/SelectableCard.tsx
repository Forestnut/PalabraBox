import type { ReactNode } from 'react'
import { cn } from '../../utils/cn'
import { Card } from './Card'

interface SelectableCardProps {
  /** Main label (e.g. language name) */
  title: string
  /** Optional secondary text or description */
  description?: string
  /** Large visual icon / emoji */
  icon?: ReactNode
  /** Whether this option is currently selected */
  selected?: boolean
  /** Click handler */
  onClick?: () => void
  /** Optional additional classNames */
  className?: string
}

export function SelectableCard({
  title,
  description,
  icon,
  selected = false,
  onClick,
  className,
}: SelectableCardProps) {
  return (
    <div
      role={onClick ? 'button' : undefined}
      tabIndex={onClick ? 0 : undefined}
      onClick={onClick}
      onKeyDown={(event) => {
        if (onClick && (event.key === 'Enter' || event.key === ' ')) {
          event.preventDefault()
          onClick()
        }
      }}
      className={cn(
        'focus-visible:outline focus-visible:outline-2 focus-visible:outline-pb-amber',
        onClick && 'cursor-pointer',
      )}
    >
      <Card
        interactive
        className={cn(
          'flex flex-col items-start gap-3',
          selected && 'border-pb-emerald bg-emerald-50/50',
          className,
        )}
      >
        <div className="flex items-center justify-between w-full">
          <div className="flex items-center gap-3">
            {icon && <div className="text-3xl">{icon}</div>}
            <h3 className="text-lg font-bold">{title}</h3>
          </div>
          {selected && <span className="text-pb-emerald font-bold">✓</span>}
        </div>
        {description && <p className="text-sm text-pb-text-light">{description}</p>}
      </Card>
    </div>
  )
}
