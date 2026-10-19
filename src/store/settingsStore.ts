import { create } from 'zustand'
import { persist } from 'zustand/middleware'

/** Language codes follow the DB convention (en/es/pl). The product currently teaches English. */
export type LearningLanguage = 'en'
export type LearningLevel = 'beginner' | 'intermediate'

interface SettingsState {
  volume: {
    sound: number
    tts: number
  }
  speechSpeed: number
  learningLanguage: LearningLanguage | null
  learningLevel: LearningLevel | null
  setSoundVolume: (val: number) => void
  setTtsVolume: (val: number) => void
  setSpeechSpeed: (val: number) => void
  setLearningLanguage: (lang: LearningLanguage) => void
  setLearningLevel: (level: LearningLevel) => void
}

export const useSettingsStore = create<SettingsState>()(
  persist(
    (set) => ({
      volume: {
        sound: 1,
        tts: 1,
      },
      speechSpeed: 1,
      learningLanguage: null,
      learningLevel: null,

      setSoundVolume: (val) => set((state) => ({ volume: { ...state.volume, sound: val } })),
      setTtsVolume: (val) => set((state) => ({ volume: { ...state.volume, tts: val } })),
      setSpeechSpeed: (val) => set({ speechSpeed: val }),
      setLearningLanguage: (lang) => set({ learningLanguage: lang }),
      setLearningLevel: (level) => set({ learningLevel: level }),
    }),
    {
      name: 'palabrabox-settings-storage',
      version: 1,
      migrate: (persistedState: unknown) => {
        // v0→v1: language codes moved from full names ('english') to ISO codes ('en')
        const state = persistedState as { learningLanguage?: unknown } | undefined
        if (state && state.learningLanguage === 'english') {
          state.learningLanguage = 'en'
        }
        return persistedState as SettingsState
      },
    },
  ),
)
