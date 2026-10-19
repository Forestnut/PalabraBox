// Shared test fixture: one valid scenario covering all five question types.
// Tests mutate it to exercise validation failures.

export function makeValidScenario() {
  return {
    title: { en: 'Test Scenario', es: 'Escenario de prueba' },
    description: { en: 'A test scenario.', es: 'Un escenario de prueba.' },
    category: 'basics',
    level: 'beginner',
    emoji: '🧪',
    words: [
      { base_key: 'hello', en: 'hello', es: 'hola', emoji: '👋' },
      { base_key: 'cat', en: 'cat', es: 'gato', emoji: '🐱' },
      { base_key: 'water', en: 'water', es: 'agua' },
      { base_key: 'book', en: 'book', es: 'libro' },
    ],
    questions: [
      {
        type: 'multiple_choice',
        question: {
          es: "¿Cómo se dice 'hola' en inglés?",
          en: "How do you say 'hola' in English?",
        },
        data: {
          correct: 'hello',
          options: ['hello', 'cat', 'water', 'book'],
          tts: [{ text: 'hello', lang: 'en' }],
        },
      },
      {
        type: 'listening',
        question: {
          es: 'Escucha y selecciona el significado en español.',
          en: 'Listen and select the Spanish meaning.',
        },
        data: {
          correct: 'hola',
          options: ['hola', 'gato', 'agua', 'libro'],
          audio_text: 'hello',
          tts: [{ text: 'hello', lang: 'en' }],
        },
      },
      {
        type: 'fill_blank',
        question: { es: 'Yo bebo ___ todos los días.' },
        data: {
          correct: 'water',
          options: ['water', 'hello', 'cat', 'book'],
          tts: [{ text: 'water', lang: 'en' }],
        },
      },
      {
        type: 'image_match',
        question: { es: 'Escribe en inglés: 🐱', en: 'Write in English: 🐱' },
        data: {
          correct: 'cat',
          options: ['cat', 'hello', 'water', 'book'],
          image_emoji: '🐱',
          tts: [{ text: 'cat', lang: 'en' }],
        },
      },
      {
        type: 'word_order',
        question: {
          es: "Ordena las palabras: 'I drink water.'",
          en: "Arrange the words: 'I drink water.'",
        },
        data: {
          correct: ['I', 'drink', 'water.'],
          words: ['I', 'drink', 'water.', 'hello', 'cat'],
          tts: [{ text: 'I drink water.', lang: 'en' }],
        },
      },
    ],
  }
}

export function makeValidBlock() {
  return [makeValidScenario()]
}
