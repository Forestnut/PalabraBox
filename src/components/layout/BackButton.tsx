import { useNavigate } from 'react-router-dom'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faChevronLeft } from '@fortawesome/free-solid-svg-icons'

interface BackButtonProps {
  label?: string
  fallbackUrl?: string
}

export function BackButton({ label, fallbackUrl }: BackButtonProps) {
  const navigate = useNavigate()

  return (
    <button
      onClick={() => navigate(fallbackUrl || '/menu')}
      className="w-11 h-11 rounded-full flex items-center justify-center bg-white/60 backdrop-blur-lg text-pb-dark shadow-soft ring-1 ring-black/[0.04] hover:bg-white/90 hover:shadow-glass active:scale-95 transition-all duration-200 cursor-pointer"
      aria-label={label || 'Volver'}
    >
      <FontAwesomeIcon icon={faChevronLeft} className="text-sm" />
    </button>
  )
}
