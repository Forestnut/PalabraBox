import { createClient } from '@supabase/supabase-js';

// The local development Supabase URL and anon key are standard for local projects
// If not standard, they might be in .env.local, let's just read from .env.local
import fs from 'fs';
import path from 'path';

let url = '';
let key = '';

try {
  const envPath = path.join(process.cwd(), '.env');
  const envContent = fs.readFileSync(envPath, 'utf8');
  const urlMatch = envContent.match(/VITE_SUPABASE_URL=([^\n\r]+)/);
  const keyMatch = envContent.match(/VITE_SUPABASE_ANON_KEY=([^\n\r]+)/);
  if (urlMatch) url = urlMatch[1];
  if (keyMatch) key = keyMatch[1];
} catch(e) {
  console.log("No .env.local found");
}

if (!url || !key) {
  url = "http://127.0.0.1:54321";
  key = "eyJ... (We don't know the exact local anon key, so we need to rely on env extraction)";
}

const supabase = createClient(url, key);

async function check() {
  const { data, error } = await supabase
    .from('questions')
    .delete()
    .eq('question_text', 'Arrange the words correctly')
    .select();
  
  if (error) console.error(error);
  else console.log("Deleted questions:", data);
}
check();
