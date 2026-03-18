# 🗄️ Database Design (Supabase)

## Schema Overview

All scenario and question data is stored in Supabase (PostgreSQL). For MVP, we don't have user authentication, so progress is only in `localStorage`.

### 1. `scenarios` table

Defines a set of questions (e.g., "Colors", "Numbers").

| Column | Type | Description |
| --- | --- | --- |
| `id` | `UUID` | Primary Key (gen_random_uuid) |
| `title` | `TEXT` | Internal name (e.g. "Colors") |
| `title_display` | `TEXT` | Display name (e.g. "Colores") |
| `language` | `TEXT` | 'english' or 'spanish' |
| `level` | `TEXT` | 'beginner' or 'intermediate' |
| `description` | `TEXT` | Short help text |
| `emoji` | `TEXT` | Icon shown on the grid box (e.g. "🎨") |
| `category` | `TEXT` | Used to link with word bank |
| `sort_order` | `INTEGER` | Display order in the grid |
| `created_at` | `TIMESTAMPTZ` | Auto-timestamp |

---

### 2. `questions` table

The core content of each scenario.

| Column | Type | Description |
| --- | --- | --- |
| `id` | `UUID` | Primary Key |
| `scenario_id` | `UUID` | FK to `scenarios.id` |
| `type` | `TEXT` | 'multiple_choice', 'image_match', 'listening', etc. |
| `question_text` | `TEXT` | Question to display |
| `question_text_tts` | `TEXT` | Text to read aloud (for listening) |
| `correct_answer` | `TEXT` | The right choice |
| `wrong_answers` | `TEXT[]` | 3 wrong choices (array) |
| `hint` | `TEXT` | Optional hint |
| `image_emoji` | `TEXT` | Emoji for Image Match |
| `sort_order` | `INTEGER` | Order within the scenario |

---

### 3. `words` table

Word bank used for flashcards and shared across scenarios.

| Column | Type | Description |
| --- | --- | --- |
| `id` | `UUID` | Primary Key |
| `word` | `TEXT` | The foreign word |
| `language` | `TEXT` | 'english' or 'spanish' |
| `level` | `TEXT` | 'beginner' or 'intermediate' |
| `category` | `TEXT` | e.g. 'colors', 'animals' |
| `translation_es` | `TEXT` | Spanish translation |
| `translation_en` | `TEXT` | English translation |
| `image_emoji` | `TEXT` | Associated icon |
| `audio_text` | `TEXT` | Text for TTS |

---

## Content Plan (MVP)

Target: **12 scenarios** (3 languages × 2 levels × 2 scenarios), ~120 questions.

| Language | Level | Scenario | Category | Questions |
| --- | --- | --- | --- | --- |
| English | Beginner | Colors & Shapes | colors | 10 |
| English | Beginner | Numbers 1-20 | numbers | 10 |
| English | Intermediate | At the Airport | travel | 10 |
| English | Intermediate | Ordering Food | food | 10 |
| Spanish | Beginner | Los Colores | colors | 10 |
| Spanish | Beginner | Los Animales | animals | 10 |

---

## Setup Instructions

1. Create Table Scenarios:

   ```sql
   CREATE TABLE scenarios (
     id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
     title TEXT NOT NULL,
     title_display TEXT NOT NULL,
     language TEXT NOT NULL CHECK (language IN ('english', 'spanish')),
     level TEXT NOT NULL CHECK (level IN ('beginner', 'intermediate')),
     description TEXT,
     emoji TEXT,
     category TEXT NOT NULL,
     sort_order INTEGER DEFAULT 0,
     created_at TIMESTAMPTZ DEFAULT NOW()
   );
   ```

2. Create Table Questions:

   ```sql
   CREATE TABLE questions (
     id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
     scenario_id UUID REFERENCES scenarios(id) ON DELETE CASCADE,
     type TEXT NOT NULL,
     question_text TEXT NOT NULL,
     question_text_tts TEXT,
     correct_answer TEXT NOT NULL,
     wrong_answers TEXT[] NOT NULL,
     hint TEXT,
     image_emoji TEXT,
     sort_order INTEGER DEFAULT 0,
     created_at TIMESTAMPTZ DEFAULT NOW()
   );
   ```

3. RLS Policies:
   For MVP, enable Read Access for everyone.

   ```sql
   ALTER TABLE scenarios ENABLE ROW LEVEL SECURITY;
   CREATE POLICY "Allow public read" ON scenarios FOR SELECT TO public USING (true);
   ```

## Required Queries

```ts
// Fetch all scenarios for selection screen
const { data: scenarios } = await supabase
  .from('scenarios')
  .select('*')
  .eq('language', currentLang)
  .eq('level', currentLevel)
  .order('sort_order');

// Fetch 10 questions for a game session
const { data: questions } = await supabase
  .from('questions')
  .select('*')
  .eq('scenario_id', scenarioId)
  .order('sort_order')
  .limit(10);
```
