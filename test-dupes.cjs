const questionsByType = {
  a: [{ id: 1 }, { id: 2 }],
  b: [{ id: 3 }, { id: 4 }]
};

const selected = [];

Object.keys(questionsByType).forEach(type => {
  const group = questionsByType[type]
  if (group.length > 0) {
    const rIdx = Math.floor(Math.random() * group.length)
    selected.push(group.splice(rIdx, 1)[0])
  }
})

function shuffleArray(items) {
  const copy = [...items]
  for (let i = copy.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[copy[i], copy[j]] = [copy[j], copy[i]]
  }
  return copy
}

const remaining = shuffleArray(Object.values(questionsByType).flat())
while (selected.length < 10 && remaining.length > 0) {
  selected.push(remaining.pop())
}

console.log("Selected length:", selected.length);
console.log("Selected item ids:", selected.map(x => x.id));
