import { useState } from 'react'
import type { ButtonHTMLAttributes, ReactNode } from 'react'
import { cn } from '../../utils/cn'
import { audioService } from '../../services/audioService'

type ButtonVariant = 'primary' | 'secondary' | 'ghost' | 'danger'
type ButtonSize = 'sm' | 'md' | 'lg'

interface ButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: ButtonVariant
  size?: ButtonSize
  children: ReactNode
}

const variantStyles: Record<ButtonVariant, string> = {
  primary: [
    'bg-gradient-to-b from-[#FFB347] to-pb-amber text-white',
    'shadow-[0_4px_0_0_#c97a1a,0_6px_16px_-2px_rgba(255,164,44,0.35)]',
    'hover:shadow-[0_5px_0_0_#c97a1a,0_8px_20px_-2px_rgba(255,164,44,0.4)]',
    'active:shadow-[0_1px_0_0_#c97a1a,0_2px_4px_rgba(255,164,44,0.2)] active:translate-y-[3px]',
  ].join(' '),
  secondary: [
    'bg-gradient-to-b from-[#0a8a5e] to-pb-emerald text-white',
    'shadow-[0_4px_0_0_#035c3a,0_6px_16px_-2px_rgba(4,114,77,0.3)]',
    'hover:shadow-[0_5px_0_0_#035c3a,0_8px_20px_-2px_rgba(4,114,77,0.35)]',
    'active:shadow-[0_1px_0_0_#035c3a,0_2px_4px_rgba(4,114,77,0.2)] active:translate-y-[3px]',
  ].join(' '),
  ghost: [
    'bg-white/50 text-pb-dark',
    'shadow-soft',
    'hover:bg-white/80 hover:shadow-glass',
    'active:bg-white/60 active:translate-y-[1px]',
  ].join(' '),
  danger: [
    'bg-gradient-to-b from-[#f87171] to-pb-error text-white',
    'shadow-[0_4px_0_0_#b91c1c,0_6px_16px_-2px_rgba(239,68,68,0.3)]',
    'hover:shadow-[0_5px_0_0_#b91c1c,0_8px_20px_-2px_rgba(239,68,68,0.35)]',
    'active:shadow-[0_1px_0_0_#b91c1c,0_2px_4px_rgba(239,68,68,0.2)] active:translate-y-[3px]',
  ].join(' '),
}

const sizeStyles: Record<ButtonSize, string> = {
  sm: 'py-2.5 px-4 text-sm rounded-xl',
  md: 'py-3 px-6 text-base rounded-2xl',
  lg: 'py-4 px-8 text-lg rounded-2xl',
}

export function Button({
  variant = 'primary',
  size = 'md',
  children,
  className,
  disabled,
  onClick,
  ...props
}: ButtonProps) {
  const [isClickLocked, setIsClickLocked] = useState(false)

  const handleClick = async (e: React.MouseEvent<HTMLButtonElement>) => {
    if (disabled || isClickLocked) {
      e.preventDefault()
      return
    }
    
    setIsClickLocked(true)
    
    try {
      await onClick?.(e)
    } finally {
      // Release lock safely without an artificial 300ms blockage layer
      // This empowers power users by prioritizing function resolution timing.
      setIsClickLocked(false)
        variantStyles[variant],
        sizeStyles[size],
        (disabled || isClickLocked) && 'opacity-50 pointer-events-none grayscale',
        className,
      )}
      disabled={disabled || isClickLocked}
      onClick={(e) => {
        audioService.play('click')
        return handleClick(e)
      }}
      {...props}
    >
      {children}
    </button>
  )
}
