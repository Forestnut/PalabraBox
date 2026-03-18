import type { ReactNode } from 'react'
import { cn } from '../../utils/cn'

interface CardProps {
  children: ReactNode
  className?: string
  /** When true, card responds to hover (lift) and active (press). */
  interactive?: boolean
}

export function Card({ children, className, interactive = false }: CardProps) {
  return (
    <div
      className={cn(
        'bg-white rounded-box-lg shadow-box p-6',
        interactive &&
          'transition-all duration-150 cursor-pointer hover:-translate-y-0.5 hover:shadow-box-hover active:translate-y-0.5 active:shadow-box-pressed',
        className,
      )}
    >
      {children}
    </div>
  )
}
