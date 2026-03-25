import type { ReactNode } from 'react'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faCircleCheck } from '@fortawesome/free-solid-svg-icons'
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
        'focus-visible:outline-2 focus-visible:outline-pb-amber rounded-2xl',
        onClick && 'cursor-pointer',
      )}
    >
      <Card
        interactive
        className={cn(
          'flex flex-col items-start gap-3',
          selected && 'ring-2 ring-pb-emerald/60 bg-emerald-50/40',
          !selected && 'ring-1 ring-black/4',
          className,
        )}
      >
        <div className="flex items-center justify-between w-full">
          <div className="flex items-center gap-3">
            {icon && <div className="text-3xl">{icon}</div>}
            <h3 className="text-lg font-bold">{title}</h3>
          </div>
          {selected && (
            <FontAwesomeIcon
              icon={faCircleCheck}
              className="text-pb-emerald text-xl"
            />
          )}
        </div>
        {description && <p className="text-sm text-pb-text-light leading-relaxed">{description}</p>}
      </Card>
    </div>
  )
}
