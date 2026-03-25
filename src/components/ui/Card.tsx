import type { ReactNode } from 'react'
import { cn } from '../../utils/cn'

interface CardProps {
  children: ReactNode
  className?: string
  /** When true, card responds to hover (lift) and active (press). */
  interactive?: boolean
  /** Optional click handler for interactive cards */
  onClick?: () => void
}

export function Card({ children, className, interactive = false, onClick }: CardProps) {
  return (
    <div
      role={onClick ? 'button' : undefined}
      tabIndex={onClick ? 0 : undefined}
      onClick={onClick}
      className={cn(
        'bg-white/75 backdrop-blur-xl rounded-2xl p-6',
        'ring-1 ring-black/[0.04]',
        'shadow-glass',
        interactive &&
          'transition-all duration-200 ease-out cursor-pointer hover:shadow-elevated hover:-translate-y-0.5 active:translate-y-0.5 active:shadow-soft',
        className,
      )}
    >
      {children}
    </div>
  )
}
