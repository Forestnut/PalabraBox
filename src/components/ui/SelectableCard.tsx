import { motion, HTMLMotionProps } from 'framer-motion'
import { cn } from '../../utils/cn'

interface SelectableCardProps extends HTMLMotionProps<"button"> {
  selected?: boolean
  correct?: boolean | null
  children: React.ReactNode
}

export function SelectableCard({
  selected,
  correct,
  children,
  className,
  ...props
}: SelectableCardProps) {
  const getStyle = () => {
    if (correct === true) return 'bg-green-100 border-green-500 shadow-[0_4px_0_0_rgba(34,197,94,1)] text-green-900'
    if (correct === false && selected) return 'bg-red-100 border-red-500 shadow-[0_4px_0_0_rgba(239,68,68,1)] text-red-900'
    if (selected) return 'bg-blue-50 border-blue-500 shadow-[0_4px_0_0_rgba(59,130,246,1)] text-blue-900'
    return 'bg-white border-slate-200 shadow-[0_4px_0_0_rgba(203,213,225,1)] hover:bg-slate-50 text-pb-dark'
  }

  return (
    <motion.button
      whileHover={{ scale: 1.02 }}
      whileTap={{ scale: 0.98, y: 2, boxShadow: "0 0px 0 0 rgba(0,0,0,0)" }}
      className={cn(
        'w-full p-4 rounded-2xl border-2 font-bold text-lg transition-colors cursor-pointer disabled:cursor-default',
        getStyle(),
        className,
      )}
      {...props}
    >
      {children}
    </motion.button>
  )
}
