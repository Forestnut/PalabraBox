import { Howl, Howler } from 'howler';
import { useSettingsStore } from '../store/settingsStore';

// Common game sound effects. Mapped to their paths.
export const SOUND_EFFECTS = {
  click: '/sounds/click.mp3',
  correct: '/sounds/correct.mp3',
  wrong: '/sounds/wrong.mp3',
  celebration: '/sounds/celebration.mp3',
} as const;

export type SoundEffectType = keyof typeof SOUND_EFFECTS;

class AudioService {
  private sounds: Map<SoundEffectType, Howl> = new Map();
  private initialized = false;

  constructor() {
    this.initMuteListener();
  }

  /**
   * Listen to the settingsStore for volume changes
   */
  private initMuteListener() {
    // Initial sync
    const initialVolume = useSettingsStore.getState().volume.sound;
    Howler.volume(initialVolume);

    // Subscribe to changes
    useSettingsStore.subscribe((state) => {
      Howler.volume(state.volume.sound);
    });
  }

  /**
   * Preload essential sound effects into memory.
   */
  public preloadSounds() {
    if (this.initialized) return;

    Object.entries(SOUND_EFFECTS).forEach(([key, path]) => {
      const effectId = key as SoundEffectType;
      if (!this.sounds.has(effectId)) {
        const howl = new Howl({
          src: [path],
          preload: true,
        });
        this.sounds.set(effectId, howl);
      }
    });

    this.initialized = true;
  }

  /**
   * Play a specific sound effect.
   * @param effect The sound effect identifier
   */
  public play(effect: SoundEffectType) {
    const sound = this.sounds.get(effect);
    if (sound) {
      sound.play();
    } else {
      // Fallback if not preloaded (loads dynamically)
      const howl = new Howl({
        src: [SOUND_EFFECTS[effect]],
        autoplay: true,
      });
      this.sounds.set(effect, howl);
    }
  }

  /**
   * Stop an ongoing sound effect.
   */
  public stop(effect: SoundEffectType) {
    const sound = this.sounds.get(effect);
    if (sound) {
      sound.stop();
    }
  }

  /**
   * Stop all playing sounds.
   */
  public stopAll() {
    Howler.stop();
  }
}

export const audioService = new AudioService();
