import { useState } from 'react'
import type { ButtonHTMLAttributes, ReactNode } from 'react'
import { cn } from '../../utils/cn'

type ButtonVariant = 'primary' | 'secondary' | 'ghost' | 'danger'
type ButtonSize = 'sm' | 'md' | 'lg'

interface ButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: ButtonVariant
  size?: ButtonSize
  children: ReactNode
}

const variantStyles: Record<ButtonVariant, string> = {
  primary:
    'bg-pb-amber text-white shadow-box hover:shadow-box-hover active:shadow-box-pressed',
  secondary:
    'bg-pb-emerald text-white shadow-box hover:shadow-box-hover active:shadow-box-pressed',
  ghost:
    'bg-transparent text-pb-dark hover:bg-white/60 hover:shadow-box active:shadow-box-pressed',
  danger:
    'bg-pb-error text-white shadow-box hover:shadow-box-hover active:shadow-box-pressed',
}

const sizeStyles: Record<ButtonSize, string> = {
  sm: 'py-2 px-4 text-sm',
  md: 'py-3 px-6 text-base',
  lg: 'py-4 px-8 text-lg',
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
      setTimeout(() => {
        setIsClickLocked(false)
      }, 300)
    }
  }

  return (
    <button
      className={cn(
        'inline-flex items-center justify-center gap-2',
        'font-bold rounded-box',
        'transition-all duration-150 cursor-pointer select-none',
        'hover:-translate-y-0.5 active:translate-y-0.5',
        'focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-pb-amber',
        variantStyles[variant],
        sizeStyles[size],
        (disabled || isClickLocked) && 'opacity-50 pointer-events-none grayscale',
        className,
      )}
      disabled={disabled || isClickLocked}
      onClick={handleClick}
      {...props}
    >
      {children}
    </button>
  )
}
