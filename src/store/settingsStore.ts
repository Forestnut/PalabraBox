import { create } from 'zustand'

interface SettingsState {
  volume: {
    sound: number
    tts: number
  }
  speechSpeed: number
  learningLanguage: 'english' | 'spanish' | null
  setSoundVolume: (val: number) => void
  setTtsVolume: (val: number) => void
  setSpeechSpeed: (val: number) => void
  setLearningLanguage: (lang: 'english' | 'spanish') => void
}

export const useSettingsStore = create<SettingsState>((set) => ({
  volume: {
    sound: 1,
    tts: 1,
  },
  speechSpeed: 1,
  learningLanguage: null,

  setSoundVolume: (val) => set((state) => ({ volume: { ...state.volume, sound: val } })),
  setTtsVolume: (val) => set((state) => ({ volume: { ...state.volume, tts: val } })),
  setSpeechSpeed: (val) => set({ speechSpeed: val }),
  setLearningLanguage: (lang) => set({ learningLanguage: lang }),
}))
