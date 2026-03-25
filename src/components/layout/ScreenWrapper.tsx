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
        'max-w-lg mx-auto px-5 py-8 min-h-dvh flex flex-col',
        'md:max-w-xl md:px-6',
        'pb-[max(2rem,env(safe-area-inset-bottom))]',
        className,
      )}
    >
      {children}
    </div>
  )
}
