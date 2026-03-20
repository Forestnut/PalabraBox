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
        "relative flex items-center gap-2 bg-white border-2 border-pb-bg px-4 py-3 rounded-xl shadow-box cursor-grab transition-colors hover:border-pb-amber active:cursor-grabbing select-none hover:-translate-y-0.5 active:translate-y-0.5",
        isDragging && "opacity-50 border-dashed shadow-none scale-105 z-50",
        className
      )}
      {...props}
    >
      <span className="text-pb-text-light/50 text-xl leading-none">⋮</span>
      <span className="text-lg font-bold text-pb-dark">{word}</span>
    </div>
  )
}
