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
        "relative flex items-center gap-2 sm:gap-2.5 bg-white border-2 border-b-4 border-slate-200 px-3.5 py-2.5 sm:px-5 sm:py-3.5 rounded-[1rem] sm:rounded-2xl cursor-grab transition-all hover:bg-slate-50 active:border-b-2 active:translate-y-0.5 active:cursor-grabbing select-none hover:shadow-sm max-w-[95vw]",
        isDragging && "opacity-80 border-dashed border-b-2 translate-y-0.5 scale-105 z-50 shadow-md cursor-grabbing bg-slate-50",
        className
      )}
      {...props}
    >
      <span className="text-slate-300 text-lg sm:text-xl leading-none shrink-0 mt-0.5" aria-hidden="true">⋮</span>
      <span 
        className="text-[15px] sm:text-[17px] font-bold text-slate-700 text-center leading-tight whitespace-normal flex-1" 
        style={{ wordBreak: 'break-word', hyphens: 'auto' }}
      >
        {word}
      </span>
    </div>
  )
}
