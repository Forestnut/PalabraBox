-- Migration auto-generated for content update

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('063a9ff8-017c-71cb-def4-149748527027', 'basics', 'beginner', 200)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('08e942a6-fe12-b763-b379-2fea9f34a1ae', '063a9ff8-017c-71cb-def4-149748527027', 'en', 'Adjectives', 'Learn basic adjectives to describe things.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('ee8533b6-d826-4db9-576b-6be0de87ca09', '063a9ff8-017c-71cb-def4-149748527027', 'es', 'Adjetivos', 'Aprende adjetivos básicos para describir cosas.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (base_key, category, level)
VALUES ('big', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'big'), 'en', 'big', 'big')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'big'), 'es', 'grande', 'grande')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('small', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'small'), 'en', 'small', 'small')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'small'), 'es', 'pequeño', 'pequeño')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('good', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'good'), 'en', 'good', 'good')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'good'), 'es', 'bueno', 'bueno')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('bad', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'bad'), 'en', 'bad', 'bad')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'bad'), 'es', 'malo', 'malo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('hot', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'hot'), 'en', 'hot', 'hot')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'hot'), 'es', 'caliente', 'caliente')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('cold', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'cold'), 'en', 'cold', 'cold')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'cold'), 'es', 'frío', 'frío')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('beautiful', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'beautiful'), 'en', 'beautiful', 'beautiful')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'beautiful'), 'es', 'hermoso', 'hermoso')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('ugly', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'ugly'), 'en', 'ugly', 'ugly')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'ugly'), 'es', 'feo', 'feo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '083e6029-4b21-6bf7-ee0e-3c8d4ece54a9',
  '063a9ff8-017c-71cb-def4-149748527027',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"grande","options":["grande","pequeño","bueno"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '37bb16f5-590c-cc9c-b792-8e7d6fbc7e23',
  '063a9ff8-017c-71cb-def4-149748527027',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"El café está caliente","options":["El café está caliente","El té está frío","El café es malo"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '110d5328-d4e5-d736-9434-9624b60fc337',
  '063a9ff8-017c-71cb-def4-149748527027',
  'listening',
  'undefined',
  3,
  '{"correct":"It is cold","audio_text":"Hace frío"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '3865f59e-002d-90a0-42b7-df1b53ca6975',
  '063a9ff8-017c-71cb-def4-149748527027',
  'fill_blank',
  'undefined',
  4,
  '{"correct":"grande","text_before":"La casa es ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '5fab3230-0e18-7794-e2b2-915f8a15a5f1',
  '063a9ff8-017c-71cb-def4-149748527027',
  'fill_blank',
  'undefined',
  5,
  '{"correct":"pequeño","text_before":"El perro es ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '6427446d-bb89-6adf-b39e-9954baa988cb',
  '063a9ff8-017c-71cb-def4-149748527027',
  'fill_blank',
  'undefined',
  6,
  '{"correct":"buena","text_before":"La comida es ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '6af0ddd4-9ad6-43ad-6e4e-835e17ea9785',
  '063a9ff8-017c-71cb-def4-149748527027',
  'fill_blank',
  'undefined',
  7,
  '{"correct":"malo","text_before":"El clima es ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '4cffaaa4-89d6-2023-cf02-786c78881f0d',
  '063a9ff8-017c-71cb-def4-149748527027',
  'fill_blank',
  'undefined',
  8,
  '{"correct":"fría","text_before":"El agua está ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '3185b2a9-20dc-3810-3266-abf36c3882b7',
  '063a9ff8-017c-71cb-def4-149748527027',
  'fill_blank',
  'undefined',
  9,
  '{"correct":"hermosa","text_before":"Ella es ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '676f5a56-5868-716a-71ba-38088b4159d4',
  '063a9ff8-017c-71cb-def4-149748527027',
  'word_order',
  'undefined',
  10,
  '{"correct":["Un","libro","bueno"],"words":["Un","libro","bueno","malo","grande"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'db862277-590b-271a-6baa-a09b53544782',
  '063a9ff8-017c-71cb-def4-149748527027',
  'word_order',
  'undefined',
  11,
  '{"correct":["El","café","caliente"],"words":["El","café","caliente","frío","es"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '8c3b90bc-b1cb-c075-1c6a-52a00935b078',
  '063a9ff8-017c-71cb-def4-149748527027',
  'word_order',
  'undefined',
  12,
  '{"correct":["Es","una","casa","pequeña"],"words":["Es","una","casa","pequeña","un","grande"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'eb771399-4e87-f709-687b-962478f9f74b',
  '063a9ff8-017c-71cb-def4-149748527027',
  'word_order',
  'undefined',
  13,
  '{"correct":["La","comida","es","mala"],"words":["La","comida","es","mala","buena","el"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'd7cfb2b4-debf-57e4-62ed-0c2a3703b78d',
  '063a9ff8-017c-71cb-def4-149748527027',
  'word_order',
  'undefined',
  14,
  '{"correct":["Una","ciudad","hermosa"],"words":["Una","ciudad","hermosa","un","feo"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'b7d6ef70-e1bd-a326-0d92-018a8b4af64f',
  '063a9ff8-017c-71cb-def4-149748527027',
  'word_order',
  'undefined',
  15,
  '{"correct":["El","clima","es","frío"],"words":["El","clima","es","frío","caliente","la"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('516ee08e-e023-ad9e-10f0-88a9743358e5', 'basics', 'beginner', 201)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('96319053-65be-da95-33b1-e84f6ba6d0df', '516ee08e-e023-ad9e-10f0-88a9743358e5', 'en', 'Questions', 'Learn to ask basic questions.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('dfbb7d72-31f2-693b-9a50-a57ef328267a', '516ee08e-e023-ad9e-10f0-88a9743358e5', 'es', 'Preguntas', 'Aprende a hacer preguntas básicas.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (base_key, category, level)
VALUES ('what', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'what'), 'en', 'what', 'what')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'what'), 'es', 'qué', 'qué')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('where', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'where'), 'en', 'where', 'where')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'where'), 'es', 'dónde', 'dónde')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('who', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'who'), 'en', 'who', 'who')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'who'), 'es', 'quién', 'quién')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('when', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'when'), 'en', 'when', 'when')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'when'), 'es', 'cuándo', 'cuándo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('why', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'why'), 'en', 'why', 'why')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'why'), 'es', 'por qué', 'por qué')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('how', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'how'), 'en', 'how', 'how')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'how'), 'es', 'cómo', 'cómo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('which', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'which'), 'en', 'which', 'which')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'which'), 'es', 'cuál', 'cuál')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('how_much', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'how_much'), 'en', 'how much', 'how much')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'how_much'), 'es', 'cuánto', 'cuánto')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '02da9809-dc55-6246-8b3b-c7e5ab8941f8',
  '516ee08e-e023-ad9e-10f0-88a9743358e5',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"¿Dónde está el hotel?","options":["¿Dónde está el hotel?","¿Qué es el hotel?","¿Cuándo es el hotel?"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '1a3ed1aa-0e3f-f693-8079-61b90101f1be',
  '516ee08e-e023-ad9e-10f0-88a9743358e5',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"why","options":["why","what","how"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'a16ca8f2-53bb-bb76-fbe5-4b618e07856d',
  '516ee08e-e023-ad9e-10f0-88a9743358e5',
  'listening',
  'undefined',
  3,
  '{"correct":"¿Cómo estás?","audio_text":"¿Cómo estás?"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'cdbc9edb-bd11-0b59-367a-3fa09f48a7db',
  '516ee08e-e023-ad9e-10f0-88a9743358e5',
  'fill_blank',
  'undefined',
  4,
  '{"correct":"Qué","text_before":"¿","text_after":" es esto?"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'b97251b4-7c21-b519-5f11-116989318b4f',
  '516ee08e-e023-ad9e-10f0-88a9743358e5',
  'fill_blank',
  'undefined',
  5,
  '{"correct":"Dónde","text_before":"¿","text_after":" está el baño?"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'c37e87a5-1fb5-f7f6-1f89-957c175c73e8',
  '516ee08e-e023-ad9e-10f0-88a9743358e5',
  'fill_blank',
  'undefined',
  6,
  '{"correct":"Quién","text_before":"¿","text_after":" es ella?"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'ac3095f2-5cc0-3423-0e33-64c38f827480',
  '516ee08e-e023-ad9e-10f0-88a9743358e5',
  'fill_blank',
  'undefined',
  7,
  '{"correct":"Cuándo","text_before":"¿","text_after":" es la fiesta?"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '95b7ccda-f2dd-3d48-c8f1-98a8626c219a',
  '516ee08e-e023-ad9e-10f0-88a9743358e5',
  'fill_blank',
  'undefined',
  8,
  '{"correct":"Por qué","text_before":"¿","text_after":" estás aquí?"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '3f6173ce-5d97-4868-9fe8-cba88aeb5e58',
  '516ee08e-e023-ad9e-10f0-88a9743358e5',
  'fill_blank',
  'undefined',
  9,
  '{"correct":"Cuánto","text_before":"¿","text_after":" cuesta?"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '81c698f9-bde7-1257-970f-0b38251444bc',
  '516ee08e-e023-ad9e-10f0-88a9743358e5',
  'word_order',
  'undefined',
  10,
  '{"correct":["¿","Qué","quieres","?"],"words":["¿","Qué","quieres","?","Dónde","cómo"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '6385071a-a697-6611-11de-d53a27b5fa13',
  '516ee08e-e023-ad9e-10f0-88a9743358e5',
  'word_order',
  'undefined',
  11,
  '{"correct":["¿","Dónde","está","mi","libro","?"],"words":["¿","Dónde","está","mi","libro","?","Qué","es"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '8081f808-ec17-c557-73c6-4839dd9eac28',
  '516ee08e-e023-ad9e-10f0-88a9743358e5',
  'word_order',
  'undefined',
  12,
  '{"correct":["¿","Quién","eres","tú","?"],"words":["¿","Quién","eres","tú","?","Cuándo","estás"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '89e358af-8ba4-6076-ae67-6be810f5f8fc',
  '516ee08e-e023-ad9e-10f0-88a9743358e5',
  'word_order',
  'undefined',
  13,
  '{"correct":["¿","Cómo","estás","?"],"words":["¿","Cómo","estás","?","Qué","eres"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '7c87e8be-cd85-ca40-0b0c-41f560aa37a4',
  '516ee08e-e023-ad9e-10f0-88a9743358e5',
  'word_order',
  'undefined',
  14,
  '{"correct":["¿","Cuándo","es","?"],"words":["¿","Cuándo","es","?","Dónde","está"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '8329a134-6893-f320-97bf-abf81945c189',
  '516ee08e-e023-ad9e-10f0-88a9743358e5',
  'word_order',
  'undefined',
  15,
  '{"correct":["¿","Por","qué","es","grande","?"],"words":["¿","Por","qué","es","grande","?","pequeño"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('0fca953c-8bff-e618-280c-27634d870c72', 'daily_life', 'beginner', 202)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('91a20394-c3e0-0809-ce50-959144e4a179', '0fca953c-8bff-e618-280c-27634d870c72', 'en', 'Food & Drinks', 'Vocabulary for everyday food and drinks.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('23aa87b8-2a0d-6246-8150-4f7f04c22efb', '0fca953c-8bff-e618-280c-27634d870c72', 'es', 'Comida y Bebidas', 'Vocabulario sobre comida y bebidas diarias.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (base_key, category, level)
VALUES ('water', 'daily_life', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'water'), 'en', 'water', 'water')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'water'), 'es', 'agua', 'agua')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('coffee', 'daily_life', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'coffee'), 'en', 'coffee', 'coffee')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'coffee'), 'es', 'café', 'café')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('bread', 'daily_life', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'bread'), 'en', 'bread', 'bread')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'bread'), 'es', 'pan', 'pan')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('chicken', 'daily_life', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'chicken'), 'en', 'chicken', 'chicken')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'chicken'), 'es', 'pollo', 'pollo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('apple', 'daily_life', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'apple'), 'en', 'apple', 'apple')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'apple'), 'es', 'manzana', 'manzana')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('milk', 'daily_life', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'milk'), 'en', 'milk', 'milk')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'milk'), 'es', 'leche', 'leche')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('meat', 'daily_life', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'meat'), 'en', 'meat', 'meat')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'meat'), 'es', 'carne', 'carne')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('cheese', 'daily_life', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'cheese'), 'en', 'cheese', 'cheese')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'cheese'), 'es', 'queso', 'queso')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'c698686a-9f63-7532-f440-2c5bdc585af6',
  '0fca953c-8bff-e618-280c-27634d870c72',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"pan","options":["pan","pollo","leche"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '31430c4e-bcc3-a029-99b1-49de564e2fee',
  '0fca953c-8bff-e618-280c-27634d870c72',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"water","options":["water","milk","coffee"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '159c6d20-84dd-bc42-79ad-c4593965a31d',
  '0fca953c-8bff-e618-280c-27634d870c72',
  'listening',
  'undefined',
  3,
  '{"correct":"una manzana","audio_text":"una manzana"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'ffbe42f7-fbaf-3cbe-9f7a-fb3759f84dc7',
  '0fca953c-8bff-e618-280c-27634d870c72',
  'fill_blank',
  'undefined',
  4,
  '{"correct":"agua","text_before":"Quiero ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'd83f6e01-5cdf-2fb4-3f13-2e824cafad92',
  '0fca953c-8bff-e618-280c-27634d870c72',
  'fill_blank',
  'undefined',
  5,
  '{"correct":"café","text_before":"El ","text_after":" caliente."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '5a38496a-081d-9750-7eb5-fe9e6c5a7ad0',
  '0fca953c-8bff-e618-280c-27634d870c72',
  'fill_blank',
  'undefined',
  6,
  '{"correct":"manzana","text_before":"Ella come una ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '41e13fcf-9545-2ff2-ab09-ff5def81e966',
  '0fca953c-8bff-e618-280c-27634d870c72',
  'fill_blank',
  'undefined',
  7,
  '{"correct":"pollo","text_before":"Nosotros comemos ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '7e595611-3c0f-0231-f6c0-d2282f3edef6',
  '0fca953c-8bff-e618-280c-27634d870c72',
  'fill_blank',
  'undefined',
  8,
  '{"correct":"pan","text_before":"El ","text_after":" es bueno."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '98919b1b-f17b-51e2-fae1-caae3db993b0',
  '0fca953c-8bff-e618-280c-27634d870c72',
  'fill_blank',
  'undefined',
  9,
  '{"correct":"leche","text_before":"Yo bebo ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'afc701b1-736f-633d-e702-e640a8398d6e',
  '0fca953c-8bff-e618-280c-27634d870c72',
  'word_order',
  'undefined',
  10,
  '{"correct":["Quiero","beber","agua"],"words":["Quiero","beber","agua","comer","pan"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'dad87102-d412-f686-bc9c-e88a1d507458',
  '0fca953c-8bff-e618-280c-27634d870c72',
  'word_order',
  'undefined',
  11,
  '{"correct":["Un","café","caliente"],"words":["Un","café","caliente","agua","fría"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '2269a8e0-06dd-11c8-6294-4a6307b948c5',
  '0fca953c-8bff-e618-280c-27634d870c72',
  'word_order',
  'undefined',
  12,
  '{"correct":["¿","Dónde","está","la","leche","?"],"words":["¿","Dónde","está","la","leche","?","el","agua"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '93e04649-9d36-86b6-f365-19bbbba6d0f0',
  '0fca953c-8bff-e618-280c-27634d870c72',
  'word_order',
  'undefined',
  13,
  '{"correct":["La","carne","es","buena"],"words":["La","carne","es","buena","el","mala"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '5f0d317b-7e01-5948-7227-91664a2b0f23',
  '0fca953c-8bff-e618-280c-27634d870c72',
  'word_order',
  'undefined',
  14,
  '{"correct":["Yo","como","pan","y","queso"],"words":["Yo","como","pan","y","queso","bebo","agua"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'eafc6b69-687d-4f20-2ba2-482ee4348bee',
  '0fca953c-8bff-e618-280c-27634d870c72',
  'word_order',
  'undefined',
  15,
  '{"correct":["Una","manzana","grande"],"words":["Una","manzana","grande","un","pequeña"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('08a646f5-1f85-7a34-2e86-8247cd35fe6b', 'basics', 'beginner', 203)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('aa389a26-7035-ce7a-78b4-f51af1b1b9ff', '08a646f5-1f85-7a34-2e86-8247cd35fe6b', 'en', 'Family & People', 'Learn words for family members and people.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('a514f052-0e2e-fa21-f8f1-9800e828e59b', '08a646f5-1f85-7a34-2e86-8247cd35fe6b', 'es', 'Familia y Personas', 'Aprende palabras para familiares y personas.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (base_key, category, level)
VALUES ('mother', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'mother'), 'en', 'mother', 'mother')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'mother'), 'es', 'madre', 'madre')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('father', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'father'), 'en', 'father', 'father')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'father'), 'es', 'padre', 'padre')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('friend', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'friend'), 'en', 'friend', 'friend')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'friend'), 'es', 'amigo', 'amigo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('brother', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'brother'), 'en', 'brother', 'brother')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'brother'), 'es', 'hermano', 'hermano')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('sister', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'sister'), 'en', 'sister', 'sister')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'sister'), 'es', 'hermana', 'hermana')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('child', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'child'), 'en', 'child', 'child')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'child'), 'es', 'niño', 'niño')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('person', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'person'), 'en', 'person', 'person')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'person'), 'es', 'persona', 'persona')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('people', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'people'), 'en', 'people', 'people')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'people'), 'es', 'gente', 'gente')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '3fc43e50-436d-ade9-8e5c-ced6f06f2092',
  '08a646f5-1f85-7a34-2e86-8247cd35fe6b',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"amigo","options":["amigo","hermano","padre"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '2668bec7-14b1-feb0-34e6-6fd4c20d1321',
  '08a646f5-1f85-7a34-2e86-8247cd35fe6b',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"mother","options":["mother","sister","person"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'a6b7ef10-4ddb-095f-a1b7-eb3228ea9f50',
  '08a646f5-1f85-7a34-2e86-8247cd35fe6b',
  'listening',
  'undefined',
  3,
  '{"correct":"Mi hermano","audio_text":"Mi hermano"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'ed270aeb-4a5e-a3db-78ac-fb7b4400196d',
  '08a646f5-1f85-7a34-2e86-8247cd35fe6b',
  'fill_blank',
  'undefined',
  4,
  '{"correct":"madre","text_before":"Ella es mi ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '10e0ff68-7160-9402-da16-8f85623daf23',
  '08a646f5-1f85-7a34-2e86-8247cd35fe6b',
  'fill_blank',
  'undefined',
  5,
  '{"correct":"padre","text_before":"Él es mi ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '70dfb6db-51c0-c512-35eb-ca11fabab22f',
  '08a646f5-1f85-7a34-2e86-8247cd35fe6b',
  'fill_blank',
  'undefined',
  6,
  '{"correct":"amigos","text_before":"Ellos son mis ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '6cfa89fc-451e-b80a-6fb6-4d2c5269faf3',
  '08a646f5-1f85-7a34-2e86-8247cd35fe6b',
  'fill_blank',
  'undefined',
  7,
  '{"correct":"persona","text_before":"Ella es una buena ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '88c3a537-7885-d8a9-606e-2dfda7f3c948',
  '08a646f5-1f85-7a34-2e86-8247cd35fe6b',
  'fill_blank',
  'undefined',
  8,
  '{"correct":"niño","text_before":"El ","text_after":" es pequeño."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '6746b60c-17ad-a3c4-4fdd-7f72cda183a2',
  '08a646f5-1f85-7a34-2e86-8247cd35fe6b',
  'fill_blank',
  'undefined',
  9,
  '{"correct":"hermana","text_before":"Mi ","text_after":" está aquí."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '45a36f09-01db-561d-eaa3-fc5ff0093189',
  '08a646f5-1f85-7a34-2e86-8247cd35fe6b',
  'word_order',
  'undefined',
  10,
  '{"correct":["Mi","padre","es","una","buena","persona"],"words":["Mi","padre","es","una","buena","persona","mal","niño"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '11c98965-3067-8be4-a00c-ca715c561c6e',
  '08a646f5-1f85-7a34-2e86-8247cd35fe6b',
  'word_order',
  'undefined',
  11,
  '{"correct":["¿","Dónde","está","tu","hermano","?"],"words":["¿","Dónde","está","tu","hermano","?","qué","madre"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '0d7a42f2-8a33-3dc6-6888-db3dd910cdb0',
  '08a646f5-1f85-7a34-2e86-8247cd35fe6b',
  'word_order',
  'undefined',
  12,
  '{"correct":["Ella","es","mi","hermana"],"words":["Ella","es","mi","hermana","él","amigo"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'ca3cf92a-4b44-2ba5-fefc-e6844adbca12',
  '08a646f5-1f85-7a34-2e86-8247cd35fe6b',
  'word_order',
  'undefined',
  13,
  '{"correct":["La","gente","hermosa"],"words":["La","gente","hermosa","las","grandes"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '2da6d748-18de-7b93-8b7e-aae209bd3b79',
  '08a646f5-1f85-7a34-2e86-8247cd35fe6b',
  'word_order',
  'undefined',
  14,
  '{"correct":["Un","niño","pequeño"],"words":["Un","niño","pequeño","grande","padre"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '40cb4037-1028-6803-ab01-da38b045d258',
  '08a646f5-1f85-7a34-2e86-8247cd35fe6b',
  'word_order',
  'undefined',
  15,
  '{"correct":["¿","Quién","es","tu","amigo","?"],"words":["¿","Quién","es","tu","amigo","?","Dónde","madre"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('796bc90f-8fb8-f15b-e476-01f31e9adc05', 'basics', 'beginner', 204)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('70e0819b-90f6-921d-8927-1ac67133f243', '796bc90f-8fb8-f15b-e476-01f31e9adc05', 'en', 'Numbers & Time', 'Learn numbers and how to talk about time.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('ae9d79d3-67c5-1564-2475-484c9be94eed', '796bc90f-8fb8-f15b-e476-01f31e9adc05', 'es', 'Números y Tiempo', 'Aprende los números y cómo hablar sobre el tiempo.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (base_key, category, level)
VALUES ('one', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'one'), 'en', 'one', 'one')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'one'), 'es', 'uno', 'uno')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('two', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'two'), 'en', 'two', 'two')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'two'), 'es', 'dos', 'dos')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('three', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'three'), 'en', 'three', 'three')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'three'), 'es', 'tres', 'tres')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('today', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'today'), 'en', 'today', 'today')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'today'), 'es', 'hoy', 'hoy')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('now', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'now'), 'en', 'now', 'now')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'now'), 'es', 'ahora', 'ahora')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('tomorrow', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'tomorrow'), 'en', 'tomorrow', 'tomorrow')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'tomorrow'), 'es', 'mañana', 'mañana')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('yesterday', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'yesterday'), 'en', 'yesterday', 'yesterday')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'yesterday'), 'es', 'ayer', 'ayer')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('time', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'time'), 'en', 'time', 'time')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'time'), 'es', 'tiempo', 'tiempo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'b31734cb-19fb-c371-14ad-6b018feb8550',
  '796bc90f-8fb8-f15b-e476-01f31e9adc05',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"mañana","options":["mañana","ayer","hoy"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'bf1e558a-1931-abbf-bca3-fe1c71d81ba5',
  '796bc90f-8fb8-f15b-e476-01f31e9adc05',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"two","options":["two","one","three"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '22842693-a113-6648-0e6b-548afbe287a1',
  '796bc90f-8fb8-f15b-e476-01f31e9adc05',
  'listening',
  'undefined',
  3,
  '{"correct":"hoy","audio_text":"hoy"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '04893fa1-1542-3083-c878-34ebf7bc6956',
  '796bc90f-8fb8-f15b-e476-01f31e9adc05',
  'fill_blank',
  'undefined',
  4,
  '{"correct":"una","text_before":"Tengo ","text_after":" manzana."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '457c9df5-dc58-d58d-ed04-0090f40845b6',
  '796bc90f-8fb8-f15b-e476-01f31e9adc05',
  'fill_blank',
  'undefined',
  5,
  '{"correct":"dos","text_before":"Tenemos ","text_after":" hermanos."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'f0e04dcc-47da-367d-4abc-3adccf38aca7',
  '796bc90f-8fb8-f15b-e476-01f31e9adc05',
  'fill_blank',
  'undefined',
  6,
  '{"correct":"tres","text_before":"Quiero ","text_after":" cafés."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '5f9e2e49-af89-f886-0e5d-c89738ec500b',
  '796bc90f-8fb8-f15b-e476-01f31e9adc05',
  'fill_blank',
  'undefined',
  7,
  '{"correct":"Hoy","text_before":"","text_after":" es un buen día."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '5c36909f-a9c3-46de-4db0-74c85a9f8fb5',
  '796bc90f-8fb8-f15b-e476-01f31e9adc05',
  'fill_blank',
  'undefined',
  8,
  '{"correct":"ahora","text_before":"Necesito agua ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '4519c42d-4a18-07ff-2fe0-1b531114b1fa',
  '796bc90f-8fb8-f15b-e476-01f31e9adc05',
  'fill_blank',
  'undefined',
  9,
  '{"correct":"Ayer","text_before":"","text_after":" hizo frío."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '8ae6563e-8331-176a-9331-6d127c6c535e',
  '796bc90f-8fb8-f15b-e476-01f31e9adc05',
  'word_order',
  'undefined',
  10,
  '{"correct":["Lo","quiero","hoy"],"words":["Lo","quiero","hoy","ayer","mañana"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '451fd782-3c45-86c5-0d8b-d42a5f2cd8ce',
  '796bc90f-8fb8-f15b-e476-01f31e9adc05',
  'word_order',
  'undefined',
  11,
  '{"correct":["¿","Dónde","estás","ahora","?"],"words":["¿","Dónde","estás","ahora","?","mañana","quién"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'b1fd454c-8b7f-9322-b4fd-1a404cca01e7',
  '796bc90f-8fb8-f15b-e476-01f31e9adc05',
  'word_order',
  'undefined',
  12,
  '{"correct":["Un","pan","y","dos","cafés"],"words":["Un","pan","y","dos","cafés","tres","agua"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '02cdf2a0-2e2d-ab3d-c80f-85ca6cd83529',
  '796bc90f-8fb8-f15b-e476-01f31e9adc05',
  'word_order',
  'undefined',
  13,
  '{"correct":["Mañana","es","bueno"],"words":["Mañana","es","bueno","ayer","malo"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'fb3960bf-ab11-df1e-b135-6ab72e35885f',
  '796bc90f-8fb8-f15b-e476-01f31e9adc05',
  'word_order',
  'undefined',
  14,
  '{"correct":["Tengo","tres","manzanas"],"words":["Tengo","tres","manzanas","dos","pollos"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '0cf4b39c-8c02-505a-7461-390de03a0055',
  '796bc90f-8fb8-f15b-e476-01f31e9adc05',
  'word_order',
  'undefined',
  15,
  '{"correct":["Ayer","bebí","leche"],"words":["Ayer","bebí","leche","hoy","agua"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

