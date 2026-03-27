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

INSERT INTO public.words (id, base_key, category, level)
VALUES ('94bd1867-0337-6a71-d11d-eac73dc90c39', 'big', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('66cfa306-f0dd-747c-9db4-2c82ac1399b8', '94bd1867-0337-6a71-d11d-eac73dc90c39', 'en', 'big', 'big')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('290742e6-ba0b-7312-a790-9caeeafccfd6', '94bd1867-0337-6a71-d11d-eac73dc90c39', 'es', 'grande', 'grande')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('9fc0689a-58c6-46d4-8934-f5325bd1e6ac', 'small', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('9a0c779a-cf70-440a-cefe-157cabd31096', '9fc0689a-58c6-46d4-8934-f5325bd1e6ac', 'en', 'small', 'small')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('f01a8b22-9cd1-4759-f225-d02f09be30f2', '9fc0689a-58c6-46d4-8934-f5325bd1e6ac', 'es', 'pequeño', 'pequeño')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('cd81e8a2-abad-8584-3721-8b6903a219bd', 'good', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('27501caf-ab6b-5c26-4cae-3b2776e1e03e', 'cd81e8a2-abad-8584-3721-8b6903a219bd', 'en', 'good', 'good')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('e7d18bcf-d8ce-26cf-3ea4-6b041de1a255', 'cd81e8a2-abad-8584-3721-8b6903a219bd', 'es', 'bueno', 'bueno')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('7d4638d9-f538-fedc-f80e-08393b0cba72', 'bad', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('f5931266-0e78-03c8-a981-be639a5e4981', '7d4638d9-f538-fedc-f80e-08393b0cba72', 'en', 'bad', 'bad')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('21a40095-9958-581e-7a24-84f184f45d00', '7d4638d9-f538-fedc-f80e-08393b0cba72', 'es', 'malo', 'malo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('e4cc3f25-042a-a026-1d36-44db97a14d47', 'hot', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('fd8c9f80-1ef6-f73b-462a-ef80b3e43e04', 'e4cc3f25-042a-a026-1d36-44db97a14d47', 'en', 'hot', 'hot')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('d26f848c-57f3-16b7-dbc3-e89f391c036a', 'e4cc3f25-042a-a026-1d36-44db97a14d47', 'es', 'caliente', 'caliente')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('03f5ae71-356c-64b6-31d7-8ea139d8937d', 'cold', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('e3282fb0-9df5-78f4-535c-4ddbf978f362', '03f5ae71-356c-64b6-31d7-8ea139d8937d', 'en', 'cold', 'cold')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('245ad5e0-b075-1142-79d8-5a5cfde05ecf', '03f5ae71-356c-64b6-31d7-8ea139d8937d', 'es', 'frío', 'frío')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('dbaa7539-fe53-4ef6-ea55-fb959b6eb26f', 'beautiful', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('d75484c4-295e-d3ac-481d-ca611d63acba', 'dbaa7539-fe53-4ef6-ea55-fb959b6eb26f', 'en', 'beautiful', 'beautiful')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('c21d9bb3-1cb4-7601-5708-06dbc437c5f2', 'dbaa7539-fe53-4ef6-ea55-fb959b6eb26f', 'es', 'hermoso', 'hermoso')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('f1cc8a52-deaf-4d14-784f-ab21ccd39b84', 'ugly', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('6ea6be5e-ae97-dd18-4777-83c3f399380b', 'f1cc8a52-deaf-4d14-784f-ab21ccd39b84', 'en', 'ugly', 'ugly')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('01dcef7d-3ef5-3a0b-9119-216cd17ad769', 'f1cc8a52-deaf-4d14-784f-ab21ccd39b84', 'es', 'feo', 'feo')
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

INSERT INTO public.words (id, base_key, category, level)
VALUES ('0a517aa6-0ad5-14ff-6900-ff4ec52578c1', 'what', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('ccbf0d47-cbf6-e668-6185-fe9f7a64a490', '0a517aa6-0ad5-14ff-6900-ff4ec52578c1', 'en', 'what', 'what')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('800bb296-16aa-feda-a730-f3eaee7c75e1', '0a517aa6-0ad5-14ff-6900-ff4ec52578c1', 'es', 'qué', 'qué')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('b1a827fd-faa7-73dd-be98-ca341b01435c', 'where', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('4304dac3-f0da-80f2-7c03-91fd8158a13c', 'b1a827fd-faa7-73dd-be98-ca341b01435c', 'en', 'where', 'where')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('81402b4d-442a-8cd3-71f4-4620f0a09b6f', 'b1a827fd-faa7-73dd-be98-ca341b01435c', 'es', 'dónde', 'dónde')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('276fbdf8-f6f6-5179-f8a9-9690599661ac', 'who', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('f4286b0c-47c7-8178-a0f4-36e828c9975a', '276fbdf8-f6f6-5179-f8a9-9690599661ac', 'en', 'who', 'who')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('8f5038cd-033c-293f-a4e3-1985f28a6593', '276fbdf8-f6f6-5179-f8a9-9690599661ac', 'es', 'quién', 'quién')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('5e7322c9-c93d-2e59-c453-4a4226940401', 'when', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('b57575dc-e963-0c77-1d74-d09b3fa8f58e', '5e7322c9-c93d-2e59-c453-4a4226940401', 'en', 'when', 'when')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('655e4592-5a63-f2ef-62a2-f29c7bdea941', '5e7322c9-c93d-2e59-c453-4a4226940401', 'es', 'cuándo', 'cuándo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('2794e61b-f263-602f-dfc5-9600ce9cbe1a', 'why', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('0c3b4d37-3b5e-3e5b-71cc-aada5914ea45', '2794e61b-f263-602f-dfc5-9600ce9cbe1a', 'en', 'why', 'why')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('00368986-0b78-a1fd-5441-bb72a3025eab', '2794e61b-f263-602f-dfc5-9600ce9cbe1a', 'es', 'por qué', 'por qué')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('a907d813-fd4d-5e77-aa0b-93c2b79c3fd0', 'how', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('5079ce2d-6940-3691-b191-2453295b0094', 'a907d813-fd4d-5e77-aa0b-93c2b79c3fd0', 'en', 'how', 'how')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('b426eac2-d9f2-5352-6bc1-7001edf225e9', 'a907d813-fd4d-5e77-aa0b-93c2b79c3fd0', 'es', 'cómo', 'cómo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('7d4ec318-f911-9bdf-5b6a-3fc737e0fa5d', 'which', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('1223ed4c-3cbc-b137-1ca3-088a1699e52e', '7d4ec318-f911-9bdf-5b6a-3fc737e0fa5d', 'en', 'which', 'which')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('f037ec8f-e7be-8a56-fdfb-d9319a5243e3', '7d4ec318-f911-9bdf-5b6a-3fc737e0fa5d', 'es', 'cuál', 'cuál')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('a1332a9c-37ec-d9d1-1f52-bd52abcd4b05', 'how_much', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('272d4ce7-aba2-b1f7-31d7-0fb3d6bb8ad1', 'a1332a9c-37ec-d9d1-1f52-bd52abcd4b05', 'en', 'how much', 'how much')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('f43b1291-83e4-aeec-327c-747fb6e16eb0', 'a1332a9c-37ec-d9d1-1f52-bd52abcd4b05', 'es', 'cuánto', 'cuánto')
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

INSERT INTO public.words (id, base_key, category, level)
VALUES ('9a345c05-1bb1-bdde-3ce6-6d8186f7e262', 'water', 'daily_life', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('351c30e6-331a-80f2-0c5e-4e2f25c01b0c', '9a345c05-1bb1-bdde-3ce6-6d8186f7e262', 'en', 'water', 'water')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('6c4c76e7-c28c-9a1c-bf4b-41897fbaa960', '9a345c05-1bb1-bdde-3ce6-6d8186f7e262', 'es', 'agua', 'agua')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('64162f43-4d1f-76d7-5676-80902797e748', 'coffee', 'daily_life', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('bd70e36e-cfe3-4cf5-36e4-bccb5367442c', '64162f43-4d1f-76d7-5676-80902797e748', 'en', 'coffee', 'coffee')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('de89841d-4311-5ca5-529e-8320ecae3dae', '64162f43-4d1f-76d7-5676-80902797e748', 'es', 'café', 'café')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('d7a4ecdb-da6f-0140-2336-72c90c1c1112', 'bread', 'daily_life', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('54c19a3c-3df5-cc52-66c7-c150986c7798', 'd7a4ecdb-da6f-0140-2336-72c90c1c1112', 'en', 'bread', 'bread')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('8148944a-9dc5-4d78-e9d9-f3c9abe555c2', 'd7a4ecdb-da6f-0140-2336-72c90c1c1112', 'es', 'pan', 'pan')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('a08a59bd-7255-4201-f220-0b849e3854ff', 'chicken', 'daily_life', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('a628d261-7487-2406-877f-8877dfbf425d', 'a08a59bd-7255-4201-f220-0b849e3854ff', 'en', 'chicken', 'chicken')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('047833ab-22f6-1f25-5260-744009335375', 'a08a59bd-7255-4201-f220-0b849e3854ff', 'es', 'pollo', 'pollo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('28ebaef8-51d0-6431-7f9a-39f4f38ce8a7', 'apple', 'daily_life', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('aa61eadb-da0d-fe2b-503d-01885533e81d', '28ebaef8-51d0-6431-7f9a-39f4f38ce8a7', 'en', 'apple', 'apple')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('d9cabf2f-7b0f-537b-e823-58a9856501ce', '28ebaef8-51d0-6431-7f9a-39f4f38ce8a7', 'es', 'manzana', 'manzana')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('f556d49c-58d4-3b9b-6d0c-3f9d77ea3341', 'milk', 'daily_life', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('30ab92b5-9995-58ad-ea10-ca5d02d83835', 'f556d49c-58d4-3b9b-6d0c-3f9d77ea3341', 'en', 'milk', 'milk')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('55015755-66ee-9d73-698c-e27496d17fad', 'f556d49c-58d4-3b9b-6d0c-3f9d77ea3341', 'es', 'leche', 'leche')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('605c1a47-4a39-52df-a4f2-d7f263cc3772', 'meat', 'daily_life', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('1716b7cb-e989-9cd0-7f90-24a740f96a5b', '605c1a47-4a39-52df-a4f2-d7f263cc3772', 'en', 'meat', 'meat')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('999ead26-9a2b-7f8f-bd71-6acfca025f4f', '605c1a47-4a39-52df-a4f2-d7f263cc3772', 'es', 'carne', 'carne')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('7adce4ed-1db7-8a3c-fb04-3b322f54f3d6', 'cheese', 'daily_life', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('11631eb3-f3f8-517d-93f1-1da86d4832dc', '7adce4ed-1db7-8a3c-fb04-3b322f54f3d6', 'en', 'cheese', 'cheese')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('55069d9f-b7e1-c910-f51b-7421d7190dcd', '7adce4ed-1db7-8a3c-fb04-3b322f54f3d6', 'es', 'queso', 'queso')
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

INSERT INTO public.words (id, base_key, category, level)
VALUES ('9328f2d7-6405-45b4-3c1a-5ae521f88edf', 'mother', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('616efc5f-d81c-c1b5-9c4a-5c8e57179695', '9328f2d7-6405-45b4-3c1a-5ae521f88edf', 'en', 'mother', 'mother')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('1582c4d2-f1e2-9b3f-48a0-af14d600e115', '9328f2d7-6405-45b4-3c1a-5ae521f88edf', 'es', 'madre', 'madre')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('0a50e397-8dae-cf7e-9a72-edf06e1f359c', 'father', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('56be868c-43ff-0206-96af-dd022608d20a', '0a50e397-8dae-cf7e-9a72-edf06e1f359c', 'en', 'father', 'father')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('78ecb0b6-0f43-7c50-932d-bc97558bc7c6', '0a50e397-8dae-cf7e-9a72-edf06e1f359c', 'es', 'padre', 'padre')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('550306e1-1df9-2fb1-3750-98c8716b8c45', 'friend', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('4d28cce4-e161-47e4-3cab-e75e1decd933', '550306e1-1df9-2fb1-3750-98c8716b8c45', 'en', 'friend', 'friend')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('18029166-499d-f3ff-6a9d-9d7472ab914f', '550306e1-1df9-2fb1-3750-98c8716b8c45', 'es', 'amigo', 'amigo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('d8e92dc7-5a6b-fbca-7fc5-adb91c956576', 'brother', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('ac2dc9e8-ceb4-108b-9b8c-594acdedc4dc', 'd8e92dc7-5a6b-fbca-7fc5-adb91c956576', 'en', 'brother', 'brother')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('20ae4ea4-81d7-e2b0-7d14-7a6b6288d412', 'd8e92dc7-5a6b-fbca-7fc5-adb91c956576', 'es', 'hermano', 'hermano')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('92d2037d-f6ae-1497-4e59-308ef8b304a2', 'sister', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('7f9fefdf-8aa6-d82b-0adf-5e609eff8922', '92d2037d-f6ae-1497-4e59-308ef8b304a2', 'en', 'sister', 'sister')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('84139b7e-c125-f154-866a-10aafdf900c5', '92d2037d-f6ae-1497-4e59-308ef8b304a2', 'es', 'hermana', 'hermana')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('d18fecdd-cb9d-c652-f2dd-d5351de5149e', 'child', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('4283b671-2828-a99b-1c60-6d89037e72df', 'd18fecdd-cb9d-c652-f2dd-d5351de5149e', 'en', 'child', 'child')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('46814320-ec51-2447-1167-7d6b81b7254f', 'd18fecdd-cb9d-c652-f2dd-d5351de5149e', 'es', 'niño', 'niño')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('cc86ccc8-94d2-7988-afc8-365a6a9c2581', 'person', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('f63a9a12-db78-fc28-56a8-6000b66853a5', 'cc86ccc8-94d2-7988-afc8-365a6a9c2581', 'en', 'person', 'person')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('09215f20-bb93-a003-abc0-54af8535915b', 'cc86ccc8-94d2-7988-afc8-365a6a9c2581', 'es', 'persona', 'persona')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('8cadc976-8e8f-15a0-6ee0-920d98a23564', 'people', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('d6624406-b21c-77bf-8ff6-a4244ce560c1', '8cadc976-8e8f-15a0-6ee0-920d98a23564', 'en', 'people', 'people')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('a0a8d35b-0167-1a8c-71ce-c541927ca4cb', '8cadc976-8e8f-15a0-6ee0-920d98a23564', 'es', 'gente', 'gente')
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

INSERT INTO public.words (id, base_key, category, level)
VALUES ('83913715-d00e-ade6-c0d3-696db83a9255', 'one', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('a7eb1d07-ff98-cef6-056c-4e159e72ce36', '83913715-d00e-ade6-c0d3-696db83a9255', 'en', 'one', 'one')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('9991969f-78c5-41ff-22c6-6bdc16f96bb7', '83913715-d00e-ade6-c0d3-696db83a9255', 'es', 'uno', 'uno')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('2be4ce58-3f07-da54-722f-381be1554f77', 'two', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('384187cc-4602-1301-10ac-faa8c0cef730', '2be4ce58-3f07-da54-722f-381be1554f77', 'en', 'two', 'two')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('a558438e-dc04-f6d6-72c8-113769462327', '2be4ce58-3f07-da54-722f-381be1554f77', 'es', 'dos', 'dos')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('06578781-da57-6fdd-4bf5-33c38143cab4', 'three', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('c9710f88-ead2-e22b-613d-6630e3ace28f', '06578781-da57-6fdd-4bf5-33c38143cab4', 'en', 'three', 'three')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('af6a0809-d47b-d627-e57e-6dc4575f01cc', '06578781-da57-6fdd-4bf5-33c38143cab4', 'es', 'tres', 'tres')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('3e79e1ac-4bb0-1fad-8ba4-d6fc3d8afd6a', 'today', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('7ac65280-4e2f-acb6-b643-5afdf36aadec', '3e79e1ac-4bb0-1fad-8ba4-d6fc3d8afd6a', 'en', 'today', 'today')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('578fa32c-4a2f-b48d-268f-ae6bb802bbeb', '3e79e1ac-4bb0-1fad-8ba4-d6fc3d8afd6a', 'es', 'hoy', 'hoy')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('2f3a9e30-faab-93db-c59f-874abc62c5a1', 'now', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('e4657a15-eb5f-e823-06b4-ef8c7ce43ce4', '2f3a9e30-faab-93db-c59f-874abc62c5a1', 'en', 'now', 'now')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('c271fd32-31a1-052e-7b68-cf0878b22920', '2f3a9e30-faab-93db-c59f-874abc62c5a1', 'es', 'ahora', 'ahora')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('21c4f300-8403-839e-6df4-2972ac1a4618', 'tomorrow', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('bc9c79c8-6fa8-333c-ae4b-685e1165da49', '21c4f300-8403-839e-6df4-2972ac1a4618', 'en', 'tomorrow', 'tomorrow')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('5b48becd-fa27-19aa-9367-f0af399fc1b1', '21c4f300-8403-839e-6df4-2972ac1a4618', 'es', 'mañana', 'mañana')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('34c38c2b-9407-7b1b-72da-5b0a0e76b898', 'yesterday', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('64f7875b-f72e-392f-091d-55378d2d9098', '34c38c2b-9407-7b1b-72da-5b0a0e76b898', 'en', 'yesterday', 'yesterday')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('ee7a9476-b511-3742-f52d-f1dde0f8ddd9', '34c38c2b-9407-7b1b-72da-5b0a0e76b898', 'es', 'ayer', 'ayer')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('8449ca89-17dc-46eb-068b-5240ddd47dfb', 'time', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('ce232302-b335-867b-b285-1ecd4dbcd2e8', '8449ca89-17dc-46eb-068b-5240ddd47dfb', 'en', 'time', 'time')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('2bd6cbce-642c-ecd0-afb0-d5e5cc502158', '8449ca89-17dc-46eb-068b-5240ddd47dfb', 'es', 'tiempo', 'tiempo')
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

