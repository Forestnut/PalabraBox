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
        'bg-white rounded-3xl border-2 border-slate-200 border-b-4 p-6',
        interactive &&
          'transition-all duration-150 cursor-pointer hover:bg-slate-50 active:translate-y-1 active:border-b-2',
        className,
      )}
    >
      {children}
    </div>
  )
}
