import { create } from 'zustand'

export type LearningLanguage = 'english'
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

export const useSettingsStore = create<SettingsState>((set) => ({
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
}))
