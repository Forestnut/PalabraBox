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
        "relative flex items-center gap-2 bg-white border-2 border-b-4 border-slate-200 px-4 py-3 rounded-2xl cursor-grab transition-all hover:bg-slate-50 active:border-b-2 active:translate-y-0.5 active:cursor-grabbing select-none",
        isDragging && "opacity-50 border-dashed border-b-2 translate-y-0.5 scale-105 z-50",
        className
      )}
      {...props}
    >
      <span className="text-pb-text-light/50 text-xl leading-none">⋮</span>
      <span className="text-lg font-bold text-pb-dark">{word}</span>
    </div>
  )
}
