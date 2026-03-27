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

INSERT INTO public.words (id, base_key, category, level)
VALUES ('cba251ae-a2d0-5e77-2eb6-988689198e19', 'wake_up', 'daily_life', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('6a8b4acf-f4ba-eb8d-3bfe-54ffeaec62dc', 'cba251ae-a2d0-5e77-2eb6-988689198e19', 'en', 'wake up', 'wake up')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('7f274c43-5f8b-fc7f-4178-7918b53198bd', 'cba251ae-a2d0-5e77-2eb6-988689198e19', 'es', 'despertarse', 'despertarse')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('c4f5963d-9d99-ddf6-9776-6a31ea71722d', 'work', 'daily_life', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('0211201d-c9c8-27b9-f727-57f6c63b8888', 'c4f5963d-9d99-ddf6-9776-6a31ea71722d', 'en', 'work', 'work')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('f5952eb9-5270-861d-3e2b-345e7e3c9968', 'c4f5963d-9d99-ddf6-9776-6a31ea71722d', 'es', 'trabajar', 'trabajar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('6bd8359a-f312-1411-a490-0c0615e83f2b', 'sleep', 'daily_life', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('c83ad5da-fb2c-bdc5-c903-5cb3248a7cde', '6bd8359a-f312-1411-a490-0c0615e83f2b', 'en', 'sleep', 'sleep')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('9062f367-7d17-dff8-3c22-6f6c3e866d45', '6bd8359a-f312-1411-a490-0c0615e83f2b', 'es', 'dormir', 'dormir')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('bf15ef0d-2bfe-d103-5834-72a0ce40f160', 'eat_breakfast', 'daily_life', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('840af503-9757-bbc9-f92d-2e84a953bf22', 'bf15ef0d-2bfe-d103-5834-72a0ce40f160', 'en', 'eat breakfast', 'eat breakfast')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('116de664-ea7c-1e95-4f64-35c96ef2e19b', 'bf15ef0d-2bfe-d103-5834-72a0ce40f160', 'es', 'desayunar', 'desayunar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('f8e70d0f-c3ae-5500-5219-fe087adf2ee2', 'eat_lunch', 'daily_life', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('09cd6894-1276-40fe-8539-9ee3819641b2', 'f8e70d0f-c3ae-5500-5219-fe087adf2ee2', 'en', 'eat lunch', 'eat lunch')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('241e1044-4e4d-bcb2-cb6b-e77b737aea78', 'f8e70d0f-c3ae-5500-5219-fe087adf2ee2', 'es', 'comer', 'comer')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('88767577-9310-0cc3-d099-ce61bfa5beec', 'eat_dinner', 'daily_life', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('3396c934-a168-51b6-8a7d-4f1b0fc8856f', '88767577-9310-0cc3-d099-ce61bfa5beec', 'en', 'eat dinner', 'eat dinner')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('d03c4639-123c-5e76-2cac-6385980de630', '88767577-9310-0cc3-d099-ce61bfa5beec', 'es', 'cenar', 'cenar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('8d499588-70d9-5bfe-3b50-f0b446091879', 'morning', 'daily_life', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('d236a63a-acaf-76e5-ce02-0dc628f5d177', '8d499588-70d9-5bfe-3b50-f0b446091879', 'en', 'morning', 'morning')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('7ed17026-4e88-774e-9bf4-1f6dbff98dd7', '8d499588-70d9-5bfe-3b50-f0b446091879', 'es', 'mañana', 'mañana')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('8aafeafa-b4ea-98b5-4cb8-5f05dbe42678', 'night', 'daily_life', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('135fc8c5-ed4f-a68e-0dc6-3cbba7662a1e', '8aafeafa-b4ea-98b5-4cb8-5f05dbe42678', 'en', 'night', 'night')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('80bf2761-cf75-9433-414f-f59010241364', '8aafeafa-b4ea-98b5-4cb8-5f05dbe42678', 'es', 'noche', 'noche')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('e800a3ff-2229-2898-b219-c1c912696cda', 'afternoon', 'daily_life', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('3a8151db-7584-5a02-099d-bcdaae098a85', 'e800a3ff-2229-2898-b219-c1c912696cda', 'en', 'afternoon', 'afternoon')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('b396cd25-7e41-a7b8-644d-9917c2d0aae3', 'e800a3ff-2229-2898-b219-c1c912696cda', 'es', 'tarde', 'tarde')
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

INSERT INTO public.words (id, base_key, category, level)
VALUES ('4f002921-4b5c-f75b-fccb-d60d8b4bc919', 'home', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('a05df32d-02d9-2cc6-b6b6-21b735ba6dea', '4f002921-4b5c-f75b-fccb-d60d8b4bc919', 'en', 'home', 'home')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('4e664cb9-10fb-9b99-974a-0471dce8b6c5', '4f002921-4b5c-f75b-fccb-d60d8b4bc919', 'es', 'la casa', 'la casa')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('a9ba4660-19f3-e64c-bb24-75d3e17ce247', 'school', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('541281a0-4b7c-09cc-e759-7822287e6d5e', 'a9ba4660-19f3-e64c-bb24-75d3e17ce247', 'en', 'school', 'school')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('ec83499c-f2fc-7314-ed25-a59e69f3aa01', 'a9ba4660-19f3-e64c-bb24-75d3e17ce247', 'es', 'la escuela', 'la escuela')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('4876c847-bfbf-fa55-4e7b-a810e1ae6a8d', 'city', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('1740fbd9-5bcb-ded0-a489-d359a10ba4c3', '4876c847-bfbf-fa55-4e7b-a810e1ae6a8d', 'en', 'city', 'city')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('8a1baf05-4f34-0fe8-f4f9-20de0f9115c3', '4876c847-bfbf-fa55-4e7b-a810e1ae6a8d', 'es', 'la ciudad', 'la ciudad')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('f4afa559-e68a-b512-f875-f04f3a047718', 'street', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('ebbb49df-2c9b-9198-d467-1e3f3acf8b5a', 'f4afa559-e68a-b512-f875-f04f3a047718', 'en', 'street', 'street')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('44fe2f79-cf3c-1362-a1f9-310fa8749096', 'f4afa559-e68a-b512-f875-f04f3a047718', 'es', 'la calle', 'la calle')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('7f610320-002d-645c-3b58-2f74458d3537', 'park', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('81110efa-a24b-c9a2-0fd0-5306b8bdc310', '7f610320-002d-645c-3b58-2f74458d3537', 'en', 'park', 'park')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('48261182-23a1-0f72-acb5-9e41b7a621ff', '7f610320-002d-645c-3b58-2f74458d3537', 'es', 'el parque', 'el parque')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('606075f6-e192-3af4-4afd-e024215f28c3', 'shop', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('195f06bb-ec5e-3b17-d947-5c315d33d6e8', '606075f6-e192-3af4-4afd-e024215f28c3', 'en', 'shop/store', 'shop/store')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('33b9c520-b6bf-a1ec-ac66-c460cd8499c7', '606075f6-e192-3af4-4afd-e024215f28c3', 'es', 'la tienda', 'la tienda')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('d83bcb5a-b15c-6181-fb6c-18b0a79cd178', 'bank', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('7201db0e-b78c-411f-52cd-37e60e134ee1', 'd83bcb5a-b15c-6181-fb6c-18b0a79cd178', 'en', 'bank', 'bank')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('95b6df97-f5a4-faf5-fe7e-0482f7b51ca6', 'd83bcb5a-b15c-6181-fb6c-18b0a79cd178', 'es', 'el banco', 'el banco')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('858a5b1c-b3d0-5583-d2b1-ef6d68ce9287', 'go', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('17a30a33-a8cd-6b12-d907-617ad1ad074a', '858a5b1c-b3d0-5583-d2b1-ef6d68ce9287', 'en', 'to go', 'to go')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('57c706d3-0aca-d263-6176-2e3bb8c9822f', '858a5b1c-b3d0-5583-d2b1-ef6d68ce9287', 'es', 'ir', 'ir')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('19c1dff9-5fee-f42a-9e7b-4d8204ab1c80', 'be_location', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('349f6f4c-1f8e-998b-1d15-4372475afe78', '19c1dff9-5fee-f42a-9e7b-4d8204ab1c80', 'en', 'to be (location)', 'to be (location)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('41da2273-dc2b-01cd-c80b-0907a4736fd2', '19c1dff9-5fee-f42a-9e7b-4d8204ab1c80', 'es', 'estar', 'estar')
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

INSERT INTO public.words (id, base_key, category, level)
VALUES ('9c59b2b4-0d26-cfad-95b3-ef969c892f14', 'price', 'basic_situations', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('6340ff32-2a4d-59f8-86f3-751522f4ce19', '9c59b2b4-0d26-cfad-95b3-ef969c892f14', 'en', 'price', 'price')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('9fbaef0b-58fa-1a5b-8c35-be1e78cf545c', '9c59b2b4-0d26-cfad-95b3-ef969c892f14', 'es', 'el precio', 'el precio')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('324a42a2-4b38-f3e2-7446-92d7b3672da3', 'money', 'basic_situations', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('fbcd00c6-2c2a-66b9-07c1-5c7a8c8fbab3', '324a42a2-4b38-f3e2-7446-92d7b3672da3', 'en', 'money', 'money')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('3595d446-f64c-c6e9-876d-4297509df67e', '324a42a2-4b38-f3e2-7446-92d7b3672da3', 'es', 'el dinero', 'el dinero')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('818b9e6a-2c38-d8d5-ddcf-d872c4265727', 'expensive', 'basic_situations', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('a0cb99d4-3547-6cc6-aa2b-bc23e303ba14', '818b9e6a-2c38-d8d5-ddcf-d872c4265727', 'en', 'expensive', 'expensive')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('daef7798-e359-91ce-6bc5-cb92a5eda6f8', '818b9e6a-2c38-d8d5-ddcf-d872c4265727', 'es', 'caro', 'caro')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('6587accd-7045-3a6f-935b-6e4c888fef0b', 'cheap', 'basic_situations', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('94f92aa7-c548-bb82-1db1-2cdc6ac08de6', '6587accd-7045-3a6f-935b-6e4c888fef0b', 'en', 'cheap', 'cheap')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('9da57fb4-dd4c-3ba7-6746-5b4acf64ba45', '6587accd-7045-3a6f-935b-6e4c888fef0b', 'es', 'barato', 'barato')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('36a9b2c5-bf2f-2699-1b94-6a9653772320', 'buy', 'basic_situations', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('feacb695-d9f9-46d3-49f2-489d78bb5fd1', '36a9b2c5-bf2f-2699-1b94-6a9653772320', 'en', 'to buy', 'to buy')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('0e6eae6b-d8b9-f2a7-5d13-6fdcf58d68de', '36a9b2c5-bf2f-2699-1b94-6a9653772320', 'es', 'comprar', 'comprar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('449947f1-425c-ddd7-6f13-1def4e938560', 'sell', 'basic_situations', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('236efe3d-6027-0656-5c43-def38458043c', '449947f1-425c-ddd7-6f13-1def4e938560', 'en', 'to sell', 'to sell')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('1f9ce42f-20ac-5614-a459-e645ed739a16', '449947f1-425c-ddd7-6f13-1def4e938560', 'es', 'vender', 'vender')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('1ba541a2-585e-6d51-45ad-858863b68e54', 'clothes', 'basic_situations', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('3e590aee-b799-916e-07f7-64adc90302b3', '1ba541a2-585e-6d51-45ad-858863b68e54', 'en', 'clothes', 'clothes')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('26665510-5591-ba5b-6642-9a6976c41e38', '1ba541a2-585e-6d51-45ad-858863b68e54', 'es', 'la ropa', 'la ropa')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('8fae357c-a3d1-7710-2a79-ac38475518fe', 'pay', 'basic_situations', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('cf455fe5-415d-d386-97bd-e82e735665e5', '8fae357c-a3d1-7710-2a79-ac38475518fe', 'en', 'to pay', 'to pay')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('6b2406e3-8a71-6538-f12e-239889be417a', '8fae357c-a3d1-7710-2a79-ac38475518fe', 'es', 'pagar', 'pagar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('e12b241a-9248-41f2-39e1-bb6c7fa38f0e', 'cost', 'basic_situations', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('804f97b1-4106-2135-24f8-af48358f4ecd', 'e12b241a-9248-41f2-39e1-bb6c7fa38f0e', 'en', 'to cost', 'to cost')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('174b75a0-31a2-4f76-fe20-8c38045ac41c', 'e12b241a-9248-41f2-39e1-bb6c7fa38f0e', 'es', 'costar', 'costar')
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

INSERT INTO public.words (id, base_key, category, level)
VALUES ('e5445852-8c3b-439a-fb4f-b89f5a2000c1', 'menu', 'basic_situations', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('53c7e3af-160e-f235-93a5-302813f9820e', 'e5445852-8c3b-439a-fb4f-b89f5a2000c1', 'en', 'menu', 'menu')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('210104e5-2ebc-7335-1ef3-1420ffbe8167', 'e5445852-8c3b-439a-fb4f-b89f5a2000c1', 'es', 'el menú', 'el menú')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('9bf5d0da-11a7-d8a0-2542-aa6c39c664f9', 'order', 'basic_situations', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('035c9783-80ab-a993-4a4f-3a416a703267', '9bf5d0da-11a7-d8a0-2542-aa6c39c664f9', 'en', 'to order/ask', 'to order/ask')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('541432d2-78f3-bb77-d082-d34f10da591c', '9bf5d0da-11a7-d8a0-2542-aa6c39c664f9', 'es', 'pedir', 'pedir')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('647c6840-6505-1d0d-b5a4-ad8033ea451e', 'table', 'basic_situations', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('35e21306-c100-559b-6fdc-00377e7e2233', '647c6840-6505-1d0d-b5a4-ad8033ea451e', 'en', 'table', 'table')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('e2f2ad17-58c2-1f19-3dac-b52636c070f2', '647c6840-6505-1d0d-b5a4-ad8033ea451e', 'es', 'la mesa', 'la mesa')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('ee277c58-e15d-f612-57e5-5a12c2b2cfe6', 'waiter', 'basic_situations', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('6380a06c-f9d5-adb8-5c7f-46a6e095a340', 'ee277c58-e15d-f612-57e5-5a12c2b2cfe6', 'en', 'waiter', 'waiter')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('a823a952-4740-ce56-11cb-ce29d9b7dd99', 'ee277c58-e15d-f612-57e5-5a12c2b2cfe6', 'es', 'el camarero', 'el camarero')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('9a3b0eac-bfe4-0186-39ab-8d5737dea0d5', 'bill', 'basic_situations', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('c0160e46-abcf-802a-0479-71d141766b21', '9a3b0eac-bfe4-0186-39ab-8d5737dea0d5', 'en', 'bill/check', 'bill/check')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('31fc1d82-3a69-9dd8-357c-68131567f0c3', '9a3b0eac-bfe4-0186-39ab-8d5737dea0d5', 'es', 'la cuenta', 'la cuenta')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('d4075899-9fca-01d1-9e60-7ffc86a427ea', 'food', 'basic_situations', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('c878f97c-75e7-200a-11cb-f755d938f453', 'd4075899-9fca-01d1-9e60-7ffc86a427ea', 'en', 'food', 'food')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('d73f243e-9607-e51f-36b5-b622168b269b', 'd4075899-9fca-01d1-9e60-7ffc86a427ea', 'es', 'la comida', 'la comida')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('737e5579-4716-89fd-eb17-a130857ef70a', 'restaurant', 'basic_situations', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('8bf2e0bb-3708-6178-9861-f4b5cdd90c05', '737e5579-4716-89fd-eb17-a130857ef70a', 'en', 'restaurant', 'restaurant')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('daf58b2d-93c1-7e37-c94c-d720ca7fc91f', '737e5579-4716-89fd-eb17-a130857ef70a', 'es', 'el restaurante', 'el restaurante')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('d86d4dc6-c160-3031-386e-b6233920f2f6', 'delicious', 'basic_situations', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('b1eb51da-47f3-6b4a-4c57-ab92fd265072', 'd86d4dc6-c160-3031-386e-b6233920f2f6', 'en', 'delicious', 'delicious')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('4558dfb0-3e3c-5815-8e73-e21750729fae', 'd86d4dc6-c160-3031-386e-b6233920f2f6', 'es', 'delicioso', 'delicioso')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('9a345c05-1bb1-bdde-3ce6-6d8186f7e262', 'water', 'basic_situations', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('351c30e6-331a-80f2-0c5e-4e2f25c01b0c', '9a345c05-1bb1-bdde-3ce6-6d8186f7e262', 'en', 'water', 'water')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('6c4c76e7-c28c-9a1c-bf4b-41897fbaa960', '9a345c05-1bb1-bdde-3ce6-6d8186f7e262', 'es', 'el agua', 'el agua')
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

INSERT INTO public.words (id, base_key, category, level)
VALUES ('b3f9fb53-d0b4-dcf8-225f-14a4353aae4e', 'hotel', 'travel', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('3ba310b6-3538-f694-b78b-61a1be88a210', 'b3f9fb53-d0b4-dcf8-225f-14a4353aae4e', 'en', 'hotel', 'hotel')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('798cd64c-b502-2d36-2a45-2620170bbca6', 'b3f9fb53-d0b4-dcf8-225f-14a4353aae4e', 'es', 'el hotel', 'el hotel')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('15ab22fc-b198-ee23-c5c7-10a8b9b27b91', 'ticket', 'travel', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('f10e1830-b02b-30d7-ac5b-6a3419c30a60', '15ab22fc-b198-ee23-c5c7-10a8b9b27b91', 'en', 'ticket', 'ticket')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('daa1100e-ed76-513a-5672-0bfb0f89d2cd', '15ab22fc-b198-ee23-c5c7-10a8b9b27b91', 'es', 'el boleto', 'el boleto')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('f47a8f18-3a47-c2bb-ab8f-3358bcdcc5bf', 'airport', 'travel', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('8ae2d8e8-7f85-06c3-c4d0-9729b65abf71', 'f47a8f18-3a47-c2bb-ab8f-3358bcdcc5bf', 'en', 'airport', 'airport')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('045869df-5bc6-a6de-49bf-80007200221c', 'f47a8f18-3a47-c2bb-ab8f-3358bcdcc5bf', 'es', 'el aeropuerto', 'el aeropuerto')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('0e23024c-443f-984b-502b-f0eabdf694fe', 'train', 'travel', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('67b45a68-615e-aade-ce5a-5b0936624cb8', '0e23024c-443f-984b-502b-f0eabdf694fe', 'en', 'train', 'train')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('5da50611-fdcf-e5d0-69ee-ba44b7680ac6', '0e23024c-443f-984b-502b-f0eabdf694fe', 'es', 'el tren', 'el tren')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('1288befc-4af7-34ce-2648-9023de975f16', 'bus', 'travel', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('77e8b9fa-2c3b-b361-c0eb-94ebeb68e8f1', '1288befc-4af7-34ce-2648-9023de975f16', 'en', 'bus', 'bus')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('94b185de-88ff-c0aa-1a58-49d618aa3d8e', '1288befc-4af7-34ce-2648-9023de975f16', 'es', 'el autobús', 'el autobús')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('e2c4fb94-dbb4-d55a-2342-297e1eb2949c', 'passport', 'travel', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('c484875e-7e99-94f6-3786-a15ff3455a95', 'e2c4fb94-dbb4-d55a-2342-297e1eb2949c', 'en', 'passport', 'passport')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('4422b6b5-f6cb-456d-742d-f293ee6c775a', 'e2c4fb94-dbb4-d55a-2342-297e1eb2949c', 'es', 'el pasaporte', 'el pasaporte')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('b4b9b06d-31f5-e400-591e-1f6a157af4ed', 'flight', 'travel', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('c1080a88-e617-00a8-522d-587ae904a8a5', 'b4b9b06d-31f5-e400-591e-1f6a157af4ed', 'en', 'flight', 'flight')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('b7055d54-d962-db11-2d90-41175704f0a1', 'b4b9b06d-31f5-e400-591e-1f6a157af4ed', 'es', 'el vuelo', 'el vuelo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('03a85ae0-bbd5-63e9-bd6a-e1e4e5a598cc', 'travel', 'travel', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('b0154df6-2ef4-0482-948b-967992c18cdb', '03a85ae0-bbd5-63e9-bd6a-e1e4e5a598cc', 'en', 'to travel', 'to travel')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('25458db9-d3dd-5a2b-998c-44aa4cdef6d3', '03a85ae0-bbd5-63e9-bd6a-e1e4e5a598cc', 'es', 'viajar', 'viajar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('c52f0803-432c-ea00-066b-47ca6d992267', 'suitcase', 'travel', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('eb6f2d24-562e-25d5-d7c9-ef4cf22ad570', 'c52f0803-432c-ea00-066b-47ca6d992267', 'en', 'suitcase', 'suitcase')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('b31dedad-7b16-6844-112e-30f2464023de', 'c52f0803-432c-ea00-066b-47ca6d992267', 'es', 'la maleta', 'la maleta')
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

