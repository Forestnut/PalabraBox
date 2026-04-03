import type { ReactNode } from 'react'
import { cn } from '../../utils/cn'

interface ScreenWrapperProps {
  children: ReactNode
  className?: string
}

export function ScreenWrapper({ children, className }: ScreenWrapperProps) {
  return (
    <div className="w-full h-dvh overflow-x-hidden overflow-y-auto no-scrollbar flex flex-col relative">
      <div
        className={cn(
          'max-w-lg mx-auto sm:px-6 px-5 py-6 w-full flex flex-col flex-1',
          'pb-[max(1.5rem,env(safe-area-inset-bottom))] pt-[max(1.5rem,env(safe-area-inset-top))]',
          className,
        )}
      >
        {children}
      </div>
    </div>
  )
}
