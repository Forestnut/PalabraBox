const questionsByType = {
  a: [{ id: 1, type: 'a', correct_answer: 'red' }, { id: 2, type: 'a', correct_answer: 'red' }],
  b: [{ id: 3, type: 'b', correct_answer: 'blue' }, { id: 4, type: 'b', correct_answer: 'blue' }]
};

function shuffleArray(items) {
  const copy = [...items]
  for (let i = copy.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[copy[i], copy[j]] = [copy[j], copy[i]]
  }
  return copy
}

const selected = []
const usedAnswers = new Set()

Object.keys(questionsByType).forEach(type => {
  const group = questionsByType[type]
  if (group.length > 0) {
    const rIdx = Math.floor(Math.random() * group.length)
    const picked = group.splice(rIdx, 1)[0]
    selected.push(picked)
    if (picked.correct_answer) usedAnswers.add(picked.correct_answer.toLowerCase())
  }
})

const remaining = shuffleArray(Object.values(questionsByType).flat())

const uniqueRemaining = remaining.filter(q => {
  const ans = q.correct_answer?.toLowerCase() || ''
  return !usedAnswers.has(ans)
})
const nonUniqueRemaining = remaining.filter(q => {
  const ans = q.correct_answer?.toLowerCase() || ''
  return usedAnswers.has(ans)
})

while (selected.length < 10 && uniqueRemaining.length > 0) {
  const picked = uniqueRemaining.pop()
  selected.push(picked)
  if (picked.correct_answer) usedAnswers.add(picked.correct_answer.toLowerCase())
}

while (selected.length < 10 && nonUniqueRemaining.length > 0) {
  selected.push(nonUniqueRemaining.pop())
}

console.log("Selected IDs:", selected.map(q => q.id));
console.log("Unique remaining left:", uniqueRemaining.length);
console.log("Non-unique remaining left:", nonUniqueRemaining.length);
