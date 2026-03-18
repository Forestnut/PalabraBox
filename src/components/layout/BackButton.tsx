import { useNavigate } from 'react-router-dom'
import { Button } from '../ui/Button'

interface BackButtonProps {
  label?: string
  fallbackUrl?: string
}

export function BackButton({ label = '← Volver', fallbackUrl }: BackButtonProps) {
  const navigate = useNavigate()

  return (
    <Button
      variant="ghost"
      size="sm"
      onClick={() => {
        if (window.history.length > 2) {
          navigate(-1)
        } else if (fallbackUrl) {
          navigate(fallbackUrl)
        } else {
          navigate('/menu')
        }
      }}
    >
      {label}
    </Button>
  )
}
