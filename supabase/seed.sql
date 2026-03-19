-- Seed Data for PalabraBox MVP (Auto-Generated 12 Modules)
-- SCENARIOS
INSERT INTO public.scenarios (id, title, title_display, language, level, description, emoji, category, sort_order) VALUES ('e11c8282-e565-4f40-8483-e0202e8d3eaa', 'Colors & Shapes', 'Colores y Formas', 'english', 'beginner', 'Learn the primary colors and basic shapes in English.', '🎨', 'colors', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.scenarios (id, title, title_display, language, level, description, emoji, category, sort_order) VALUES ('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'Animals', 'Los Animales', 'english', 'beginner', 'Learn the names of common animals in English.', '🐶', 'animals', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.scenarios (id, title, title_display, language, level, description, emoji, category, sort_order) VALUES ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'Food & Drinks', 'Comida y Bebidas', 'english', 'beginner', 'Essential vocabulary for eating and drinking.', '🍔', 'food', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.scenarios (id, title, title_display, language, level, description, emoji, category, sort_order) VALUES ('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'Family', 'La Familia', 'english', 'beginner', 'Vocabulary related to family members.', '👨‍👩‍👧‍👦', 'family', 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.scenarios (id, title, title_display, language, level, description, emoji, category, sort_order) VALUES ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Parts of the Body', 'Partes del Cuerpo', 'english', 'intermediate', 'Learn how to name body parts in English.', '🦵', 'body', 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.scenarios (id, title, title_display, language, level, description, emoji, category, sort_order) VALUES ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Travel & Transport', 'Viajes y Transporte', 'english', 'intermediate', 'Useful words for traveling and transportation.', '✈️', 'travel', 6) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.scenarios (id, title, title_display, language, level, description, emoji, category, sort_order) VALUES ('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'Los Colores y Formas', 'Colors & Shapes', 'spanish', 'beginner', 'Learn the primary colors and basic shapes in Spanish.', '🎨', 'colors', 1) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.scenarios (id, title, title_display, language, level, description, emoji, category, sort_order) VALUES ('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'Los Animales', 'Animals', 'spanish', 'beginner', 'Aprende los nombres de los animales más comunes en español.', '🐶', 'animals', 2) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.scenarios (id, title, title_display, language, level, description, emoji, category, sort_order) VALUES ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Comida y Bebidas', 'Food & Drinks', 'spanish', 'beginner', 'Essential vocabulary for eating and drinking in Spanish.', '🍔', 'food', 3) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.scenarios (id, title, title_display, language, level, description, emoji, category, sort_order) VALUES ('0d1e2f3a-4b5c-6d7e-8f9a-0b1c2d3e4f5a', 'Mi Familia', 'My Family', 'spanish', 'beginner', 'Vocabulary related to family members in Spanish.', '👨‍👩‍👧‍👦', 'family', 4) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.scenarios (id, title, title_display, language, level, description, emoji, category, sort_order) VALUES ('1e2f3a4b-5c6d-7e8f-9a0b-1c2d3e4f5a6b', 'Partes del Cuerpo', 'Body Parts', 'spanish', 'intermediate', 'Learn how to name body parts in Spanish.', '🦵', 'body', 5) ON CONFLICT (id) DO NOTHING;
INSERT INTO public.scenarios (id, title, title_display, language, level, description, emoji, category, sort_order) VALUES ('2f3a4b5c-6d7e-8f9a-0b1c-2d3e4f5a6b7c', 'Viajes y Transporte', 'Travel', 'spanish', 'intermediate', 'Useful words for traveling and transportation in Spanish.', '✈️', 'travel', 6) ON CONFLICT (id) DO NOTHING;

-- WORDS
INSERT INTO public.words (word, language, level, category, translation_es, translation_en, image_emoji, audio_text) VALUES
('red', 'english', 'beginner', 'colors', 'rojo', NULL, '🔴', 'red'),
('blue', 'english', 'beginner', 'colors', 'azul', NULL, '🔵', 'blue'),
('yellow', 'english', 'beginner', 'colors', 'amarillo', NULL, '🟡', 'yellow'),
('green', 'english', 'beginner', 'colors', 'verde', NULL, '🟢', 'green'),
('black', 'english', 'beginner', 'colors', 'negro', NULL, '⚫', 'black'),
('white', 'english', 'beginner', 'colors', 'blanco', NULL, '⚪', 'white'),
('purple', 'english', 'beginner', 'colors', 'morado', NULL, '🟣', 'purple'),
('orange', 'english', 'beginner', 'colors', 'naranja', NULL, '🟠', 'orange'),
('dog', 'english', 'beginner', 'animals', 'perro', NULL, '🐶', 'dog'),
('cat', 'english', 'beginner', 'animals', 'gato', NULL, '🐱', 'cat'),
('bird', 'english', 'beginner', 'animals', 'pájaro', NULL, '🐦', 'bird'),
('fish', 'english', 'beginner', 'animals', 'pez', NULL, '🐟', 'fish'),
('cow', 'english', 'beginner', 'animals', 'vaca', NULL, '🐄', 'cow'),
('horse', 'english', 'beginner', 'animals', 'caballo', NULL, '🐴', 'horse'),
('pig', 'english', 'beginner', 'animals', 'cerdo', NULL, '🐷', 'pig'),
('rabbit', 'english', 'beginner', 'animals', 'conejo', NULL, '🐰', 'rabbit'),
('apple', 'english', 'beginner', 'food', 'manzana', NULL, '🍎', 'apple'),
('bread', 'english', 'beginner', 'food', 'pan', NULL, '🍞', 'bread'),
('water', 'english', 'beginner', 'food', 'agua', NULL, '💧', 'water'),
('milk', 'english', 'beginner', 'food', 'leche', NULL, '🥛', 'milk'),
('cheese', 'english', 'beginner', 'food', 'queso', NULL, '🧀', 'cheese'),
('egg', 'english', 'beginner', 'food', 'huevo', NULL, '🥚', 'egg'),
('meat', 'english', 'beginner', 'food', 'carne', NULL, '🥩', 'meat'),
('chicken', 'english', 'beginner', 'food', 'pollo', NULL, '🍗', 'chicken'),
('mother', 'english', 'beginner', 'family', 'madre', NULL, '👩', 'mother'),
('father', 'english', 'beginner', 'family', 'padre', NULL, '👨', 'father'),
('brother', 'english', 'beginner', 'family', 'hermano', NULL, '👦', 'brother'),
('sister', 'english', 'beginner', 'family', 'hermana', NULL, '👧', 'sister'),
('grandmother', 'english', 'beginner', 'family', 'abuela', NULL, '👵', 'grandmother'),
('grandfather', 'english', 'beginner', 'family', 'abuelo', NULL, '👴', 'grandfather'),
('aunt', 'english', 'beginner', 'family', 'tía', NULL, '👱‍♀️', 'aunt'),
('uncle', 'english', 'beginner', 'family', 'tío', NULL, '👱‍♂️', 'uncle'),
('head', 'english', 'intermediate', 'body', 'cabeza', NULL, '🗣️', 'head'),
('hand', 'english', 'intermediate', 'body', 'mano', NULL, '✋', 'hand'),
('leg', 'english', 'intermediate', 'body', 'pierna', NULL, '🦵', 'leg'),
('foot', 'english', 'intermediate', 'body', 'pie', NULL, '🦶', 'foot'),
('eye', 'english', 'intermediate', 'body', 'ojo', NULL, '👁️', 'eye'),
('ear', 'english', 'intermediate', 'body', 'oreja', NULL, '👂', 'ear'),
('mouth', 'english', 'intermediate', 'body', 'boca', NULL, '👄', 'mouth'),
('nose', 'english', 'intermediate', 'body', 'nariz', NULL, '👃', 'nose'),
('car', 'english', 'intermediate', 'travel', 'coche', NULL, '🚗', 'car'),
('bus', 'english', 'intermediate', 'travel', 'autobús', NULL, '🚌', 'bus'),
('train', 'english', 'intermediate', 'travel', 'tren', NULL, '🚆', 'train'),
('plane', 'english', 'intermediate', 'travel', 'avión', NULL, '✈️', 'plane'),
('ticket', 'english', 'intermediate', 'travel', 'billete', NULL, '🎫', 'ticket'),
('hotel', 'english', 'intermediate', 'travel', 'hotel', NULL, '🏨', 'hotel'),
('passport', 'english', 'intermediate', 'travel', 'pasaporte', NULL, '🛂', 'passport'),
('airport', 'english', 'intermediate', 'travel', 'aeropuerto', NULL, '🛫', 'airport'),
('rojo', 'spanish', 'beginner', 'colors', NULL, 'red', '🔴', 'rojo'),
('azul', 'spanish', 'beginner', 'colors', NULL, 'blue', '🔵', 'azul'),
('amarillo', 'spanish', 'beginner', 'colors', NULL, 'yellow', '🟡', 'amarillo'),
('verde', 'spanish', 'beginner', 'colors', NULL, 'green', '🟢', 'verde'),
('negro', 'spanish', 'beginner', 'colors', NULL, 'black', '⚫', 'negro'),
('blanco', 'spanish', 'beginner', 'colors', NULL, 'white', '⚪', 'blanco'),
('morado', 'spanish', 'beginner', 'colors', NULL, 'purple', '🟣', 'morado'),
('naranja', 'spanish', 'beginner', 'colors', NULL, 'orange', '🟠', 'naranja'),
('perro', 'spanish', 'beginner', 'animals', NULL, 'dog', '🐶', 'perro'),
('gato', 'spanish', 'beginner', 'animals', NULL, 'cat', '🐱', 'gato'),
('pájaro', 'spanish', 'beginner', 'animals', NULL, 'bird', '🐦', 'pájaro'),
('pez', 'spanish', 'beginner', 'animals', NULL, 'fish', '🐟', 'pez'),
('vaca', 'spanish', 'beginner', 'animals', NULL, 'cow', '🐄', 'vaca'),
('caballo', 'spanish', 'beginner', 'animals', NULL, 'horse', '🐴', 'caballo'),
('cerdo', 'spanish', 'beginner', 'animals', NULL, 'pig', '🐷', 'cerdo'),
('conejo', 'spanish', 'beginner', 'animals', NULL, 'rabbit', '🐰', 'conejo'),
('manzana', 'spanish', 'beginner', 'food', NULL, 'apple', '🍎', 'manzana'),
('pan', 'spanish', 'beginner', 'food', NULL, 'bread', '🍞', 'pan'),
('agua', 'spanish', 'beginner', 'food', NULL, 'water', '💧', 'agua'),
('leche', 'spanish', 'beginner', 'food', NULL, 'milk', '🥛', 'leche'),
('queso', 'spanish', 'beginner', 'food', NULL, 'cheese', '🧀', 'queso'),
('huevo', 'spanish', 'beginner', 'food', NULL, 'egg', '🥚', 'huevo'),
('carne', 'spanish', 'beginner', 'food', NULL, 'meat', '🥩', 'carne'),
('pollo', 'spanish', 'beginner', 'food', NULL, 'chicken', '🍗', 'pollo'),
('madre', 'spanish', 'beginner', 'family', NULL, 'mother', '👩', 'madre'),
('padre', 'spanish', 'beginner', 'family', NULL, 'father', '👨', 'padre'),
('hermano', 'spanish', 'beginner', 'family', NULL, 'brother', '👦', 'hermano'),
('hermana', 'spanish', 'beginner', 'family', NULL, 'sister', '👧', 'hermana'),
('abuela', 'spanish', 'beginner', 'family', NULL, 'grandmother', '👵', 'abuela'),
('abuelo', 'spanish', 'beginner', 'family', NULL, 'grandfather', '👴', 'abuelo'),
('tía', 'spanish', 'beginner', 'family', NULL, 'aunt', '👱‍♀️', 'tía'),
('tío', 'spanish', 'beginner', 'family', NULL, 'uncle', '👱‍♂️', 'tío'),
('cabeza', 'spanish', 'intermediate', 'body', NULL, 'head', '🗣️', 'cabeza'),
('mano', 'spanish', 'intermediate', 'body', NULL, 'hand', '✋', 'mano'),
('pierna', 'spanish', 'intermediate', 'body', NULL, 'leg', '🦵', 'pierna'),
('pie', 'spanish', 'intermediate', 'body', NULL, 'foot', '🦶', 'pie'),
('ojo', 'spanish', 'intermediate', 'body', NULL, 'eye', '👁️', 'ojo'),
('oreja', 'spanish', 'intermediate', 'body', NULL, 'ear', '👂', 'oreja'),
('boca', 'spanish', 'intermediate', 'body', NULL, 'mouth', '👄', 'boca'),
('nariz', 'spanish', 'intermediate', 'body', NULL, 'nose', '👃', 'nariz'),
('coche', 'spanish', 'intermediate', 'travel', NULL, 'car', '🚗', 'coche'),
('autobús', 'spanish', 'intermediate', 'travel', NULL, 'bus', '🚌', 'autobús'),
('tren', 'spanish', 'intermediate', 'travel', NULL, 'train', '🚆', 'tren'),
('avión', 'spanish', 'intermediate', 'travel', NULL, 'plane', '✈️', 'avión'),
('billete', 'spanish', 'intermediate', 'travel', NULL, 'ticket', '🎫', 'billete'),
('hotel', 'spanish', 'intermediate', 'travel', NULL, 'hotel', '🏨', 'hotel'),
('pasaporte', 'spanish', 'intermediate', 'travel', NULL, 'passport', '🛂', 'pasaporte'),
('aeropuerto', 'spanish', 'intermediate', 'travel', NULL, 'airport', '🛫', 'aeropuerto'); 

-- QUESTIONS

-- Questions for Colors & Shapes
INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, sort_order) VALUES
('e11c8282-e565-4f40-8483-e0202e8d3eaa', 'multiple_choice', 'How do you say "negro" in English?', 'black', 'black', ARRAY['orange', 'green', 'purple'], NULL, 1),
('e11c8282-e565-4f40-8483-e0202e8d3eaa', 'multiple_choice', 'How do you say "rojo" in English?', 'red', 'red', ARRAY['orange', 'yellow', 'white'], NULL, 2),
('e11c8282-e565-4f40-8483-e0202e8d3eaa', 'image_match', 'Which word represents 🔴?', 'red', 'red', ARRAY['yellow', 'orange', 'blue'], '🔴', 3),
('e11c8282-e565-4f40-8483-e0202e8d3eaa', 'listening', 'Listen and select the correct word', 'red', 'red', ARRAY['purple', 'green', 'white'], NULL, 4),
('e11c8282-e565-4f40-8483-e0202e8d3eaa', 'multiple_choice', 'How do you say "blanco" in English?', 'white', 'white', ARRAY['orange', 'red', 'green'], NULL, 5),
('e11c8282-e565-4f40-8483-e0202e8d3eaa', 'image_match', 'Which word represents 🔵?', 'blue', 'blue', ARRAY['purple', 'green', 'white'], '🔵', 6),
('e11c8282-e565-4f40-8483-e0202e8d3eaa', 'multiple_choice', 'How do you say "rojo" in English?', 'red', 'red', ARRAY['white', 'purple', 'yellow'], NULL, 7),
('e11c8282-e565-4f40-8483-e0202e8d3eaa', 'listening', 'Listen and select the correct word', 'purple', 'purple', ARRAY['yellow', 'orange', 'green'], NULL, 8),
('e11c8282-e565-4f40-8483-e0202e8d3eaa', 'image_match', 'Which word represents 🟣?', 'purple', 'purple', ARRAY['white', 'yellow', 'blue'], '🟣', 9),
('e11c8282-e565-4f40-8483-e0202e8d3eaa', 'multiple_choice', 'How do you say "naranja" in English?', 'orange', 'orange', ARRAY['white', 'red', 'green'], NULL, 10);

-- Questions for Animals
INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, sort_order) VALUES
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'multiple_choice', 'How do you say "perro" in English?', 'dog', 'dog', ARRAY['fish', 'cow', 'cat'], NULL, 1),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'multiple_choice', 'How do you say "perro" in English?', 'dog', 'dog', ARRAY['rabbit', 'cow', 'fish'], NULL, 2),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'image_match', 'Which word represents 🐱?', 'cat', 'cat', ARRAY['horse', 'fish', 'rabbit'], '🐱', 3),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'listening', 'Listen and select the correct word', 'pig', 'pig', ARRAY['bird', 'rabbit', 'dog'], NULL, 4),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'multiple_choice', 'How do you say "pez" in English?', 'fish', 'fish', ARRAY['pig', 'cow', 'cat'], NULL, 5),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'image_match', 'Which word represents 🐄?', 'cow', 'cow', ARRAY['horse', 'rabbit', 'bird'], '🐄', 6),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'multiple_choice', 'How do you say "conejo" in English?', 'rabbit', 'rabbit', ARRAY['horse', 'fish', 'cow'], NULL, 7),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'listening', 'Listen and select the correct word', 'rabbit', 'rabbit', ARRAY['dog', 'pig', 'horse'], NULL, 8),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'image_match', 'Which word represents 🐄?', 'cow', 'cow', ARRAY['horse', 'dog', 'pig'], '🐄', 9),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'multiple_choice', 'How do you say "pájaro" in English?', 'bird', 'bird', ARRAY['cow', 'dog', 'fish'], NULL, 10);

-- Questions for Food & Drinks
INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, sort_order) VALUES
('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'multiple_choice', 'How do you say "queso" in English?', 'cheese', 'cheese', ARRAY['bread', 'water', 'meat'], NULL, 1),
('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'multiple_choice', 'How do you say "agua" in English?', 'water', 'water', ARRAY['milk', 'meat', 'bread'], NULL, 2),
('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'image_match', 'Which word represents 🥛?', 'milk', 'milk', ARRAY['cheese', 'apple', 'meat'], '🥛', 3),
('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'listening', 'Listen and select the correct word', 'cheese', 'cheese', ARRAY['milk', 'water', 'apple'], NULL, 4),
('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'multiple_choice', 'How do you say "manzana" in English?', 'apple', 'apple', ARRAY['cheese', 'egg', 'bread'], NULL, 5),
('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'image_match', 'Which word represents 🥛?', 'milk', 'milk', ARRAY['egg', 'chicken', 'bread'], '🥛', 6),
('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'multiple_choice', 'How do you say "leche" in English?', 'milk', 'milk', ARRAY['water', 'chicken', 'apple'], NULL, 7),
('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'listening', 'Listen and select the correct word', 'egg', 'egg', ARRAY['cheese', 'apple', 'meat'], NULL, 8),
('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'image_match', 'Which word represents 🍞?', 'bread', 'bread', ARRAY['milk', 'egg', 'meat'], '🍞', 9),
('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'multiple_choice', 'How do you say "pollo" in English?', 'chicken', 'chicken', ARRAY['milk', 'bread', 'water'], NULL, 10);

-- Questions for Family
INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, sort_order) VALUES
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'multiple_choice', 'How do you say "madre" in English?', 'mother', 'mother', ARRAY['brother', 'father', 'grandmother'], NULL, 1),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'multiple_choice', 'How do you say "padre" in English?', 'father', 'father', ARRAY['grandmother', 'aunt', 'grandfather'], NULL, 2),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'image_match', 'Which word represents 👴?', 'grandfather', 'grandfather', ARRAY['aunt', 'brother', 'grandmother'], '👴', 3),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'listening', 'Listen and select the correct word', 'brother', 'brother', ARRAY['mother', 'father', 'sister'], NULL, 4),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'multiple_choice', 'How do you say "abuela" in English?', 'grandmother', 'grandmother', ARRAY['mother', 'father', 'brother'], NULL, 5),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'image_match', 'Which word represents 👨?', 'father', 'father', ARRAY['aunt', 'grandfather', 'mother'], '👨', 6),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'multiple_choice', 'How do you say "abuelo" in English?', 'grandfather', 'grandfather', ARRAY['father', 'grandmother', 'mother'], NULL, 7),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'listening', 'Listen and select the correct word', 'uncle', 'uncle', ARRAY['father', 'grandfather', 'mother'], NULL, 8),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'image_match', 'Which word represents 👨?', 'father', 'father', ARRAY['aunt', 'grandmother', 'grandfather'], '👨', 9),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'multiple_choice', 'How do you say "hermana" in English?', 'sister', 'sister', ARRAY['brother', 'grandfather', 'aunt'], NULL, 10);

-- Questions for Parts of the Body
INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, sort_order) VALUES
('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'multiple_choice', 'How do you say "cabeza" in English?', 'head', 'head', ARRAY['mouth', 'ear', 'eye'], NULL, 1),
('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'multiple_choice', 'How do you say "boca" in English?', 'mouth', 'mouth', ARRAY['nose', 'leg', 'head'], NULL, 2),
('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'image_match', 'Which word represents 👁️?', 'eye', 'eye', ARRAY['ear', 'leg', 'head'], '👁️', 3),
('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'listening', 'Listen and select the correct word', 'leg', 'leg', ARRAY['hand', 'foot', 'ear'], NULL, 4),
('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'multiple_choice', 'How do you say "cabeza" in English?', 'head', 'head', ARRAY['nose', 'hand', 'mouth'], NULL, 5),
('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'image_match', 'Which word represents 👃?', 'nose', 'nose', ARRAY['ear', 'head', 'leg'], '👃', 6),
('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'multiple_choice', 'How do you say "cabeza" in English?', 'head', 'head', ARRAY['leg', 'eye', 'foot'], NULL, 7),
('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'listening', 'Listen and select the correct word', 'ear', 'ear', ARRAY['foot', 'leg', 'mouth'], NULL, 8),
('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'image_match', 'Which word represents ✋?', 'hand', 'hand', ARRAY['head', 'nose', 'ear'], '✋', 9),
('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'multiple_choice', 'How do you say "cabeza" in English?', 'head', 'head', ARRAY['hand', 'leg', 'mouth'], NULL, 10);

-- Questions for Travel & Transport
INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, sort_order) VALUES
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'multiple_choice', 'How do you say "hotel" in English?', 'hotel', 'hotel', ARRAY['plane', 'ticket', 'car'], NULL, 1),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'multiple_choice', 'How do you say "hotel" in English?', 'hotel', 'hotel', ARRAY['bus', 'airport', 'car'], NULL, 2),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'image_match', 'Which word represents 🚌?', 'bus', 'bus', ARRAY['train', 'passport', 'hotel'], '🚌', 3),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'listening', 'Listen and select the correct word', 'car', 'car', ARRAY['airport', 'hotel', 'plane'], NULL, 4),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'multiple_choice', 'How do you say "autobús" in English?', 'bus', 'bus', ARRAY['car', 'airport', 'passport'], NULL, 5),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'image_match', 'Which word represents 🛂?', 'passport', 'passport', ARRAY['train', 'bus', 'plane'], '🛂', 6),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'multiple_choice', 'How do you say "tren" in English?', 'train', 'train', ARRAY['ticket', 'bus', 'plane'], NULL, 7),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'listening', 'Listen and select the correct word', 'passport', 'passport', ARRAY['plane', 'bus', 'hotel'], NULL, 8),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'image_match', 'Which word represents ✈️?', 'plane', 'plane', ARRAY['car', 'hotel', 'passport'], '✈️', 9),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'multiple_choice', 'How do you say "autobús" in English?', 'bus', 'bus', ARRAY['train', 'passport', 'car'], NULL, 10);

-- Questions for Los Colores y Formas
INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, sort_order) VALUES
('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'multiple_choice', 'How do you say "white" in Spanish?', 'blanco', 'blanco', ARRAY['morado', 'verde', 'naranja'], NULL, 1),
('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'multiple_choice', 'How do you say "blue" in Spanish?', 'azul', 'azul', ARRAY['naranja', 'blanco', 'verde'], NULL, 2),
('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'image_match', 'Which word represents 🟣?', 'morado', 'morado', ARRAY['rojo', 'negro', 'azul'], '🟣', 3),
('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'listening', 'Listen and select the correct word', 'azul', 'azul', ARRAY['amarillo', 'rojo', 'verde'], NULL, 4),
('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'multiple_choice', 'How do you say "blue" in Spanish?', 'azul', 'azul', ARRAY['naranja', 'negro', 'amarillo'], NULL, 5),
('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'image_match', 'Which word represents 🟠?', 'naranja', 'naranja', ARRAY['verde', 'morado', 'negro'], '🟠', 6),
('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'multiple_choice', 'How do you say "red" in Spanish?', 'rojo', 'rojo', ARRAY['naranja', 'blanco', 'morado'], NULL, 7),
('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'listening', 'Listen and select the correct word', 'blanco', 'blanco', ARRAY['naranja', 'rojo', 'negro'], NULL, 8),
('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'image_match', 'Which word represents 🟡?', 'amarillo', 'amarillo', ARRAY['blanco', 'verde', 'negro'], '🟡', 9),
('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'multiple_choice', 'How do you say "orange" in Spanish?', 'naranja', 'naranja', ARRAY['amarillo', 'negro', 'morado'], NULL, 10);

-- Questions for Los Animales
INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, sort_order) VALUES
('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'multiple_choice', 'How do you say "fish" in Spanish?', 'pez', 'pez', ARRAY['gato', 'vaca', 'cerdo'], NULL, 1),
('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'multiple_choice', 'How do you say "cow" in Spanish?', 'vaca', 'vaca', ARRAY['gato', 'pez', 'conejo'], NULL, 2),
('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'image_match', 'Which word represents 🐷?', 'cerdo', 'cerdo', ARRAY['pájaro', 'conejo', 'pez'], '🐷', 3),
('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'listening', 'Listen and select the correct word', 'perro', 'perro', ARRAY['cerdo', 'gato', 'conejo'], NULL, 4),
('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'multiple_choice', 'How do you say "bird" in Spanish?', 'pájaro', 'pájaro', ARRAY['cerdo', 'gato', 'vaca'], NULL, 5),
('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'image_match', 'Which word represents 🐱?', 'gato', 'gato', ARRAY['conejo', 'perro', 'pez'], '🐱', 6),
('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'multiple_choice', 'How do you say "bird" in Spanish?', 'pájaro', 'pájaro', ARRAY['vaca', 'pez', 'conejo'], NULL, 7),
('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'listening', 'Listen and select the correct word', 'caballo', 'caballo', ARRAY['perro', 'vaca', 'pez'], NULL, 8),
('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'image_match', 'Which word represents 🐦?', 'pájaro', 'pájaro', ARRAY['pez', 'cerdo', 'gato'], '🐦', 9),
('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'multiple_choice', 'How do you say "rabbit" in Spanish?', 'conejo', 'conejo', ARRAY['vaca', 'pez', 'perro'], NULL, 10);

-- Questions for Comida y Bebidas
INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, sort_order) VALUES
('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'multiple_choice', 'How do you say "cheese" in Spanish?', 'queso', 'queso', ARRAY['pollo', 'pan', 'manzana'], NULL, 1),
('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'multiple_choice', 'How do you say "meat" in Spanish?', 'carne', 'carne', ARRAY['huevo', 'manzana', 'agua'], NULL, 2),
('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'image_match', 'Which word represents 🍗?', 'pollo', 'pollo', ARRAY['manzana', 'carne', 'queso'], '🍗', 3),
('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'listening', 'Listen and select the correct word', 'agua', 'agua', ARRAY['leche', 'pan', 'carne'], NULL, 4),
('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'multiple_choice', 'How do you say "milk" in Spanish?', 'leche', 'leche', ARRAY['manzana', 'carne', 'pollo'], NULL, 5),
('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'image_match', 'Which word represents 🥩?', 'carne', 'carne', ARRAY['pollo', 'pan', 'agua'], '🥩', 6),
('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'multiple_choice', 'How do you say "water" in Spanish?', 'agua', 'agua', ARRAY['leche', 'queso', 'carne'], NULL, 7),
('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'listening', 'Listen and select the correct word', 'pan', 'pan', ARRAY['manzana', 'huevo', 'queso'], NULL, 8),
('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'image_match', 'Which word represents 🥚?', 'huevo', 'huevo', ARRAY['manzana', 'queso', 'pollo'], '🥚', 9),
('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'multiple_choice', 'How do you say "chicken" in Spanish?', 'pollo', 'pollo', ARRAY['agua', 'huevo', 'pan'], NULL, 10);

-- Questions for Mi Familia
INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, sort_order) VALUES
('0d1e2f3a-4b5c-6d7e-8f9a-0b1c2d3e4f5a', 'multiple_choice', 'How do you say "mother" in Spanish?', 'madre', 'madre', ARRAY['padre', 'abuela', 'hermana'], NULL, 1),
('0d1e2f3a-4b5c-6d7e-8f9a-0b1c2d3e4f5a', 'multiple_choice', 'How do you say "grandmother" in Spanish?', 'abuela', 'abuela', ARRAY['tía', 'hermana', 'abuelo'], NULL, 2),
('0d1e2f3a-4b5c-6d7e-8f9a-0b1c2d3e4f5a', 'image_match', 'Which word represents 👵?', 'abuela', 'abuela', ARRAY['tío', 'padre', 'hermana'], '👵', 3),
('0d1e2f3a-4b5c-6d7e-8f9a-0b1c2d3e4f5a', 'listening', 'Listen and select the correct word', 'madre', 'madre', ARRAY['abuelo', 'hermano', 'padre'], NULL, 4),
('0d1e2f3a-4b5c-6d7e-8f9a-0b1c2d3e4f5a', 'multiple_choice', 'How do you say "father" in Spanish?', 'padre', 'padre', ARRAY['madre', 'tía', 'hermano'], NULL, 5),
('0d1e2f3a-4b5c-6d7e-8f9a-0b1c2d3e4f5a', 'image_match', 'Which word represents 👱‍♀️?', 'tía', 'tía', ARRAY['abuelo', 'abuela', 'padre'], '👱‍♀️', 6),
('0d1e2f3a-4b5c-6d7e-8f9a-0b1c2d3e4f5a', 'multiple_choice', 'How do you say "uncle" in Spanish?', 'tío', 'tío', ARRAY['padre', 'hermano', 'tía'], NULL, 7),
('0d1e2f3a-4b5c-6d7e-8f9a-0b1c2d3e4f5a', 'listening', 'Listen and select the correct word', 'abuelo', 'abuelo', ARRAY['tío', 'tía', 'madre'], NULL, 8),
('0d1e2f3a-4b5c-6d7e-8f9a-0b1c2d3e4f5a', 'image_match', 'Which word represents 👩?', 'madre', 'madre', ARRAY['hermana', 'abuela', 'padre'], '👩', 9),
('0d1e2f3a-4b5c-6d7e-8f9a-0b1c2d3e4f5a', 'multiple_choice', 'How do you say "uncle" in Spanish?', 'tío', 'tío', ARRAY['hermano', 'tía', 'madre'], NULL, 10);

-- Questions for Partes del Cuerpo
INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, sort_order) VALUES
('1e2f3a4b-5c6d-7e8f-9a0b-1c2d3e4f5a6b', 'multiple_choice', 'How do you say "foot" in Spanish?', 'pie', 'pie', ARRAY['oreja', 'nariz', 'ojo'], NULL, 1),
('1e2f3a4b-5c6d-7e8f-9a0b-1c2d3e4f5a6b', 'multiple_choice', 'How do you say "foot" in Spanish?', 'pie', 'pie', ARRAY['cabeza', 'nariz', 'mano'], NULL, 2),
('1e2f3a4b-5c6d-7e8f-9a0b-1c2d3e4f5a6b', 'image_match', 'Which word represents 👂?', 'oreja', 'oreja', ARRAY['pie', 'pierna', 'boca'], '👂', 3),
('1e2f3a4b-5c6d-7e8f-9a0b-1c2d3e4f5a6b', 'listening', 'Listen and select the correct word', 'oreja', 'oreja', ARRAY['boca', 'pierna', 'nariz'], NULL, 4),
('1e2f3a4b-5c6d-7e8f-9a0b-1c2d3e4f5a6b', 'multiple_choice', 'How do you say "nose" in Spanish?', 'nariz', 'nariz', ARRAY['pierna', 'mano', 'oreja'], NULL, 5),
('1e2f3a4b-5c6d-7e8f-9a0b-1c2d3e4f5a6b', 'image_match', 'Which word represents 👄?', 'boca', 'boca', ARRAY['nariz', 'cabeza', 'pie'], '👄', 6),
('1e2f3a4b-5c6d-7e8f-9a0b-1c2d3e4f5a6b', 'multiple_choice', 'How do you say "leg" in Spanish?', 'pierna', 'pierna', ARRAY['nariz', 'cabeza', 'mano'], NULL, 7),
('1e2f3a4b-5c6d-7e8f-9a0b-1c2d3e4f5a6b', 'listening', 'Listen and select the correct word', 'ojo', 'ojo', ARRAY['pierna', 'boca', 'cabeza'], NULL, 8),
('1e2f3a4b-5c6d-7e8f-9a0b-1c2d3e4f5a6b', 'image_match', 'Which word represents 🗣️?', 'cabeza', 'cabeza', ARRAY['nariz', 'oreja', 'mano'], '🗣️', 9),
('1e2f3a4b-5c6d-7e8f-9a0b-1c2d3e4f5a6b', 'multiple_choice', 'How do you say "hand" in Spanish?', 'mano', 'mano', ARRAY['nariz', 'cabeza', 'pierna'], NULL, 10);

-- Questions for Viajes y Transporte
INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, sort_order) VALUES
('2f3a4b5c-6d7e-8f9a-0b1c-2d3e4f5a6b7c', 'multiple_choice', 'How do you say "car" in Spanish?', 'coche', 'coche', ARRAY['billete', 'hotel', 'autobús'], NULL, 1),
('2f3a4b5c-6d7e-8f9a-0b1c-2d3e4f5a6b7c', 'multiple_choice', 'How do you say "train" in Spanish?', 'tren', 'tren', ARRAY['aeropuerto', 'billete', 'coche'], NULL, 2),
('2f3a4b5c-6d7e-8f9a-0b1c-2d3e4f5a6b7c', 'image_match', 'Which word represents 🚌?', 'autobús', 'autobús', ARRAY['pasaporte', 'billete', 'hotel'], '🚌', 3),
('2f3a4b5c-6d7e-8f9a-0b1c-2d3e4f5a6b7c', 'listening', 'Listen and select the correct word', 'avión', 'avión', ARRAY['billete', 'aeropuerto', 'coche'], NULL, 4),
('2f3a4b5c-6d7e-8f9a-0b1c-2d3e4f5a6b7c', 'multiple_choice', 'How do you say "ticket" in Spanish?', 'billete', 'billete', ARRAY['tren', 'aeropuerto', 'autobús'], NULL, 5),
('2f3a4b5c-6d7e-8f9a-0b1c-2d3e4f5a6b7c', 'image_match', 'Which word represents 🚗?', 'coche', 'coche', ARRAY['avión', 'autobús', 'tren'], '🚗', 6),
('2f3a4b5c-6d7e-8f9a-0b1c-2d3e4f5a6b7c', 'multiple_choice', 'How do you say "train" in Spanish?', 'tren', 'tren', ARRAY['hotel', 'avión', 'billete'], NULL, 7),
('2f3a4b5c-6d7e-8f9a-0b1c-2d3e4f5a6b7c', 'listening', 'Listen and select the correct word', 'coche', 'coche', ARRAY['tren', 'pasaporte', 'aeropuerto'], NULL, 8),
('2f3a4b5c-6d7e-8f9a-0b1c-2d3e4f5a6b7c', 'image_match', 'Which word represents 🚗?', 'coche', 'coche', ARRAY['autobús', 'tren', 'hotel'], '🚗', 9),
('2f3a4b5c-6d7e-8f9a-0b1c-2d3e4f5a6b7c', 'multiple_choice', 'How do you say "airport" in Spanish?', 'aeropuerto', 'aeropuerto', ARRAY['autobús', 'hotel', 'avión'], NULL, 10);
