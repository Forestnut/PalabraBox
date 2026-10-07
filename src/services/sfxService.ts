import { useSettingsStore } from '../store/settingsStore'

/**
 * Sound effects service built on the native HTMLAudioElement API.
 *
 * Why not Howler: the library has been unmaintained since 2023 and our needs
 * (4 short SFX + a volume setting) are fully covered by the platform.
 */

export const SOUND_EFFECTS = {
  click: '/sounds/click.wav',
  correct: '/sounds/correct.mp3',
  wrong: '/sounds/wrong.mp3',
  celebration: '/sounds/celebration.wav',
} as const

export type SoundEffectType = keyof typeof SOUND_EFFECTS

class SfxService {
  private preloaded = false
  /** Audio instances currently playing (so we can stop them). */
  private active = new Set<HTMLAudioElement>()

  /** Warm the browser cache for all effects (called once on app start). */
  public preload(): void {
    if (this.preloaded) return
    this.preloaded = true
    for (const src of Object.values(SOUND_EFFECTS)) {
      const a = new Audio(src)
      a.preload = 'auto'
      a.load()
    }
  }

  /** Play a sound effect at the current configured volume. */
  public play(effect: SoundEffectType): void {
    const volume = useSettingsStore.getState().volume.sound
    if (volume <= 0) return

    const audio = new Audio(SOUND_EFFECTS[effect])
    audio.volume = volume
    this.active.add(audio)
    audio.addEventListener('ended', () => this.active.delete(audio))
    audio.addEventListener('error', () => this.active.delete(audio))
    void audio.play().catch(() => {
      // Autoplay policy or decode failure — SFX are non-critical, ignore.
      this.active.delete(audio)
    })
  }

  /** Stop all currently playing sound effects. */
  public stopAll(): void {
    for (const audio of this.active) {
      audio.pause()
      audio.currentTime = 0
    }
    this.active.clear()
  }
}

export const sfxService = new SfxService()
