import { clsx, type ClassValue } from 'clsx'
import { twMerge } from 'tailwind-merge'

/**
 * Utility for conditionally joining class names.
 * Consolidates Tailwind classes efficiently using tailwind-merge and clsx.
 *
 * Usage:
 *   cn('base-class', isActive && 'active', isDisabled && 'opacity-50')
 */
export function cn(...inputs: ClassValue[]): string {
  return twMerge(clsx(inputs))
}
