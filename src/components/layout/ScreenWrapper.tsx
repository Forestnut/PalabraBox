import type { ReactNode } from 'react'
import { cn } from '../../utils/cn'

interface ScreenWrapperProps {
  children: ReactNode
  className?: string
}

export function ScreenWrapper({ children, className }: ScreenWrapperProps) {
  return (
    <div
      className={cn(
        'max-w-lg mx-auto px-4 py-6 min-h-screen',
        className,
      )}
    >
      {children}
    </div>
  )
}
