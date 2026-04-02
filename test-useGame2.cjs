const questionsByType = {
  a: [{ id: 1, type: 'a', correct_answer: 'red' }, { id: 2, type: 'a', correct_answer: 'red' }, { id: 3, type: 'a', correct_answer: 'red' }],
  b: [{ id: 4, type: 'b', correct_answer: 'blue' }, { id: 5, type: 'b', correct_answer: 'red' }]
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
const nonUniqueRemaining = []

while (selected.length < 10 && remaining.length > 0) {
  const picked = remaining.pop()
  const ans = picked.correct_answer?.toLowerCase() || ''
  
  if (!ans || !usedAnswers.has(ans)) {
    selected.push(picked)
    if (ans) usedAnswers.add(ans)
  } else {
    nonUniqueRemaining.push(picked)
  }
}

while (selected.length < 10 && nonUniqueRemaining.length > 0) {
  selected.push(nonUniqueRemaining.pop())
}

console.log("Selected answers:", selected.map(q => q.correct_answer));
