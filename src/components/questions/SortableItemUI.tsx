import { useSortable } from '@dnd-kit/sortable'
import { CSS } from '@dnd-kit/utilities'
import { cn } from '../../utils/cn'
import type { ReactNode } from 'react'

interface SortableItemUIProps {
  id: string
  disabled?: boolean
  children: ReactNode
}

export function SortableItemUI({ id, disabled = false, children }: SortableItemUIProps) {
  const {
    attributes,
    listeners,
    setNodeRef,
    transform,
    transition,
    isDragging,
  } = useSortable({ id })

  const style = {
    transform: CSS.Transform.toString(transform),
    transition,
    zIndex: isDragging ? 20 : undefined,
  }

  return (
    <div
      ref={setNodeRef}
      style={style}
      {...attributes}
      {...listeners}
      className={cn(
        'rounded-xl px-5 py-3 font-bold text-sm sm:text-base text-center select-none',
        'transition-shadow duration-200',
        isDragging
          ? 'opacity-40 shadow-none'
          : disabled
            ? 'bg-white/60 text-pb-text-light cursor-not-allowed'
            : 'bg-white/75 backdrop-blur-xl ring-1 ring-black/4 shadow-glass cursor-grab active:cursor-grabbing active:shadow-elevated',
      )}
    >
      {children}
    </div>
  )
}
