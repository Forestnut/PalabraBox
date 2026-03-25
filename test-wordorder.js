const question = {
  correct_answer: 'la caja amarilla',
  wrong_answers: ['rojo', 'cajas', 'es']
};

const correctWords = question.correct_answer.split(' ');
const allWordObjects = [...correctWords, ...(question.wrong_answers || [])].map((w, i) => ({ id: `word-${i}-${w}`, word: w }));

const dropZone = [
  { word: 'la' },
  { word: 'caja' },
  { word: 'amarilla' }
];

const sanitizeString = (str) => str.replace(/[.,!?¡¿""'']/g, '').toLowerCase().trim();

const currentSentence = dropZone.map(d => sanitizeString(d.word)).join(' ');
const correctClean = sanitizeString(question.correct_answer).split(' ').join(' ');

console.log('User input:', currentSentence);
console.log('Correct clean:', correctClean);
console.log('Match?', currentSentence === correctClean);
