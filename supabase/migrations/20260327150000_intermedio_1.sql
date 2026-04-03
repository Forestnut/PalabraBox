-- Migration auto-generated for content update

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('4891c820-c1ef-3f37-0261-adf23d37cb29', 'grammar', 'intermediate', 300)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('d520e16b-dd0b-97c7-a1a3-f14e864bdc0f', '4891c820-c1ef-3f37-0261-adf23d37cb29', 'en', 'Past (basic)', 'Learn basic verbs in the past tense.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('46cd18c8-8a40-3dfd-3c4d-1a58a659aca0', '4891c820-c1ef-3f37-0261-adf23d37cb29', 'es', 'Pasado (básico)', 'Aprende verbos básicos en tiempo pasado.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (base_key, category, level)
VALUES ('went', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'went'), 'en', 'went', 'went')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'went'), 'es', 'fui', 'fui')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('ate', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'ate'), 'en', 'ate', 'ate')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'ate'), 'es', 'comí', 'comí')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('saw', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'saw'), 'en', 'saw', 'saw')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'saw'), 'es', 'vi', 'vi')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('played', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'played'), 'en', 'played', 'played')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'played'), 'es', 'jugué', 'jugué')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('worked', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'worked'), 'en', 'worked', 'worked')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'worked'), 'es', 'trabajé', 'trabajé')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('bought', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'bought'), 'en', 'bought', 'bought')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'bought'), 'es', 'compré', 'compré')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('yesterday', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'yesterday'), 'en', 'yesterday', 'yesterday')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'yesterday'), 'es', 'ayer', 'ayer')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('last week', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'last week'), 'en', 'last week', 'last week')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'last week'), 'es', 'la semana pasada', 'la semana pasada')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '43598c15-a644-62f3-9f2f-a20e8d44d53d',
  '4891c820-c1ef-3f37-0261-adf23d37cb29',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"Fui ayer","options":["Fui ayer","Voy ayer","Comí ayer"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '1f21b10b-0911-7682-54f1-63bb09e31ed8',
  '4891c820-c1ef-3f37-0261-adf23d37cb29',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"Vi","options":["Vi","Fui","Veo"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '97d56aa9-401e-4046-961b-c4af885b5e53',
  '4891c820-c1ef-3f37-0261-adf23d37cb29',
  'listening',
  'undefined',
  3,
  '{"correct":"I played last week","audio_text":"Jugué la semana pasada"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'a09ea364-eb00-2375-773a-7ba7e53f2243',
  '4891c820-c1ef-3f37-0261-adf23d37cb29',
  'fill_blank',
  'undefined',
  4,
  '{"text_before":"Yo","correct":"comí","text_after":"mucho."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '4436dcf7-3737-f18b-cb21-6ccb4622cfcb',
  '4891c820-c1ef-3f37-0261-adf23d37cb29',
  'fill_blank',
  'undefined',
  5,
  '{"text_before":"Yo","correct":"trabajé","text_after":"ayer."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '8e5a7fc9-5bda-a017-c90f-591259374b11',
  '4891c820-c1ef-3f37-0261-adf23d37cb29',
  'fill_blank',
  'undefined',
  6,
  '{"text_before":"Yo","correct":"compré","text_after":"una camisa."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '08650ad2-5631-5ec7-2c79-5022ff0e443a',
  '4891c820-c1ef-3f37-0261-adf23d37cb29',
  'fill_blank',
  'undefined',
  7,
  '{"text_before":"Yo","correct":"vi","text_after":"la película."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '58a7bc98-ea28-4155-dfc5-288927f79e28',
  '4891c820-c1ef-3f37-0261-adf23d37cb29',
  'fill_blank',
  'undefined',
  8,
  '{"text_before":"Yo","correct":"fui","text_after":"al parque."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '35d34d3b-ecc2-7a35-0888-381a36ec5545',
  '4891c820-c1ef-3f37-0261-adf23d37cb29',
  'fill_blank',
  'undefined',
  9,
  '{"text_before":"Yo","correct":"jugué","text_after":"al tenis."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '332c7fa2-d863-77fc-a509-8cf6b118ede1',
  '4891c820-c1ef-3f37-0261-adf23d37cb29',
  'word_order',
  'undefined',
  10,
  '{"correct":["Fui","a la tienda","ayer"],"words":["ayer","a la tienda","Fui","voy"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '18489415-a674-c1b1-7f4c-43cb57206dbf',
  '4891c820-c1ef-3f37-0261-adf23d37cb29',
  'word_order',
  'undefined',
  11,
  '{"correct":["Comí","manzanas","la semana pasada"],"words":["la semana pasada","Comí","manzanas","veo"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'b898c436-8a5a-2192-f567-4e4539e91c11',
  '4891c820-c1ef-3f37-0261-adf23d37cb29',
  'word_order',
  'undefined',
  12,
  '{"correct":["Vi","a mi","amigo"],"words":["amigo","Vi","a mi","jugué"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '7c91bf53-ec60-3562-345b-56d5b88fbd14',
  '4891c820-c1ef-3f37-0261-adf23d37cb29',
  'word_order',
  'undefined',
  13,
  '{"correct":["Jugué","al","fútbol"],"words":["al","fútbol","Jugué","trabajé"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '28011ccf-7292-c5a0-4904-fd5ae34fafc2',
  '4891c820-c1ef-3f37-0261-adf23d37cb29',
  'word_order',
  'undefined',
  14,
  '{"correct":["Trabajé","mucho","ayer"],"words":["mucho","ayer","Trabajé","compré"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '4d2a19cc-b422-eb2a-bbfb-dffa16aa1277',
  '4891c820-c1ef-3f37-0261-adf23d37cb29',
  'word_order',
  'undefined',
  15,
  '{"correct":["Compré","un","coche"],"words":["un","coche","Compré","fui"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('12d902f4-4d73-31c4-df6c-36f2d64ab0c6', 'grammar', 'intermediate', 301)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('b7f96b28-0e82-cce5-a772-7197cb82d32a', '12d902f4-4d73-31c4-df6c-36f2d64ab0c6', 'en', 'Future', 'Express future plans and actions.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('02fb6134-5d89-cf35-921d-99fc142bd3e1', '12d902f4-4d73-31c4-df6c-36f2d64ab0c6', 'es', 'Futuro', 'Expresa planes y acciones futuras.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (base_key, category, level)
VALUES ('will', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'will'), 'en', 'will (voy a)', 'will (voy a)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'will'), 'es', 'voy a', 'voy a')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('going to', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'going to'), 'en', 'going to', 'going to')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'going to'), 'es', 'iré a', 'iré a')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('tomorrow', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'tomorrow'), 'en', 'tomorrow', 'tomorrow')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'tomorrow'), 'es', 'mañana', 'mañana')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('next week', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'next week'), 'en', 'next week', 'next week')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'next week'), 'es', 'la próxima semana', 'la próxima semana')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('soon', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'soon'), 'en', 'soon', 'soon')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'soon'), 'es', 'pronto', 'pronto')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('travel', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'travel'), 'en', 'travel', 'travel')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'travel'), 'es', 'viajar', 'viajar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('visit', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'visit'), 'en', 'visit', 'visit')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'visit'), 'es', 'visitar', 'visitar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('eat', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'eat'), 'en', 'eat (future)', 'eat (future)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'eat'), 'es', 'comeré', 'comeré')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '4e34f731-4ecf-ec98-ae29-91e4f8e26153',
  '12d902f4-4d73-31c4-df6c-36f2d64ab0c6',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"Voy a viajar mañana","options":["Voy a viajar mañana","Viajé mañana","Visito mañana"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'f4b6c47c-2a28-6bec-d97c-d1f64b599f0b',
  '12d902f4-4d73-31c4-df6c-36f2d64ab0c6',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"pronto","options":["pronto","mañana","luego"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'e05e753b-e57e-5068-5895-6e6e28cba79a',
  '12d902f4-4d73-31c4-df6c-36f2d64ab0c6',
  'listening',
  'undefined',
  3,
  '{"correct":"I will visit next week","audio_text":"Visitaré la próxima semana"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '3d31bb06-0866-aac1-878a-b32e3d9bba60',
  '12d902f4-4d73-31c4-df6c-36f2d64ab0c6',
  'fill_blank',
  'undefined',
  4,
  '{"text_before":"Yo voy a","correct":"viajar","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'bffddd55-97a8-97ff-19ce-4ab2b7d5fad9',
  '12d902f4-4d73-31c4-df6c-36f2d64ab0c6',
  'fill_blank',
  'undefined',
  5,
  '{"text_before":"Te voy a","correct":"visitar","text_after":"pronto."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '1c32b2db-c9e2-2e34-d243-e2f6e84908b6',
  '12d902f4-4d73-31c4-df6c-36f2d64ab0c6',
  'fill_blank',
  'undefined',
  6,
  '{"text_before":"Nosotros comeremos","correct":"mañana","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '94dbee8d-e8e5-4e0e-b4af-c25f2f3dcd8a',
  '12d902f4-4d73-31c4-df6c-36f2d64ab0c6',
  'fill_blank',
  'undefined',
  7,
  '{"text_before":"Te veré","correct":"la próxima semana","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'ee0a8759-af5b-2c62-8692-9950d131e33f',
  '12d902f4-4d73-31c4-df6c-36f2d64ab0c6',
  'fill_blank',
  'undefined',
  8,
  '{"text_before":"Él va a","correct":"viajar","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'e9e168bb-3c0b-2e8a-22c5-08e52bf1a401',
  '12d902f4-4d73-31c4-df6c-36f2d64ab0c6',
  'fill_blank',
  'undefined',
  9,
  '{"text_before":"Llegarán","correct":"pronto","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'dd86fafa-d534-c0bb-7d8f-29b7d16fab87',
  '12d902f4-4d73-31c4-df6c-36f2d64ab0c6',
  'word_order',
  'undefined',
  10,
  '{"correct":["Voy a","viajar","mañana"],"words":["viajar","mañana","Voy a","ayer"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '1ea37947-50aa-c8a1-4015-939fa9a45ffe',
  '12d902f4-4d73-31c4-df6c-36f2d64ab0c6',
  'word_order',
  'undefined',
  11,
  '{"correct":["Vamos a","visitar","la próxima semana"],"words":["la próxima semana","visitar","Vamos a","pronto"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '6bd9e5b8-9368-e62e-f377-ddf6eedce439',
  '12d902f4-4d73-31c4-df6c-36f2d64ab0c6',
  'word_order',
  'undefined',
  12,
  '{"correct":["Voy a","comer","pronto"],"words":["comer","pronto","Voy a","mañana"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '1717f66e-cdca-3f6d-f66f-c0a592fb32be',
  '12d902f4-4d73-31c4-df6c-36f2d64ab0c6',
  'word_order',
  'undefined',
  13,
  '{"correct":["Ella va a","viajar","pronto"],"words":["pronto","Ella va a","viajar","visitar"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '6270d39e-5199-05a6-e551-63f5a3105c57',
  '12d902f4-4d73-31c4-df6c-36f2d64ab0c6',
  'word_order',
  'undefined',
  14,
  '{"correct":["Ellos","visitarán","mañana"],"words":["mañana","visitarán","Ellos","comerán"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '6226bb8d-1d79-cc67-a81c-33c9c11fe09a',
  '12d902f4-4d73-31c4-df6c-36f2d64ab0c6',
  'word_order',
  'undefined',
  15,
  '{"correct":["Iré","la","próxima semana"],"words":["próxima semana","la","Iré","futuro"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('e639a619-a490-0f45-eb60-1d6bac0e2005', 'grammar', 'intermediate', 302)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('46e1b54c-d86a-803d-bb1c-0289dd8e7a67', 'e639a619-a490-0f45-eb60-1d6bac0e2005', 'en', 'Modal verbs', 'Using common modal verbs for obligation, ability, and advice.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('2fefe44f-7c89-e08f-8be1-38a36e5ac4c8', 'e639a619-a490-0f45-eb60-1d6bac0e2005', 'es', 'Verbos modales', 'Uso de verbos modales comunes para obligación, habilidad y consejo.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (base_key, category, level)
VALUES ('can', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'can'), 'en', 'can', 'can')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'can'), 'es', 'puedo', 'puedo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('must', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'must'), 'en', 'must', 'must')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'must'), 'es', 'debo', 'debo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('should', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'should'), 'en', 'should', 'should')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'should'), 'es', 'debería', 'debería')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('could', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'could'), 'en', 'could', 'could')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'could'), 'es', 'podría', 'podría')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('would', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'would'), 'en', 'would', 'would')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'would'), 'es', 'haría', 'haría')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('help', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'help'), 'en', 'help', 'help')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'help'), 'es', 'ayudar', 'ayudar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('learn', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'learn'), 'en', 'learn', 'learn')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'learn'), 'es', 'aprender', 'aprender')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('want', 'grammar', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'want'), 'en', 'want', 'want')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'want'), 'es', 'quiero', 'quiero')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '2495f43b-bbf8-c77a-193f-809004037a70',
  'e639a619-a490-0f45-eb60-1d6bac0e2005',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"Puedo ayudar","options":["Puedo ayudar","Debo ayudar","Podría ayudar"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '6809155f-1df5-76f5-622b-fdc9e9334d05',
  'e639a619-a490-0f45-eb60-1d6bac0e2005',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"Debería aprender","options":["Debería aprender","Puedo aprender","Debo aprender"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'ebddf7c4-4bf4-492c-a88c-2b8e763ce29c',
  'e639a619-a490-0f45-eb60-1d6bac0e2005',
  'listening',
  'undefined',
  3,
  '{"correct":"I must help you.","audio_text":"Debo ayudarte."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '1f956194-d62c-cc64-6dc8-adf4824baf32',
  'e639a619-a490-0f45-eb60-1d6bac0e2005',
  'fill_blank',
  'undefined',
  4,
  '{"text_before":"Yo","correct":"puedo","text_after":"hacerlo."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '868aeeca-9644-c2f1-422f-f2f7c2f7bb18',
  'e639a619-a490-0f45-eb60-1d6bac0e2005',
  'fill_blank',
  'undefined',
  5,
  '{"text_before":"Yo","correct":"debo","text_after":"irme."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '1d884b44-bfcb-931c-e6cc-97340bda18e3',
  'e639a619-a490-0f45-eb60-1d6bac0e2005',
  'fill_blank',
  'undefined',
  6,
  '{"text_before":"Tú","correct":"deberías","text_after":"comer."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'e4b92477-0daa-31d2-7a64-f7785953be11',
  'e639a619-a490-0f45-eb60-1d6bac0e2005',
  'fill_blank',
  'undefined',
  7,
  '{"text_before":"¿","correct":"Podrías","text_after":"ayudarme?"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '6897569f-fe00-9ecd-d26d-1af16c98b1e1',
  'e639a619-a490-0f45-eb60-1d6bac0e2005',
  'fill_blank',
  'undefined',
  8,
  '{"text_before":"Me gustaría","correct":"aprender","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '2403a020-c28f-1eef-4138-8b6f6f9497ca',
  'e639a619-a490-0f45-eb60-1d6bac0e2005',
  'fill_blank',
  'undefined',
  9,
  '{"text_before":"¿","correct":"Puedo","text_after":"ayudar?"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'e51b2fd7-a8ff-31d6-5c04-a58abe3abe80',
  'e639a619-a490-0f45-eb60-1d6bac0e2005',
  'word_order',
  'undefined',
  10,
  '{"correct":["Yo","puedo","ayudar"],"words":["ayudar","puedo","Yo","aprender"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '2d027792-e119-a15d-3621-1b78a7f8cf09',
  'e639a619-a490-0f45-eb60-1d6bac0e2005',
  'word_order',
  'undefined',
  11,
  '{"correct":["Tú","debes","aprender"],"words":["aprender","debes","Tú","ayudar"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '5c16a007-5ce5-16c2-4dd3-cf747207e9d1',
  'e639a619-a490-0f45-eb60-1d6bac0e2005',
  'word_order',
  'undefined',
  12,
  '{"correct":["Yo","debería","dormir"],"words":["dormir","debería","Yo","poder"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'b933d7fe-c4a3-940b-c4fd-089c237e556b',
  'e639a619-a490-0f45-eb60-1d6bac0e2005',
  'word_order',
  'undefined',
  13,
  '{"correct":["¿Podríamos","ir","nosotros?"],"words":["ir","nosotros?","¿Podríamos","deberíamos"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'f9ad87da-5d8f-44e6-69df-ef022bf72b45',
  'e639a619-a490-0f45-eb60-1d6bac0e2005',
  'word_order',
  'undefined',
  14,
  '{"correct":["A ellos","les gustaría","ayudar"],"words":["ayudar","les gustaría","A ellos","pueden"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '7da068d7-4c48-5c54-c71f-8ab067cc1562',
  'e639a619-a490-0f45-eb60-1d6bac0e2005',
  'word_order',
  'undefined',
  15,
  '{"correct":["Nosotros","debemos","trabajar"],"words":["trabajar","debemos","Nosotros","podemos"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('7160a79c-5864-e2f0-959f-2c527c03886e', 'conversation', 'intermediate', 303)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('004f09f2-067a-2523-98d0-cce2822f0c3f', '7160a79c-5864-e2f0-959f-2c527c03886e', 'en', 'Opinions', 'Expressing your thoughts and opinions.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('0df0b8b7-7fb3-ddb3-1f8b-8a7eaaa429f0', '7160a79c-5864-e2f0-959f-2c527c03886e', 'es', 'Opiniones', 'Expresando tus pensamientos y opiniones.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (base_key, category, level)
VALUES ('think', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'think'), 'en', 'think', 'think')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'think'), 'es', 'pienso que', 'pienso que')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('believe', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'believe'), 'en', 'believe', 'believe')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'believe'), 'es', 'creo que', 'creo que')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('guess', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'guess'), 'en', 'guess', 'guess')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'guess'), 'es', 'supongo', 'supongo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('agree', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'agree'), 'en', 'agree', 'agree')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'agree'), 'es', 'de acuerdo', 'de acuerdo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('disagree', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'disagree'), 'en', 'disagree', 'disagree')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'disagree'), 'es', 'en desacuerdo', 'en desacuerdo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('idea', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'idea'), 'en', 'idea', 'idea')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'idea'), 'es', 'idea', 'idea')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('maybe', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'maybe'), 'en', 'maybe', 'maybe')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'maybe'), 'es', 'tal vez', 'tal vez')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('opinion', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'opinion'), 'en', 'opinion', 'opinion')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'opinion'), 'es', 'opinión', 'opinión')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'ababb2bf-c4ab-4430-a7ec-6ca3560f352f',
  '7160a79c-5864-e2f0-959f-2c527c03886e',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"Pienso que...","options":["Pienso que...","Creo que...","En desacuerdo..."]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'ecd606fe-cb87-8afe-7bfc-466c31ace0a2',
  '7160a79c-5864-e2f0-959f-2c527c03886e',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"Estoy de acuerdo","options":["Estoy de acuerdo","Tengo idea","Tal vez"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '4cd050ac-ca56-4382-3186-9a67c71629d9',
  '7160a79c-5864-e2f0-959f-2c527c03886e',
  'listening',
  'undefined',
  3,
  '{"correct":"It is a good idea.","audio_text":"Es una buena idea."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '2134328b-d42c-0c4e-8d1b-03b2a08bee95',
  '7160a79c-5864-e2f0-959f-2c527c03886e',
  'fill_blank',
  'undefined',
  4,
  '{"text_before":"Yo","correct":"creo","text_after":"que es verdad."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '1d82137f-9281-885a-8216-4f31f0b788d5',
  '7160a79c-5864-e2f0-959f-2c527c03886e',
  'fill_blank',
  'undefined',
  5,
  '{"text_before":"Estoy","correct":"de acuerdo","text_after":"contigo."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'dee8b87d-b6c7-5726-8800-8514aa5d794d',
  '7160a79c-5864-e2f0-959f-2c527c03886e',
  'fill_blank',
  'undefined',
  6,
  '{"text_before":"Estoy","correct":"en desacuerdo","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '6a68c2b9-49e8-dc25-fede-058102fbe762',
  '7160a79c-5864-e2f0-959f-2c527c03886e',
  'fill_blank',
  'undefined',
  7,
  '{"text_before":"Es una mala","correct":"idea","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '9caae6e3-c9ba-e5c4-a89e-ca8934f80fa5',
  '7160a79c-5864-e2f0-959f-2c527c03886e',
  'fill_blank',
  'undefined',
  8,
  '{"text_before":"","correct":"Tal vez","text_after":"más tarde."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'dca5c1bc-4fa8-657a-9e83-859dafdec144',
  '7160a79c-5864-e2f0-959f-2c527c03886e',
  'fill_blank',
  'undefined',
  9,
  '{"text_before":"En mi","correct":"opinión","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'd5ea0ba0-3a6d-d619-7a3e-ddbf19ab9ad2',
  '7160a79c-5864-e2f0-959f-2c527c03886e',
  'word_order',
  'undefined',
  10,
  '{"correct":["Pienso","que","es bueno"],"words":["es bueno","que","Pienso","acuerdo"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '9c72274f-d779-0bb2-9198-74fa9655f525',
  '7160a79c-5864-e2f0-959f-2c527c03886e',
  'word_order',
  'undefined',
  11,
  '{"correct":["Estoy","de acuerdo","con eso"],"words":["con eso","de acuerdo","Estoy","idea"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '07638a69-e7da-9b44-b928-2673ae704a77',
  '7160a79c-5864-e2f0-959f-2c527c03886e',
  'word_order',
  'undefined',
  12,
  '{"correct":["Estoy","en desacuerdo","totalmente"],"words":["totalmente","en desacuerdo","Estoy","pienso"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'aa3213d8-26ea-5a94-fbe8-f89a428946c2',
  '7160a79c-5864-e2f0-959f-2c527c03886e',
  'word_order',
  'undefined',
  13,
  '{"correct":["Es","una","gran idea"],"words":["gran idea","una","Es","opinión"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '7c832ed7-35d9-b16f-a5f3-14972b9e5c3c',
  '7160a79c-5864-e2f0-959f-2c527c03886e',
  'word_order',
  'undefined',
  14,
  '{"correct":["Tal vez","podemos","ir"],"words":["ir","podemos","Tal vez","acuerdo"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '3abdf56d-5b46-d311-e000-40c30166c308',
  '7160a79c-5864-e2f0-959f-2c527c03886e',
  'word_order',
  'undefined',
  15,
  '{"correct":["En","mi opinión","sí"],"words":["sí","mi opinión","En","supongo"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

