-- Seed Data for PalabraBox MVP
-- Insert Scenarios, Questions, and Words

-- SCENARIO 1: English - Colors & Shapes (Beginner)
INSERT INTO public.scenarios (id, title, title_display, language, level, description, emoji, category, sort_order)
VALUES (
  'e11c8282-e565-4f40-8483-e0202e8d3eaa',
  'Colors & Shapes',
  'Colores y Formas',
  'english',
  'beginner',
  'Learn the primary colors and basic shapes in English.',
  '🎨',
  'colors',
  1
) ON CONFLICT (id) DO NOTHING;

-- SCENARIO 2: Spanish - Los Animales (Beginner)
INSERT INTO public.scenarios (id, title, title_display, language, level, description, emoji, category, sort_order)
VALUES (
  '3a2ecbbd-0112-4c22-bde1-f8e136cf95fc',
  'Los Animales',
  'Animals',
  'spanish',
  'beginner',
  'Aprende los nombres de los animales más comunes en español.',
  '🐶',
  'animals',
  2
) ON CONFLICT (id) DO NOTHING;


-- QUESTIONS FOR SCENARIO 1 (English Colors & Shapes)
INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, sort_order) VALUES
('e11c8282-e565-4f40-8483-e0202e8d3eaa', 'multiple_choice', '¿Cómo se dice "rojo" en inglés?', 'red', 'red', ARRAY['blue', 'green', 'yellow'], NULL, 1),
('e11c8282-e565-4f40-8483-e0202e8d3eaa', 'multiple_choice', '¿Cómo se dice "azul" en inglés?', 'blue', 'blue', ARRAY['red', 'black', 'white'], NULL, 2),
('e11c8282-e565-4f40-8483-e0202e8d3eaa', 'multiple_choice', '¿Cómo se dice "amarillo" en inglés?', 'yellow', 'yellow', ARRAY['orange', 'purple', 'green'], NULL, 3),
('e11c8282-e565-4f40-8483-e0202e8d3eaa', 'multiple_choice', '¿Cómo se dice "verde" en inglés?', 'green', 'green', ARRAY['red', 'blue', 'brown'], NULL, 4),
('e11c8282-e565-4f40-8483-e0202e8d3eaa', 'image_match', '¿A qué calor corresponde 🖤?', 'black', 'black', ARRAY['white', 'grey', 'purple'], '🖤', 5),
('e11c8282-e565-4f40-8483-e0202e8d3eaa', 'image_match', '¿A qué calor corresponde 🤍?', 'white', 'white', ARRAY['black', 'pink', 'orange'], '🤍', 6),
('e11c8282-e565-4f40-8483-e0202e8d3eaa', 'listening', 'Escucha y selecciona la palabra correcta', 'purple', 'purple', ARRAY['pink', 'brown', 'grey'], NULL, 7),
('e11c8282-e565-4f40-8483-e0202e8d3eaa', 'multiple_choice', '¿Qué figura geométrica es un "circle"?', 'circle', 'círculo', ARRAY['cuadrado', 'triángulo', 'rectángulo'], NULL, 8),
('e11c8282-e565-4f40-8483-e0202e8d3eaa', 'multiple_choice', '¿Cómo se dice "cuadrado" en inglés?', 'square', 'square', ARRAY['circle', 'triangle', 'star'], NULL, 9),
('e11c8282-e565-4f40-8483-e0202e8d3eaa', 'multiple_choice', '¿Qué significa "star"?', 'star', 'estrella', ARRAY['luna', 'sol', 'nube'], NULL, 10);

-- QUESTIONS FOR SCENARIO 2 (Spanish Animals)
INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, sort_order) VALUES
('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'multiple_choice', 'How do you say "dog" in Spanish?', 'perro', 'perro', ARRAY['gato', 'pájaro', 'pez'], NULL, 1),
('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'multiple_choice', 'How do you say "cat" in Spanish?', 'gato', 'gato', ARRAY['perro', 'ratón', 'conejo'], NULL, 2),
('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'multiple_choice', 'How do you say "bird" in Spanish?', 'pájaro', 'pájaro', ARRAY['pez', 'vaca', 'cerdo'], NULL, 3),
('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'image_match', 'Which animal is 🐟?', 'pez', 'pez', ARRAY['caballo', 'pato', 'rana'], '🐟', 4),
('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'image_match', 'Which animal is 🐄?', 'vaca', 'vaca', ARRAY['oveja', 'cerdo', 'toro'], '🐄', 5),
('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'listening', 'Listen and select the correct animal', 'caballo', 'caballo', ARRAY['vaca', 'oveja', 'cabra'], NULL, 6),
('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'multiple_choice', 'What does "cerdo" mean?', 'cerdo', 'pig', ARRAY['cow', 'horse', 'sheep'], NULL, 7),
('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'multiple_choice', 'How do you say "rabbit" in Spanish?', 'conejo', 'conejo', ARRAY['ratón', 'gato', 'zorro'], NULL, 8),
('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'multiple_choice', 'What animal is a "rana"?', 'rana', 'frog', ARRAY['toad', 'lizard', 'snake'], NULL, 9),
('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'multiple_choice', 'How do you say "monkey" in Spanish?', 'mono', 'mono', ARRAY['elefante', 'león', 'tigre'], NULL, 10);

-- WORDS BANK (Flashcards Database)
INSERT INTO public.words (word, language, level, category, translation_es, translation_en, image_emoji, audio_text) VALUES
-- English Colors
('red', 'english', 'beginner', 'colors', 'rojo', NULL, '🔴', 'red'),
('blue', 'english', 'beginner', 'colors', 'azul', NULL, '🔵', 'blue'),
('yellow', 'english', 'beginner', 'colors', 'amarillo', NULL, '🟡', 'yellow'),
('green', 'english', 'beginner', 'colors', 'verde', NULL, '🟢', 'green'),
('black', 'english', 'beginner', 'colors', 'negro', NULL, '⚫', 'black'),
('white', 'english', 'beginner', 'colors', 'blanco', NULL, '⚪', 'white'),
('purple', 'english', 'beginner', 'colors', 'morado', NULL, '🟣', 'purple'),
('orange', 'english', 'beginner', 'colors', 'naranja', NULL, '🟠', 'orange'),
-- Spanish Animals
('perro', 'spanish', 'beginner', 'animals', NULL, 'dog', '🐶', 'perro'),
('gato', 'spanish', 'beginner', 'animals', NULL, 'cat', '🐱', 'gato'),
('pájaro', 'spanish', 'beginner', 'animals', NULL, 'bird', '🐦', 'pájaro'),
('pez', 'spanish', 'beginner', 'animals', NULL, 'fish', '🐟', 'pez'),
('vaca', 'spanish', 'beginner', 'animals', NULL, 'cow', '🐄', 'vaca'),
('caballo', 'spanish', 'beginner', 'animals', NULL, 'horse', '🐴', 'caballo'),
('cerdo', 'spanish', 'beginner', 'animals', NULL, 'pig', '🐷', 'cerdo'),
('conejo', 'spanish', 'beginner', 'animals', NULL, 'rabbit', '🐰', 'conejo');
