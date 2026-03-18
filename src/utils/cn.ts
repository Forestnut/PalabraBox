/**
 * Utility for conditionally joining class names.
 * Filters out falsy values and joins the rest with spaces.
 *
 * Usage:
 *   cn('base-class', isActive && 'active', isDisabled && 'opacity-50')
 */
export function cn(...inputs: (string | false | null | undefined)[]): string {
  return inputs.filter(Boolean).join(' ')
}
