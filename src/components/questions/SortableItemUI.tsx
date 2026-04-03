import { cn } from '../../utils/cn'

interface SortableItemUIProps extends React.HTMLAttributes<HTMLDivElement> {
  word: string
  isDragging?: boolean
}

export function SortableItemUI({ word, isDragging, className, ...props }: SortableItemUIProps) {
  return (
    <div
      style={{ touchAction: 'none' }}
      className={cn(
        "relative flex items-center justify-center bg-white border-2 border-b-4 border-slate-200 px-4 py-2.5 sm:px-5 sm:py-3.5 rounded-xl sm:rounded-2xl cursor-grab active:cursor-grabbing transition-colors hover:bg-slate-50 active:border-b-2 active:translate-y-0.5 select-none hover:shadow-sm",
        isDragging && "opacity-90 border-solid border-b-2 translate-y-0.5 scale-105 z-50 shadow-md bg-slate-50",
        className
      )}
      {...props}
    >
      <span 
        className="text-[16px] sm:text-[18px] font-bold text-slate-700 text-center leading-tight max-w-[80vw] wrap-break-word"
      >
        {word}
      </span>
    </div>
  )
}
