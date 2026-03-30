/**
 * SpeechService provides a singleton wrapper around the Web Speech API's SpeechSynthesis,
 * allowing TTS (Text-To-Speech) to be called easily from anywhere in the app.
 */
class SpeechService {
  private synth: SpeechSynthesis | null = null;
  private voice: SpeechSynthesisVoice | null = null;
  private defaultLang: string = 'es-ES';

  constructor() {
    if (typeof window !== 'undefined' && 'speechSynthesis' in window) {
      this.synth = window.speechSynthesis;
      // Voices are loaded asynchronously in some browsers
      if (this.synth.onvoiceschanged !== undefined) {
        this.synth.onvoiceschanged = this.initVoices.bind(this);
      } else {
        // Run immediately if ready (e.g., Safari/Firefox sometimes)
        this.initVoices();
      }
    } else {
      console.warn('Web Speech API is not supported in this browser.');
    }
  }

  private initVoices() {
    if (!this.synth) return;
    const voices = this.synth.getVoices();
    // Prefer Google US English if available, else standard English, else first available
    this.voice = 
      voices.find((v) => v.lang === this.defaultLang && v.name.includes('Google')) ||
      voices.find((v) => v.lang.startsWith('es')) || 
      voices[0] || null;
  }

  /**
   * Speak a text string using the Web Speech API.
   * @param text The text to be spoken
   * @param lang Optional language code (e.g. 'en-US', 'es-ES')
   * @param rate Speech rate (default 1)
   * @param pitch Speech pitch (default 1)
   * @param onEnd Optional callback when speech finishes
   */
  public speak(
    text: string, 
    lang?: string, 
    rate: number = 1, 
    pitch: number = 1,
    onEnd?: () => void
  ): void {
    if (!this.synth) {
      console.warn('SpeechSynthesis not initialized or supported.');
      if (onEnd) onEnd();
      return;
    }

    // Cancel any ongoing speech
    this.synth.cancel();

    if (!text.trim()) {
      if (onEnd) onEnd();
      return;
    }

    const utterance = new SpeechSynthesisUtterance(text);
    
    // Set voice based on provided language or fall back to default
    if (lang) {
      const voices = this.synth.getVoices();
      const prefix = lang.split('-')[0];
      utterance.voice = 
        voices.find((v) => v.lang === lang) || 
        voices.find((v) => v.lang.startsWith(lang)) || 
        voices.find((v) => v.lang.startsWith(prefix)) || 
        this.voice;
      utterance.lang = lang;
    } else {
      utterance.voice = this.voice;
      utterance.lang = this.defaultLang;
    }

    utterance.rate = rate;
    utterance.pitch = pitch;

    if (onEnd) {
      utterance.onend = onEnd;
      utterance.onerror = onEnd; // fallback just in case
    }

    this.synth.speak(utterance);
  }

  /**
   * Stop any ongoing speech.
   */
  public stop(): void {
    if (this.synth) {
      this.synth.cancel();
    }
  }
}

export const speechService = new SpeechService();
