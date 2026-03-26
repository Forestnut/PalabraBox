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
        'max-w-lg mx-auto sm:px-6 px-5 py-6 h-dvh w-full flex flex-col',
        'overflow-x-hidden overflow-y-auto',
        'pb-[max(1.5rem,env(safe-area-inset-bottom))] pt-[max(1.5rem,env(safe-area-inset-top))]',
        className,
      )}
    >
      {children}
    </div>
  )
}
