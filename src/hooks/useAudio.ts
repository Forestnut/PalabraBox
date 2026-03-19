import { useEffect, useCallback } from 'react';
import { audioService, type SoundEffectType } from '../services/audioService';

/**
 * A handy hook to play sound effects anywhere in a component
 */
export function useAudio() {
  useEffect(() => {
    // Ensure sounds are preloaded exactly once when this hook is first used
    audioService.preloadSounds();
  }, []);

  const playSound = useCallback((effect: SoundEffectType) => {
    audioService.play(effect);
  }, []);

  const stopSound = useCallback((effect: SoundEffectType) => {
    audioService.stop(effect);
  }, []);

  const stopAllSounds = useCallback(() => {
    audioService.stopAll();
  }, []);

  return {
    playSound,
    stopSound,
    stopAllSounds,
  };
}
