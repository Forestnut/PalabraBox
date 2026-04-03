-- Migration auto-generated for content update

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('572d450b-daeb-f6cc-f44b-304212a3b6e2', 'daily_life', 'beginner', 300)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('adcab031-5236-09db-4406-1cda046debf3', '572d450b-daeb-f6cc-f44b-304212a3b6e2', 'en', 'Daily Routine', 'Learn to talk about your daily habits.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('60b4bf25-5804-f504-a894-82d1eac6f19b', '572d450b-daeb-f6cc-f44b-304212a3b6e2', 'es', 'Rutina diaria', 'Aprende a hablar de tus hábitos diarios.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (base_key, category, level)
VALUES ('wake_up', 'daily_life', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'wake_up'), 'en', 'wake up', 'wake up')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'wake_up'), 'es', 'despertarse', 'despertarse')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('work', 'daily_life', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'work'), 'en', 'work', 'work')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'work'), 'es', 'trabajar', 'trabajar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('sleep', 'daily_life', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'sleep'), 'en', 'sleep', 'sleep')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'sleep'), 'es', 'dormir', 'dormir')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('eat_breakfast', 'daily_life', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'eat_breakfast'), 'en', 'eat breakfast', 'eat breakfast')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'eat_breakfast'), 'es', 'desayunar', 'desayunar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('eat_lunch', 'daily_life', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'eat_lunch'), 'en', 'eat lunch', 'eat lunch')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'eat_lunch'), 'es', 'comer', 'comer')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('eat_dinner', 'daily_life', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'eat_dinner'), 'en', 'eat dinner', 'eat dinner')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'eat_dinner'), 'es', 'cenar', 'cenar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('morning', 'daily_life', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'morning'), 'en', 'morning', 'morning')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'morning'), 'es', 'mañana', 'mañana')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('night', 'daily_life', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'night'), 'en', 'night', 'night')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'night'), 'es', 'noche', 'noche')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('afternoon', 'daily_life', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'afternoon'), 'en', 'afternoon', 'afternoon')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'afternoon'), 'es', 'tarde', 'tarde')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '0b6f7802-989e-5936-346a-8419d01da8dd',
  '572d450b-daeb-f6cc-f44b-304212a3b6e2',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"Me despierto","options":["Me despierto","Duermo","Ceno","Adiós"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'c1f52a3f-b54c-fbc3-8658-b30439001ab7',
  '572d450b-daeb-f6cc-f44b-304212a3b6e2',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"cenar","options":["cenar","comer","desayunar","trabajar"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '03fd9403-965b-d1bb-a0f7-a97660949f7f',
  '572d450b-daeb-f6cc-f44b-304212a3b6e2',
  'listening',
  'undefined',
  3,
  '{"correct":"I sleep at night.","audio_text":"Yo duermo por la noche."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '18e4294c-11d8-db96-b246-c0b421c90d5b',
  '572d450b-daeb-f6cc-f44b-304212a3b6e2',
  'fill_blank',
  'undefined',
  4,
  '{"correct":"trabajo","text_before":"Yo ","text_after":" en una oficina todos los días."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'e9d2a11a-63ba-2711-10b2-d0b9ae5357d4',
  '572d450b-daeb-f6cc-f44b-304212a3b6e2',
  'fill_blank',
  'undefined',
  5,
  '{"correct":"desayuno","text_before":"Por la mañana, yo ","text_after":" pan con café."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '21c7ef9a-0088-4624-61d9-6201905e451d',
  '572d450b-daeb-f6cc-f44b-304212a3b6e2',
  'fill_blank',
  'undefined',
  6,
  '{"correct":"cenamos","text_before":"Nosotros ","text_after":" muy tarde por la noche."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '609291cd-e19a-4bf0-83a4-0a019f033040',
  '572d450b-daeb-f6cc-f44b-304212a3b6e2',
  'fill_blank',
  'undefined',
  7,
  '{"correct":"dormir","text_before":"Es hora de ","text_after":" porque estoy cansado."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '6d5625d6-622a-3e92-001a-e82b4b29e33e',
  '572d450b-daeb-f6cc-f44b-304212a3b6e2',
  'fill_blank',
  'undefined',
  8,
  '{"correct":"Me despierto","text_before":"","text_after":" a las siete de la mañana."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'b887a53d-f2fe-5d58-9972-7ccf631605a4',
  '572d450b-daeb-f6cc-f44b-304212a3b6e2',
  'fill_blank',
  'undefined',
  9,
  '{"correct":"tarde","text_before":"Nos vemos esta ","text_after":" después del trabajo."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '40fd1e77-609c-4a4e-0602-ca2ff4776f8d',
  '572d450b-daeb-f6cc-f44b-304212a3b6e2',
  'word_order',
  'undefined',
  10,
  '{"correct":["Me","despierto","temprano","hoy"],"words":["Me","despierto","temprano","hoy","duermo"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'e6d6ef39-08f0-2548-563f-cd32ab963e57',
  '572d450b-daeb-f6cc-f44b-304212a3b6e2',
  'word_order',
  'undefined',
  11,
  '{"correct":["Trabajo","por","la","mañana"],"words":["Trabajo","por","la","mañana","noche"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '021278d8-ab8d-6315-9bd1-07c6c8b2fd34',
  '572d450b-daeb-f6cc-f44b-304212a3b6e2',
  'word_order',
  'undefined',
  12,
  '{"correct":["Me","gusta","dormir","mucho"],"words":["Me","gusta","dormir","mucho","cenar"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'a1d1b76c-63d7-18a6-7db3-a2d438726853',
  '572d450b-daeb-f6cc-f44b-304212a3b6e2',
  'word_order',
  'undefined',
  13,
  '{"correct":["Yo","desayuno","con","mi","gato"],"words":["Yo","desayuno","con","mi","gato","perro"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'a8d23493-767d-09a2-593b-992d747f6efa',
  '572d450b-daeb-f6cc-f44b-304212a3b6e2',
  'word_order',
  'undefined',
  14,
  '{"correct":["Comemos","tarde","los","domingos"],"words":["Comemos","tarde","los","domingos","Me"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'a6132611-5d5e-7bb3-986e-e1a453330120',
  '572d450b-daeb-f6cc-f44b-304212a3b6e2',
  'word_order',
  'undefined',
  15,
  '{"correct":["Ella","duerme","toda","la","noche"],"words":["Ella","duerme","toda","la","noche","gusta"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('f53bf0d1-e871-ad1e-0ac3-0cc5544add3f', 'basics', 'beginner', 301)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('41a21fe7-919c-b10e-9094-89c2c88130a0', 'f53bf0d1-e871-ad1e-0ac3-0cc5544add3f', 'en', 'Places', 'Talk about places in the city.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('1ffc77f0-f2d9-41d2-b010-abee6f7cd94c', 'f53bf0d1-e871-ad1e-0ac3-0cc5544add3f', 'es', 'Lugares', 'Habla sobre lugares en la ciudad.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (base_key, category, level)
VALUES ('home', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'home'), 'en', 'home', 'home')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'home'), 'es', 'la casa', 'la casa')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('school', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'school'), 'en', 'school', 'school')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'school'), 'es', 'la escuela', 'la escuela')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('city', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'city'), 'en', 'city', 'city')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'city'), 'es', 'la ciudad', 'la ciudad')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('street', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'street'), 'en', 'street', 'street')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'street'), 'es', 'la calle', 'la calle')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('park', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'park'), 'en', 'park', 'park')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'park'), 'es', 'el parque', 'el parque')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('shop', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'shop'), 'en', 'shop/store', 'shop/store')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'shop'), 'es', 'la tienda', 'la tienda')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('bank', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'bank'), 'en', 'bank', 'bank')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'bank'), 'es', 'el banco', 'el banco')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('go', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'go'), 'en', 'to go', 'to go')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'go'), 'es', 'ir', 'ir')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('be_location', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'be_location'), 'en', 'to be (location)', 'to be (location)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'be_location'), 'es', 'estar', 'estar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '1e3971df-3b5a-41f2-8e5c-46ab83f0a750',
  'f53bf0d1-e871-ad1e-0ac3-0cc5544add3f',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"la escuela","options":["la escuela","el parque","el banco","la calle"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '6f12c64a-b4ba-b0d9-7753-9e401a16e375',
  'f53bf0d1-e871-ad1e-0ac3-0cc5544add3f',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"la ciudad","options":["la ciudad","la calle","la casa","el parque"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '64199fb5-7379-0976-e3ec-b882cc07b85c',
  'f53bf0d1-e871-ad1e-0ac3-0cc5544add3f',
  'listening',
  'undefined',
  3,
  '{"correct":"I go to the park.","audio_text":"Yo voy al parque."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'c4f848a4-d561-838d-2f89-7fe6efcdf79b',
  'f53bf0d1-e871-ad1e-0ac3-0cc5544add3f',
  'fill_blank',
  'undefined',
  4,
  '{"correct":"casa","text_before":"Mi ","text_after":" es muy bonita."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'da8165c1-5486-a8b0-e76b-3ec964a90f5e',
  'f53bf0d1-e871-ad1e-0ac3-0cc5544add3f',
  'fill_blank',
  'undefined',
  5,
  '{"correct":"tienda","text_before":"Compro leche en la ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '14632fd9-4ce4-9618-7177-5e3ae918e410',
  'f53bf0d1-e871-ad1e-0ac3-0cc5544add3f',
  'fill_blank',
  'undefined',
  6,
  '{"correct":"calle","text_before":"Camino por la ","text_after":" principal."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '719d7082-151d-5f4d-d95d-a938209e374c',
  'f53bf0d1-e871-ad1e-0ac3-0cc5544add3f',
  'fill_blank',
  'undefined',
  7,
  '{"correct":"banco","text_before":"Tengo dinero en el ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '330fae86-b89b-b2d3-b1b3-bd1e7c1f0ac1',
  'f53bf0d1-e871-ad1e-0ac3-0cc5544add3f',
  'fill_blank',
  'undefined',
  8,
  '{"correct":"escuela","text_before":"Los niños están en la ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '21808c75-befb-3660-a363-d6d6848e4ef5',
  'f53bf0d1-e871-ad1e-0ac3-0cc5544add3f',
  'fill_blank',
  'undefined',
  9,
  '{"correct":"ciudad","text_before":"Madrid es una ","text_after":" muy grande."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '07aa2ecc-d983-ed76-8875-baf0b2e54f24',
  'f53bf0d1-e871-ad1e-0ac3-0cc5544add3f',
  'word_order',
  'undefined',
  10,
  '{"correct":["Voy","a","mi","casa"],"words":["Voy","a","mi","casa","banco"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '50dc694d-de61-20be-21eb-6a7424d5adbe',
  'f53bf0d1-e871-ad1e-0ac3-0cc5544add3f',
  'word_order',
  'undefined',
  11,
  '{"correct":["El","parque","es","grande"],"words":["El","parque","es","grande","Voy"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'f9874bb0-18b0-1c84-16f1-7d425a4dfb4a',
  'f53bf0d1-e871-ad1e-0ac3-0cc5544add3f',
  'word_order',
  'undefined',
  12,
  '{"correct":["Estoy","en","la","calle"],"words":["Estoy","en","la","calle","tienda"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '3becdc42-1143-41be-b317-7f961be33433',
  'f53bf0d1-e871-ad1e-0ac3-0cc5544add3f',
  'word_order',
  'undefined',
  13,
  '{"correct":["Ella","camina","por","la","ciudad"],"words":["Ella","camina","por","la","ciudad","casa"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'ae57fb0a-98b9-5238-2a3a-4491225864d8',
  'f53bf0d1-e871-ad1e-0ac3-0cc5544add3f',
  'word_order',
  'undefined',
  14,
  '{"correct":["Nosotros","vamos","a","la","tienda"],"words":["Nosotros","vamos","a","la","tienda","Voy"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '60e4cee5-23c6-3051-2813-ec0bd24f5a73',
  'f53bf0d1-e871-ad1e-0ac3-0cc5544add3f',
  'word_order',
  'undefined',
  15,
  '{"correct":["¿Dónde","está","el","banco?"],"words":["¿Dónde","está","el","banco?","calle"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('06911f6e-9364-b54b-ddd1-d5e5b8deada8', 'basic_situations', 'beginner', 302)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('bb1ad7d9-d2f6-80ee-7c9f-e692ffa62d74', '06911f6e-9364-b54b-ddd1-d5e5b8deada8', 'en', 'Shopping', 'Vocabulary for shopping and money.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('7a2e32d2-c3b4-9204-4b5a-2ab2ac5f4d9b', '06911f6e-9364-b54b-ddd1-d5e5b8deada8', 'es', 'De compras', 'Vocabulario para comprar y dinero.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (base_key, category, level)
VALUES ('price', 'basic_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'price'), 'en', 'price', 'price')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'price'), 'es', 'el precio', 'el precio')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('money', 'basic_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'money'), 'en', 'money', 'money')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'money'), 'es', 'el dinero', 'el dinero')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('expensive', 'basic_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'expensive'), 'en', 'expensive', 'expensive')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'expensive'), 'es', 'caro', 'caro')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('cheap', 'basic_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'cheap'), 'en', 'cheap', 'cheap')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'cheap'), 'es', 'barato', 'barato')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('buy', 'basic_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'buy'), 'en', 'to buy', 'to buy')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'buy'), 'es', 'comprar', 'comprar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('sell', 'basic_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'sell'), 'en', 'to sell', 'to sell')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'sell'), 'es', 'vender', 'vender')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('clothes', 'basic_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'clothes'), 'en', 'clothes', 'clothes')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'clothes'), 'es', 'la ropa', 'la ropa')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('pay', 'basic_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'pay'), 'en', 'to pay', 'to pay')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'pay'), 'es', 'pagar', 'pagar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('cost', 'basic_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'cost'), 'en', 'to cost', 'to cost')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'cost'), 'es', 'costar', 'costar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'fec0917e-3c5f-5c0b-8720-5e0ce2f6f408',
  '06911f6e-9364-b54b-ddd1-d5e5b8deada8',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"barato","options":["barato","dinero","precio","ropa"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '83fe7454-1113-93a9-e563-706043c7296f',
  '06911f6e-9364-b54b-ddd1-d5e5b8deada8',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"el dinero","options":["el dinero","el precio","comprar","pagar"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '65d51a18-afc2-9a14-1371-0cc33659c591',
  '06911f6e-9364-b54b-ddd1-d5e5b8deada8',
  'listening',
  'undefined',
  3,
  '{"correct":"I want to buy clothes.","audio_text":"Quiero comprar ropa."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '8f03b198-b1db-8785-4ea3-f2d20dba92e4',
  '06911f6e-9364-b54b-ddd1-d5e5b8deada8',
  'fill_blank',
  'undefined',
  4,
  '{"correct":"caro","text_before":"Este teléfono es muy ","text_after":", no tengo dinero."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'bead029a-c694-1d3c-09fa-822aefb9e174',
  '06911f6e-9364-b54b-ddd1-d5e5b8deada8',
  'fill_blank',
  'undefined',
  5,
  '{"correct":"barato","text_before":"Ese libro es muy ","text_after":", solo cuesta un euro."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '6a6de80a-febd-8386-38ca-6b9013e9bbef',
  '06911f6e-9364-b54b-ddd1-d5e5b8deada8',
  'fill_blank',
  'undefined',
  6,
  '{"correct":"dinero","text_before":"Necesito más ","text_after":" para pagar."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '01cf95e1-4518-3423-f172-1983aaba5280',
  '06911f6e-9364-b54b-ddd1-d5e5b8deada8',
  'fill_blank',
  'undefined',
  7,
  '{"correct":"comprar","text_before":"Voy a la tienda a ","text_after":" comida."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'f8354c63-162d-7f1c-3306-c6f57e7a9232',
  '06911f6e-9364-b54b-ddd1-d5e5b8deada8',
  'fill_blank',
  'undefined',
  8,
  '{"correct":"precio","text_before":"¿Cuál es el ","text_after":" de esto?"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '5d16a71a-81e5-1aeb-1e33-07a3f6ca57a1',
  '06911f6e-9364-b54b-ddd1-d5e5b8deada8',
  'fill_blank',
  'undefined',
  9,
  '{"correct":"ropa","text_before":"Me gusta mucho esta ","text_after":" nueva."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'da7faba9-d595-1488-3724-7f399330a8e2',
  '06911f6e-9364-b54b-ddd1-d5e5b8deada8',
  'word_order',
  'undefined',
  10,
  '{"correct":["Tiene","un","buen","precio"],"words":["Tiene","un","buen","precio","vender"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'e1f900ec-1621-23e4-f104-b35c0e1d26cf',
  '06911f6e-9364-b54b-ddd1-d5e5b8deada8',
  'word_order',
  'undefined',
  11,
  '{"correct":["Quiero","comprar","esta","ropa"],"words":["Quiero","comprar","esta","ropa","barato"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '8c2bf9f9-9153-1861-f5ed-d3be74c9ab0a',
  '06911f6e-9364-b54b-ddd1-d5e5b8deada8',
  'word_order',
  'undefined',
  12,
  '{"correct":["¿Cuánto","cuesta","esto?"],"words":["¿Cuánto","cuesta","esto?","dinero"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'e7ee6934-7afc-b479-77ab-04a9e4ba6c42',
  '06911f6e-9364-b54b-ddd1-d5e5b8deada8',
  'word_order',
  'undefined',
  13,
  '{"correct":["El","coche","es","muy","caro"],"words":["El","coche","es","muy","caro","precio"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '18dccbdf-2a4e-8f65-d20e-d85da89a080b',
  '06911f6e-9364-b54b-ddd1-d5e5b8deada8',
  'word_order',
  'undefined',
  14,
  '{"correct":["Yo","pago","con","mi","dinero"],"words":["Yo","pago","con","mi","dinero","compras"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '4f2d0e08-575d-03c1-796d-3f4f0d5c6164',
  '06911f6e-9364-b54b-ddd1-d5e5b8deada8',
  'word_order',
  'undefined',
  15,
  '{"correct":["Ellos","venden","fruta","barata"],"words":["Ellos","venden","fruta","barata","comprar"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('55cf7dc4-248c-02fe-b166-fec134d8f02e', 'basic_situations', 'beginner', 303)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('f45aad56-5fe6-d8fd-834e-d8e83763e3f0', '55cf7dc4-248c-02fe-b166-fec134d8f02e', 'en', 'Restaurant', 'Words and phrases for eating out.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('50248043-a167-e0f3-3e64-d8ea37982aec', '55cf7dc4-248c-02fe-b166-fec134d8f02e', 'es', 'Restaurante', 'Palabras y frases para comer fuera.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (base_key, category, level)
VALUES ('menu', 'basic_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'menu'), 'en', 'menu', 'menu')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'menu'), 'es', 'el menú', 'el menú')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('order', 'basic_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'order'), 'en', 'to order/ask', 'to order/ask')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'order'), 'es', 'pedir', 'pedir')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('table', 'basic_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'table'), 'en', 'table', 'table')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'table'), 'es', 'la mesa', 'la mesa')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('waiter', 'basic_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'waiter'), 'en', 'waiter', 'waiter')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'waiter'), 'es', 'el camarero', 'el camarero')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('bill', 'basic_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'bill'), 'en', 'bill/check', 'bill/check')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'bill'), 'es', 'la cuenta', 'la cuenta')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('food', 'basic_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'food'), 'en', 'food', 'food')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'food'), 'es', 'la comida', 'la comida')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('restaurant', 'basic_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'restaurant'), 'en', 'restaurant', 'restaurant')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'restaurant'), 'es', 'el restaurante', 'el restaurante')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('delicious', 'basic_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'delicious'), 'en', 'delicious', 'delicious')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'delicious'), 'es', 'delicioso', 'delicioso')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('water', 'basic_situations', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'water'), 'en', 'water', 'water')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'water'), 'es', 'el agua', 'el agua')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '67f167ee-0694-403e-3b60-ae5b3e88a174',
  '55cf7dc4-248c-02fe-b166-fec134d8f02e',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"la cuenta","options":["la cuenta","la mesa","el menú","el agua"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '96655bdb-ebbd-ceb5-81bf-c703e8259855',
  '55cf7dc4-248c-02fe-b166-fec134d8f02e',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"el camarero","options":["el camarero","la comida","el restaurante","pedir"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'dfd810b7-2afb-45d8-3864-1ca9868de2e7',
  '55cf7dc4-248c-02fe-b166-fec134d8f02e',
  'listening',
  'undefined',
  3,
  '{"correct":"The food is delicious.","audio_text":"La comida es deliciosa."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'dda3b1e4-4818-8d8f-d455-0f6f51f7f678',
  '55cf7dc4-248c-02fe-b166-fec134d8f02e',
  'fill_blank',
  'undefined',
  4,
  '{"correct":"menú","text_before":"Por favor, ¿me trae el ","text_after":"?"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '9c1b20ec-9a8c-2bfa-9429-83b9b96e51d3',
  '55cf7dc4-248c-02fe-b166-fec134d8f02e',
  'fill_blank',
  'undefined',
  5,
  '{"correct":"agua","text_before":"Quiero beber un vaso de ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '22721dd9-d0e1-df2a-7bf8-48c375c4ee60',
  '55cf7dc4-248c-02fe-b166-fec134d8f02e',
  'fill_blank',
  'undefined',
  6,
  '{"correct":"cuenta","text_before":"Camarero, la ","text_after":" por favor."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '0fc1053c-ca87-7cf0-2347-0f7f55335373',
  '55cf7dc4-248c-02fe-b166-fec134d8f02e',
  'fill_blank',
  'undefined',
  7,
  '{"correct":"mesa","text_before":"Necesitamos una ","text_after":" para cuatro personas."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'a23f8a67-05f0-58f9-bca9-ce1ac980804c',
  '55cf7dc4-248c-02fe-b166-fec134d8f02e',
  'fill_blank',
  'undefined',
  8,
  '{"correct":"pedir","text_before":"Ya estamos listos para ","text_after":" la comida."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '0dde800a-613e-a202-93d1-07b18193a080',
  '55cf7dc4-248c-02fe-b166-fec134d8f02e',
  'fill_blank',
  'undefined',
  9,
  '{"correct":"restaurante","text_before":"Vamos a comer en un ","text_after":" italiano."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '67fe3527-420a-7557-bcb2-0c8d466b93c6',
  '55cf7dc4-248c-02fe-b166-fec134d8f02e',
  'word_order',
  'undefined',
  10,
  '{"correct":["La","comida","es","muy","buena"],"words":["La","comida","es","muy","buena","mesa"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'f8793450-4547-8de1-fbb7-4eb5fff25cb9',
  '55cf7dc4-248c-02fe-b166-fec134d8f02e',
  'word_order',
  'undefined',
  11,
  '{"correct":["Yo","pido","un","café"],"words":["Yo","pido","un","café","cuenta"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'a0307e25-ba39-954b-bb21-c062bceb16e1',
  '55cf7dc4-248c-02fe-b166-fec134d8f02e',
  'word_order',
  'undefined',
  12,
  '{"correct":["El","camarero","trae","el","agua"],"words":["El","camarero","trae","el","agua","pedir"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'd01cdc90-d373-042f-c5bc-ed213d617e08',
  '55cf7dc4-248c-02fe-b166-fec134d8f02e',
  'word_order',
  'undefined',
  13,
  '{"correct":["¿Puede","traerme","el","menú?"],"words":["¿Puede","traerme","el","menú?","delicioso"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'f5f0a9e7-393b-7a4e-4eed-e48f07d3c226',
  '55cf7dc4-248c-02fe-b166-fec134d8f02e',
  'word_order',
  'undefined',
  14,
  '{"correct":["Pagamos","la","cuenta","ahora"],"words":["Pagamos","la","cuenta","ahora","menú"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '048f57e7-122f-1ef8-c0c5-4a7bbec3217f',
  '55cf7dc4-248c-02fe-b166-fec134d8f02e',
  'word_order',
  'undefined',
  15,
  '{"correct":["Una","mesa","para","dos"],"words":["Una","mesa","para","dos","camarero"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('873b34b6-ea4b-7e32-1d02-d04e66b8a3da', 'travel', 'beginner', 304)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('4ab93039-371d-6a4d-8f89-0fe702662ebb', '873b34b6-ea4b-7e32-1d02-d04e66b8a3da', 'en', 'Travel Basics', 'Essential vocabulary for traveling.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('d436abe5-f8f1-c252-8194-5bcfed75510f', '873b34b6-ea4b-7e32-1d02-d04e66b8a3da', 'es', 'Viajes básicos', 'Vocabulario esencial para viajar.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (base_key, category, level)
VALUES ('hotel', 'travel', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'hotel'), 'en', 'hotel', 'hotel')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'hotel'), 'es', 'el hotel', 'el hotel')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('ticket', 'travel', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'ticket'), 'en', 'ticket', 'ticket')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'ticket'), 'es', 'el boleto', 'el boleto')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('airport', 'travel', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'airport'), 'en', 'airport', 'airport')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'airport'), 'es', 'el aeropuerto', 'el aeropuerto')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('train', 'travel', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'train'), 'en', 'train', 'train')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'train'), 'es', 'el tren', 'el tren')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('bus', 'travel', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'bus'), 'en', 'bus', 'bus')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'bus'), 'es', 'el autobús', 'el autobús')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('passport', 'travel', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'passport'), 'en', 'passport', 'passport')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'passport'), 'es', 'el pasaporte', 'el pasaporte')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('flight', 'travel', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'flight'), 'en', 'flight', 'flight')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'flight'), 'es', 'el vuelo', 'el vuelo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('travel', 'travel', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'travel'), 'en', 'to travel', 'to travel')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'travel'), 'es', 'viajar', 'viajar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('suitcase', 'travel', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'suitcase'), 'en', 'suitcase', 'suitcase')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'suitcase'), 'es', 'la maleta', 'la maleta')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '9d3d41bb-19b5-e5c8-ffa1-6f1f73d3043c',
  '873b34b6-ea4b-7e32-1d02-d04e66b8a3da',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"el avión (el vuelo)","options":["el avión (el vuelo)","el hotel","el tren","el autobús"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '15c41f23-7b59-b932-fd91-471092cff5ee',
  '873b34b6-ea4b-7e32-1d02-d04e66b8a3da',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"el aeropuerto","options":["el aeropuerto","el hotel","el boleto","la maleta"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'ba590888-0885-3da2-b9e0-37433183606c',
  '873b34b6-ea4b-7e32-1d02-d04e66b8a3da',
  'listening',
  'undefined',
  3,
  '{"correct":"I have my passport and ticket.","audio_text":"Tengo mi pasaporte y boleto."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '4d043f97-4efe-5328-0164-a051d83699f9',
  '873b34b6-ea4b-7e32-1d02-d04e66b8a3da',
  'fill_blank',
  'undefined',
  4,
  '{"correct":"hotel","text_before":"Dormimos en un ","text_after":" muy cómodo."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '3e36937d-9548-c7d5-768b-bf627a141917',
  '873b34b6-ea4b-7e32-1d02-d04e66b8a3da',
  'fill_blank',
  'undefined',
  5,
  '{"correct":"pasaporte","text_before":"Para volar a otro país necesitas un ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '0dd76cec-8bda-3e07-3f5c-184f4f99887b',
  '873b34b6-ea4b-7e32-1d02-d04e66b8a3da',
  'fill_blank',
  'undefined',
  6,
  '{"correct":"tren","text_before":"Viajamos a París en ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'ebf2ec17-9495-4c4d-ef9d-8d2a1d76eb61',
  '873b34b6-ea4b-7e32-1d02-d04e66b8a3da',
  'fill_blank',
  'undefined',
  7,
  '{"correct":"maleta","text_before":"Tengo mi ropa en la ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '94602d3f-0de9-cf7b-a1c1-452491626d0e',
  '873b34b6-ea4b-7e32-1d02-d04e66b8a3da',
  'fill_blank',
  'undefined',
  8,
  '{"correct":"aeropuerto","text_before":"El avión sale del ","text_after":" en una hora."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'edc8ee54-e59e-d6de-4fed-c7814672f736',
  '873b34b6-ea4b-7e32-1d02-d04e66b8a3da',
  'fill_blank',
  'undefined',
  9,
  '{"correct":"viajar","text_before":"Me gusta mucho ","text_after":" por el mundo."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '11e38822-6261-7146-1369-c205f57e4bf3',
  '873b34b6-ea4b-7e32-1d02-d04e66b8a3da',
  'word_order',
  'undefined',
  10,
  '{"correct":["Tengo","el","boleto","para","el","vuelo"],"words":["Tengo","el","boleto","para","el","vuelo","tren"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '851aebb3-6da8-29e0-834e-5b06802bf88e',
  '873b34b6-ea4b-7e32-1d02-d04e66b8a3da',
  'word_order',
  'undefined',
  11,
  '{"correct":["El","autobús","llega","muy","tarde"],"words":["El","autobús","llega","muy","tarde","hotel"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '63ecdebc-d91e-0d50-17cf-161a7851d245',
  '873b34b6-ea4b-7e32-1d02-d04e66b8a3da',
  'word_order',
  'undefined',
  12,
  '{"correct":["Nosotros","vamos","al","aeropuerto"],"words":["Nosotros","vamos","al","aeropuerto","boleto"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'a71ad546-e709-32cc-15c7-d3270ee1736d',
  '873b34b6-ea4b-7e32-1d02-d04e66b8a3da',
  'word_order',
  'undefined',
  13,
  '{"correct":["¿Dónde","está","mi","maleta?"],"words":["¿Dónde","está","mi","maleta?","viajar"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'f353d3d4-d178-61da-646f-de9a2dfc0a5c',
  '873b34b6-ea4b-7e32-1d02-d04e66b8a3da',
  'word_order',
  'undefined',
  14,
  '{"correct":["Me","gusta","viajar","en","tren"],"words":["Me","gusta","viajar","en","tren","hotel"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '3b1b1ca6-9cfc-8ef2-42c7-13048fb6d2b3',
  '873b34b6-ea4b-7e32-1d02-d04e66b8a3da',
  'word_order',
  'undefined',
  15,
  '{"correct":["Tengo","mi","pasaporte","aquí"],"words":["Tengo","mi","pasaporte","aquí","vuelo"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

