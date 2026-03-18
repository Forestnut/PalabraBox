-- Migration: Initialize PalabraBox Schema
-- Creates tables: scenarios, questions, words
-- Sets up Public Read RLS policies for MVP

-- Enable UUID extension if not already mapped by default
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- 1. Scenarios Table
CREATE TABLE IF NOT EXISTS public.scenarios (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  title_display TEXT NOT NULL,
  language TEXT NOT NULL CHECK (language in ('english', 'spanish')),
  level TEXT NOT NULL CHECK (level in ('beginner', 'intermediate')),
  description TEXT,
  emoji TEXT,
  category TEXT NOT NULL,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Questions Table
CREATE TABLE IF NOT EXISTS public.questions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  scenario_id UUID REFERENCES public.scenarios(id) ON DELETE CASCADE,
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

-- 3. Words Table (Flashcard Bank)
CREATE TABLE IF NOT EXISTS public.words (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  word TEXT NOT NULL,
  language TEXT NOT NULL CHECK (language in ('english', 'spanish')),
  level TEXT NOT NULL CHECK (level in ('beginner', 'intermediate')),
  category TEXT NOT NULL,
  translation_es TEXT,
  translation_en TEXT,
  image_emoji TEXT,
  audio_text TEXT
);

-- Enable RLS (Row Level Security)
ALTER TABLE public.scenarios ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.words ENABLE ROW LEVEL SECURITY;

-- Create Policies FOR MVP (Public Read Access)
-- Since MVP doesn't have auth, we allow anyone to read these tables.
-- Write permissions remain restricted to service_role (Admin dashboard/seed data).

CREATE POLICY "Allow public read - scenarios" 
ON public.scenarios FOR SELECT TO public USING (true);

CREATE POLICY "Allow public read - questions" 
ON public.questions FOR SELECT TO public USING (true);

CREATE POLICY "Allow public read - words" 
ON public.words FOR SELECT TO public USING (true);
