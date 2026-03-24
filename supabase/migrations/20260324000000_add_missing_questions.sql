-- Migration: Add missing unique questions for English scenarios
-- Ensures each scenario has at least 10 questions with unique correct_answer values
-- Uses conditional inserts to avoid duplicates on re-run

-- -------------------------------------------------------
-- Los Animales (2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e)
-- Currently has: dog(mc), cat(img), pig(lst), 3x word_order, cat/fish(fill)
-- Missing words as single-answer questions: bird, cow, horse, rabbit, fish(img), dog(img)
-- -------------------------------------------------------

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'multiple_choice', '¿Cómo se dice "pájaro" en inglés?', 'bird', 'bird', ARRAY['dog', 'horse', 'fish'], NULL, NULL, 21
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e'
    AND type = 'multiple_choice' AND correct_answer = 'bird'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'multiple_choice', '¿Cómo se dice "conejo" en inglés?', 'rabbit', 'rabbit', ARRAY['cat', 'pig', 'bird'], NULL, NULL, 22
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e'
    AND type = 'multiple_choice' AND correct_answer = 'rabbit'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'multiple_choice', '¿Cómo se dice "pez" en inglés?', 'fish', 'fish', ARRAY['cow', 'rabbit', 'horse'], NULL, NULL, 23
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e'
    AND type = 'multiple_choice' AND correct_answer = 'fish'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'image_match', '¿Qué palabra representa 🐄?', 'cow', 'cow', ARRAY['dog', 'pig', 'rabbit'], '🐄', NULL, 24
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e'
    AND type = 'image_match' AND correct_answer = 'cow'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'image_match', '¿Qué palabra representa 🐴?', 'horse', 'horse', ARRAY['cat', 'bird', 'fish'], '🐴', NULL, 25
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e'
    AND type = 'image_match' AND correct_answer = 'horse'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'listening', 'Escucha y selecciona la palabra correcta', 'rabbit', 'rabbit', ARRAY['dog', 'cat', 'bird'], NULL, NULL, 26
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e'
    AND type = 'listening' AND correct_answer = 'rabbit'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'listening', 'Escucha y selecciona la palabra correcta', 'bird', 'bird', ARRAY['horse', 'cow', 'fish'], NULL, NULL, 27
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e'
    AND type = 'listening' AND correct_answer = 'bird'
);

-- -------------------------------------------------------
-- Comida y Bebidas (3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f)
-- Currently has: cheese(mc), milk(img), cheese(lst), 3x word_order, bread/milk(fill)
-- cheese and milk appear in multiple types => duplicates when fallback hits
-- Missing as single-answer: egg, water, apple, chicken, meat
-- -------------------------------------------------------

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'multiple_choice', '¿Cómo se dice "leche" en inglés?', 'milk', 'milk', ARRAY['water', 'egg', 'apple'], NULL, NULL, 29
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f'
    AND type = 'multiple_choice' AND correct_answer = 'milk'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'multiple_choice', '¿Cómo se dice "manzana" en inglés?', 'apple', 'apple', ARRAY['bread', 'chicken', 'water'], NULL, NULL, 30
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f'
    AND type = 'multiple_choice' AND correct_answer = 'apple'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'multiple_choice', '¿Cómo se dice "pollo" en inglés?', 'chicken', 'chicken', ARRAY['meat', 'egg', 'cheese'], NULL, NULL, 31
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f'
    AND type = 'multiple_choice' AND correct_answer = 'chicken'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'multiple_choice', '¿Cómo se dice "agua" en inglés?', 'water', 'water', ARRAY['milk', 'bread', 'apple'], NULL, NULL, 32
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f'
    AND type = 'multiple_choice' AND correct_answer = 'water'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'image_match', '¿Qué palabra representa 🥚?', 'egg', 'egg', ARRAY['cheese', 'bread', 'chicken'], '🥚', NULL, 33
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f'
    AND type = 'image_match' AND correct_answer = 'egg'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'image_match', '¿Qué palabra representa 🍞?', 'bread', 'bread', ARRAY['apple', 'egg', 'milk'], '🍞', NULL, 34
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f'
    AND type = 'image_match' AND correct_answer = 'bread'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'listening', 'Escucha y selecciona la palabra correcta', 'egg', 'egg', ARRAY['milk', 'apple', 'water'], NULL, NULL, 35
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f'
    AND type = 'listening' AND correct_answer = 'egg'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'listening', 'Escucha y selecciona la palabra correcta', 'water', 'water', ARRAY['chicken', 'bread', 'egg'], NULL, NULL, 36
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f'
    AND type = 'listening' AND correct_answer = 'water'
);

-- -------------------------------------------------------
-- La Familia (4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a)
-- Currently has: mother(mc), grandfather(img), brother(lst), 3x word_order, father(fill)
-- Missing as single-answer: father(mc), sister, grandmother, uncle, aunt, father(img)
-- -------------------------------------------------------

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'multiple_choice', '¿Cómo se dice "hermana" en inglés?', 'sister', 'sister', ARRAY['mother', 'aunt', 'grandmother'], NULL, NULL, 36
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a'
    AND type = 'multiple_choice' AND correct_answer = 'sister'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'multiple_choice', '¿Cómo se dice "padre" en inglés?', 'father', 'father', ARRAY['brother', 'grandfather', 'uncle'], NULL, NULL, 37
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a'
    AND type = 'multiple_choice' AND correct_answer = 'father'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'multiple_choice', '¿Cómo se dice "abuela" en inglés?', 'grandmother', 'grandmother', ARRAY['sister', 'aunt', 'mother'], NULL, NULL, 38
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a'
    AND type = 'multiple_choice' AND correct_answer = 'grandmother'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'multiple_choice', '¿Cómo se dice "abuelo" en inglés?', 'grandfather', 'grandfather', ARRAY['uncle', 'father', 'brother'], NULL, NULL, 39
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a'
    AND type = 'multiple_choice' AND correct_answer = 'grandfather'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'image_match', '¿Qué palabra representa 👨?', 'father', 'father', ARRAY['brother', 'uncle', 'grandfather'], '👨', NULL, 40
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a'
    AND type = 'image_match' AND correct_answer = 'father'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'image_match', '¿Qué palabra representa 👧?', 'sister', 'sister', ARRAY['mother', 'aunt', 'grandmother'], '👧', NULL, 41
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a'
    AND type = 'image_match' AND correct_answer = 'sister'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'listening', 'Escucha y selecciona la palabra correcta', 'uncle', 'uncle', ARRAY['father', 'grandfather', 'brother'], NULL, NULL, 42
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a'
    AND type = 'listening' AND correct_answer = 'uncle'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'listening', 'Escucha y selecciona la palabra correcta', 'sister', 'sister', ARRAY['mother', 'aunt', 'grandmother'], NULL, NULL, 43
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a'
    AND type = 'listening' AND correct_answer = 'sister'
);

-- -------------------------------------------------------
-- Partes del Cuerpo (5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b)
-- Currently has: head(mc), eye(img), leg(lst), 3x word_order — only 6 questions!
-- Missing as single-answer: hand, foot, ear, mouth, nose
-- -------------------------------------------------------

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'multiple_choice', '¿Cómo se dice "boca" en inglés?', 'mouth', 'mouth', ARRAY['nose', 'ear', 'eye'], NULL, NULL, 42
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b'
    AND type = 'multiple_choice' AND correct_answer = 'mouth'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'multiple_choice', '¿Cómo se dice "oreja" en inglés?', 'ear', 'ear', ARRAY['head', 'leg', 'mouth'], NULL, NULL, 43
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b'
    AND type = 'multiple_choice' AND correct_answer = 'ear'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'multiple_choice', '¿Cómo se dice "nariz" en inglés?', 'nose', 'nose', ARRAY['eye', 'hand', 'foot'], NULL, NULL, 44
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b'
    AND type = 'multiple_choice' AND correct_answer = 'nose'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'image_match', '¿Qué palabra representa ✋?', 'hand', 'hand', ARRAY['foot', 'ear', 'leg'], '✋', NULL, 45
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b'
    AND type = 'image_match' AND correct_answer = 'hand'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'image_match', '¿Qué palabra representa 👃?', 'nose', 'nose', ARRAY['mouth', 'ear', 'eye'], '👃', NULL, 46
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b'
    AND type = 'image_match' AND correct_answer = 'nose'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'listening', 'Escucha y selecciona la palabra correcta', 'ear', 'ear', ARRAY['eye', 'mouth', 'nose'], NULL, NULL, 47
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b'
    AND type = 'listening' AND correct_answer = 'ear'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'listening', 'Escucha y selecciona la palabra correcta', 'hand', 'hand', ARRAY['leg', 'foot', 'head'], NULL, NULL, 48
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b'
    AND type = 'listening' AND correct_answer = 'hand'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'fill_blank', 'I use my ___ to walk.', 'leg', 'leg', ARRAY['hand', 'ear', 'nose'], NULL, NULL, 49
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b'
    AND type = 'fill_blank' AND correct_answer = 'leg'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'fill_blank', 'I hear with my ___.', 'ear', 'ear', ARRAY['eye', 'mouth', 'nose'], NULL, NULL, 50
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b'
    AND type = 'fill_blank' AND correct_answer = 'ear'
);

-- -------------------------------------------------------
-- Viajes y Transporte (6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c)
-- Currently has: hotel(mc), bus(img), car(lst), 3x word_order — only 6 questions!
-- Missing as single-answer: train, plane, ticket, passport, airport
-- -------------------------------------------------------

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'multiple_choice', '¿Cómo se dice "tren" en inglés?', 'train', 'train', ARRAY['bus', 'plane', 'car'], NULL, NULL, 48
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c'
    AND type = 'multiple_choice' AND correct_answer = 'train'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'multiple_choice', '¿Cómo se dice "autobús" en inglés?', 'bus', 'bus', ARRAY['car', 'train', 'plane'], NULL, NULL, 49
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c'
    AND type = 'multiple_choice' AND correct_answer = 'bus'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'multiple_choice', '¿Cómo se dice "pasaporte" en inglés?', 'passport', 'passport', ARRAY['ticket', 'hotel', 'airport'], NULL, NULL, 50
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c'
    AND type = 'multiple_choice' AND correct_answer = 'passport'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'image_match', '¿Qué palabra representa ✈️?', 'plane', 'plane', ARRAY['bus', 'train', 'car'], '✈️', NULL, 51
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c'
    AND type = 'image_match' AND correct_answer = 'plane'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'image_match', '¿Qué palabra representa 🛂?', 'passport', 'passport', ARRAY['ticket', 'hotel', 'airport'], '🛂', NULL, 52
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c'
    AND type = 'image_match' AND correct_answer = 'passport'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'listening', 'Escucha y selecciona la palabra correcta', 'passport', 'passport', ARRAY['ticket', 'bus', 'hotel'], NULL, NULL, 53
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c'
    AND type = 'listening' AND correct_answer = 'passport'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'listening', 'Escucha y selecciona la palabra correcta', 'train', 'train', ARRAY['plane', 'car', 'bus'], NULL, NULL, 54
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c'
    AND type = 'listening' AND correct_answer = 'train'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'fill_blank', 'I booked tickets at the ___.', 'airport', 'airport', ARRAY['hotel', 'bus', 'train'], NULL, NULL, 55
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c'
    AND type = 'fill_blank' AND correct_answer = 'airport'
);

INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order)
SELECT '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'fill_blank', 'I need a ___ to travel by train.', 'ticket', 'ticket', ARRAY['passport', 'hotel', 'airport'], NULL, NULL, 56
WHERE NOT EXISTS (
  SELECT 1 FROM public.questions
  WHERE scenario_id = '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c'
    AND type = 'fill_blank' AND correct_answer = 'ticket'
);
