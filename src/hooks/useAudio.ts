import { useEffect, useCallback } from 'react'
import { sfxService, type SoundEffectType } from '../services/sfxService'

/**
 * A handy hook to play sound effects anywhere in a component
 */
export function useAudio() {
  useEffect(() => {
    // Ensure sounds are preloaded exactly once when this hook is first used
    sfxService.preload()
  }, [])

  const playSound = useCallback((effect: SoundEffectType) => {
    sfxService.play(effect)
  }, [])

  const stopAllSounds = useCallback(() => {
    sfxService.stopAll()
  }, [])

  return {
    playSound,
    stopAllSounds,
  }
}
