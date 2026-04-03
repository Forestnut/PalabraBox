-- Migration auto-generated for content update

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('06911f6e-9364-b54b-ddd1-d5e5b8deada8', 'simple_situations', 'beginner', 400)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('bb1ad7d9-d2f6-80ee-7c9f-e692ffa62d74', '06911f6e-9364-b54b-ddd1-d5e5b8deada8', 'en', 'Shopping', 'Learn essential vocabulary for shopping.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('7a2e32d2-c3b4-9204-4b5a-2ab2ac5f4d9b', '06911f6e-9364-b54b-ddd1-d5e5b8deada8', 'es', 'De compras', 'Aprende vocabulario esencial para ir de compras.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (base_key, category, level)
VALUES ('price', 'simple_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'price'), 'en', 'price', 'price')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'price'), 'es', 'precio', 'precio')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('money', 'simple_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'money'), 'en', 'money', 'money')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'money'), 'es', 'dinero', 'dinero')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('shop', 'simple_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'shop'), 'en', 'shop', 'shop')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'shop'), 'es', 'tienda', 'tienda')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('buy', 'simple_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'buy'), 'en', 'to buy', 'to buy')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'buy'), 'es', 'comprar', 'comprar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'c2fe9b14-baa0-a5ae-c8cd-02d3ef242795',
  '06911f6e-9364-b54b-ddd1-d5e5b8deada8',
  'multiple_choice',
  'How do you say ''price'' in Spanish?',
  1,
  '{"options":["dinero","precio","tienda","comprar"],"correct":"precio"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'd749e4da-8465-bc05-1f01-d3b98d5be027',
  '06911f6e-9364-b54b-ddd1-d5e5b8deada8',
  'multiple_choice',
  'Translate ''money'' to Spanish.',
  2,
  '{"options":["precio","tienda","comprar","dinero"],"correct":"dinero"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('55cf7dc4-248c-02fe-b166-fec134d8f02e', 'simple_situations', 'beginner', 401)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('f45aad56-5fe6-d8fd-834e-d8e83763e3f0', '55cf7dc4-248c-02fe-b166-fec134d8f02e', 'en', 'Restaurant', 'Basic words and phrases for eating out.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('50248043-a167-e0f3-3e64-d8ea37982aec', '55cf7dc4-248c-02fe-b166-fec134d8f02e', 'es', 'Restaurante', 'Palabras y frases básicas para salir a comer.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (base_key, category, level)
VALUES ('menu', 'simple_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'menu'), 'en', 'menu', 'menu')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'menu'), 'es', 'menú', 'menú')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('order', 'simple_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'order'), 'en', 'to order', 'to order')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'order'), 'es', 'pedir', 'pedir')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('food', 'simple_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'food'), 'en', 'food', 'food')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'food'), 'es', 'comida', 'comida')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('water_2', 'simple_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'water_2'), 'en', 'water', 'water')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'water_2'), 'es', 'agua', 'agua')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'e5f8c23b-1416-205f-3bc8-52007a0844d0',
  '55cf7dc4-248c-02fe-b166-fec134d8f02e',
  'multiple_choice',
  'What is the Spanish word for ''menu''?',
  1,
  '{"options":["comida","agua","pedir","menú"],"correct":"menú"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'ca1b0744-69c3-a439-95ae-095b8b9898f9',
  '55cf7dc4-248c-02fe-b166-fec134d8f02e',
  'multiple_choice',
  'How do you say ''to order'' (as in a restaurant) in Spanish?',
  2,
  '{"options":["pedir","menú","agua","comida"],"correct":"pedir"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('873b34b6-ea4b-7e32-1d02-d04e66b8a3da', 'simple_situations', 'beginner', 402)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('4ab93039-371d-6a4d-8f89-0fe702662ebb', '873b34b6-ea4b-7e32-1d02-d04e66b8a3da', 'en', 'Travel Basics', 'Essential words for navigating a trip.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('d436abe5-f8f1-c252-8194-5bcfed75510f', '873b34b6-ea4b-7e32-1d02-d04e66b8a3da', 'es', 'Viajes Básico', 'Palabras esenciales para navegar en un viaje.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (base_key, category, level)
VALUES ('hotel', 'simple_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'hotel'), 'en', 'hotel', 'hotel')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'hotel'), 'es', 'hotel', 'hotel')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('ticket', 'simple_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'ticket'), 'en', 'ticket', 'ticket')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'ticket'), 'es', 'boleto', 'boleto')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('airport', 'simple_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'airport'), 'en', 'airport', 'airport')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'airport'), 'es', 'aeropuerto', 'aeropuerto')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('train', 'simple_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'train'), 'en', 'train', 'train')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'train'), 'es', 'tren', 'tren')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '7b47a6a7-1a3d-78de-576e-d15eed79c76d',
  '873b34b6-ea4b-7e32-1d02-d04e66b8a3da',
  'multiple_choice',
  'How do you say ''hotel'' in Spanish?',
  1,
  '{"options":["boleto","aeropuerto","tren","hotel"],"correct":"hotel"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '9d56013d-6e9c-1cbd-9c07-a99855cf8088',
  '873b34b6-ea4b-7e32-1d02-d04e66b8a3da',
  'multiple_choice',
  'What is the Spanish word for ''ticket''?',
  2,
  '{"options":["tren","boleto","hotel","aeropuerto"],"correct":"boleto"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

