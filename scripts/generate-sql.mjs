import fs from 'fs';
import path from 'path';
import crypto from 'crypto';

const inputDir = path.join(process.cwd(), 'scripts', 'content_blocks');

const blockName = process.argv[2] || 'block_1.json';
const outputFile = path.join(process.cwd(), 'supabase', 'migrations', `20260327000000_${blockName.replace('.json', '')}.sql`);

function generateUUID(seed) {
  return crypto.createHash('md5').update(seed).digest('hex').replace(/(.{8})(.{4})(.{4})(.{4})(.{12})/, '$1-$2-$3-$4-$5');
}

function escapeSql(str) {
  if (typeof str !== 'string') return str;
  return str.replace(/'/g, "''");
}

let sql = `-- Migration auto-generated for content update\n\n`;

function processBlock(blockFile, sortStart) {
  const data = JSON.parse(fs.readFileSync(blockFile, 'utf8'));
  
  data.forEach((scenario, index) => {
    const scenarioId = generateUUID(`scenario_${scenario.target_language}_${scenario.title.en}`);
    
    // 1. Insert Scenario
    sql += `INSERT INTO public.scenarios (id, category, level, sort_order)\n`;
    sql += `VALUES ('${scenarioId}', '${scenario.category}', '${scenario.level}', ${sortStart + index})\n`;
    sql += `ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;\n\n`;

    // 2. Insert Translations for Scenario
    Object.entries(scenario.title).forEach(([lang, title]) => {
      const translationId = generateUUID(`scenario_trans_${scenarioId}_${lang}`);
      const desc = escapeSql(scenario.description[lang] || scenario.description.en);
      const safeTitle = escapeSql(title);
      
      sql += `INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)\n`;
      sql += `VALUES ('${translationId}', '${scenarioId}', '${lang}', '${safeTitle}', '${desc}')\n`;
      sql += `ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;\n\n`;
    });

    // 3. Insert words and translations
    scenario.words.forEach(word => {
      
      // Upsert word without hardcoded ID so it merges with existing base_key and gets the DB ID
      sql += `INSERT INTO public.words (base_key, category, level)\n`;
      sql += `VALUES ('${escapeSql(word.base_key)}', '${scenario.category}', '${scenario.level}')\n`;
      sql += `ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;\n\n`;

      // English
      if (word.en) {
        sql += `INSERT INTO public.word_translations (word_id, language, text, audio_text)\n`;
        sql += `VALUES ((SELECT id FROM public.words WHERE base_key = '${escapeSql(word.base_key)}'), 'en', '${escapeSql(word.en)}', '${escapeSql(word.en)}')\n`;
        sql += `ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;\n\n`;
      }
      
      // Spanish
      if (word.es) {
        sql += `INSERT INTO public.word_translations (word_id, language, text, audio_text)\n`;
        sql += `VALUES ((SELECT id FROM public.words WHERE base_key = '${escapeSql(word.base_key)}'), 'es', '${escapeSql(word.es)}', '${escapeSql(word.es)}')\n`;
        sql += `ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;\n\n`;
      }
    });



    // 4. Insert questions
    scenario.questions.forEach((question, qIdx) => {
      let qText = question.question_text;
      if (typeof qText === 'object') qText = qText.es || qText.en || '';

      const qId = generateUUID(`question_${scenarioId}_${qIdx}_${qText}`);
      const dataStr = JSON.stringify(question.data).replace(/'/g, "''");
      
      sql += `INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)\n`;
      sql += `VALUES (\n`;
      sql += `  '${qId}',\n`;
      sql += `  '${scenarioId}',\n`;
      sql += `  '${question.type}',\n`;
      sql += `  '${escapeSql(qText)}',\n`;
      sql += `  ${qIdx + 1},\n`;
      sql += `  '${dataStr}'::jsonb,\n`;
      sql += `  '${question.source_language || 'en'}',\n`;
      sql += `  '${question.target_language || 'es'}'\n`;
      sql += `)\n`;
      sql += `ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;\n\n`;
    });
  });
}

// Determine sort start roughly based on block number if possible
const blockNum = parseInt(blockName.match(/\d+/) || '1', 10);
const isIntermedio = blockName.includes('intermedio');
const sortStart = (isIntermedio ? 200 : 0) + (blockNum * 100);
processBlock(path.join(inputDir, blockName), sortStart);

fs.writeFileSync(outputFile, sql);
console.log(`Generated migration: ${outputFile}`);
