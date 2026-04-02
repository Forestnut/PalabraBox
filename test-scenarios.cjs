const fs = require('fs');
const content = fs.readFileSync('supabase/seed.sql', 'utf8');

const regex = /INSERT INTO public\.questions \([^)]+\) VALUES\s*([\s\S]+?);/;
const match = content.match(regex);
if (!match) {
  console.log("No questions found");
  process.exit();
}

const valuesStr = match[1];
const rows = valuesStr.split(/\),\s*\n\s*\(/);

const scenarios = {};

rows.forEach(r => {
  const row = r.replace(/^\(/, '').replace(/\)$/, '');
  // Match the scenario id and correct answer
  // ('e11c...eaa', 'multiple_choice', '...', 'the color is red', 'the color is red', ARRAY[...
  const parts = row.split(/', '/);
  if (parts.length >= 5) {
    const scenarioId = parts[0].replace(/'/g, '');
    const correctAnswer = parts[4].replace(/'/g, '');
    
    if (!scenarios[scenarioId]) {
      scenarios[scenarioId] = { total: 0, answers: new Set() };
    }
    scenarios[scenarioId].total++;
    scenarios[scenarioId].answers.add(correctAnswer.toLowerCase());
  }
});

console.log("Scenario analysis:");
Object.keys(scenarios).forEach(id => {
  const s = scenarios[id];
  console.log(`Scenario: ${id} | Total questions: ${s.total} | Unique words: ${s.answers.size}`);
});
