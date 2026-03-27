-- Migration auto-generated for content update

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('84048b53-8d0c-cc45-5646-69ec64e8522b', 'conversation', 'intermediate', 400)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('ca745a40-93b7-59bb-3945-4e4448bdd165', '84048b53-8d0c-cc45-5646-69ec64e8522b', 'en', 'Preferences', 'Expressing what you like and prefer.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('1fbbef63-6009-9511-d7fe-02c0506e33c0', '84048b53-8d0c-cc45-5646-69ec64e8522b', 'es', 'Preferencias', 'Expresando lo que te gusta y prefieres.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (base_key, category, level)
VALUES ('favorite', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'favorite'), 'en', 'favorite', 'favorite')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'favorite'), 'es', 'favorito', 'favorito')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('prefer', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'prefer'), 'en', 'prefer', 'prefer')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'prefer'), 'es', 'preferir', 'preferir')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('best', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'best'), 'en', 'best', 'best')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'best'), 'es', 'mejor', 'mejor')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('worst', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'worst'), 'en', 'worst', 'worst')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'worst'), 'es', 'peor', 'peor')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('rather', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'rather'), 'en', 'rather', 'rather')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'rather'), 'es', 'preferiría', 'preferiría')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('like', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'like'), 'en', 'like', 'like')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'like'), 'es', 'gustar', 'gustar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('hate', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'hate'), 'en', 'hate', 'hate')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'hate'), 'es', 'odiar', 'odiar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('enjoy', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'enjoy'), 'en', 'enjoy', 'enjoy')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'enjoy'), 'es', 'disfrutar', 'disfrutar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'c077bca0-0e78-76a0-0244-a544bbfc24b2',
  '84048b53-8d0c-cc45-5646-69ec64e8522b',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"Prefiero este","options":["Prefiero este","Odio este","Mejor este"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '2309e8a1-71b6-fc5c-30d3-250f9326f38e',
  '84048b53-8d0c-cc45-5646-69ec64e8522b',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"libro favorito","options":["libro favorito","libro peor","libro más"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'da7204ef-e740-0080-f54d-31a7e5eaa3dd',
  '84048b53-8d0c-cc45-5646-69ec64e8522b',
  'listening',
  'undefined',
  3,
  '{"correct":"I hate waiting.","audio_text":"Odio esperar."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '56c0f221-457b-d514-e719-5c77af362426',
  '84048b53-8d0c-cc45-5646-69ec64e8522b',
  'fill_blank',
  'undefined',
  4,
  '{"correct":"prefiero","text_before":"Yo","text_after":"el té."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'd2004d16-5924-5170-f302-12b9fd8db0f5',
  '84048b53-8d0c-cc45-5646-69ec64e8522b',
  'fill_blank',
  'undefined',
  5,
  '{"correct":"mejor","text_before":"Este es el","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '12593fe3-fb45-8310-f96f-3ee40d7f2c59',
  '84048b53-8d0c-cc45-5646-69ec64e8522b',
  'fill_blank',
  'undefined',
  6,
  '{"correct":"gustan","text_before":"Me","text_after":"las manzanas."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'dead3fb1-4a31-e844-25f9-825546ac9284',
  '84048b53-8d0c-cc45-5646-69ec64e8522b',
  'fill_blank',
  'undefined',
  7,
  '{"correct":"peor","text_before":"Es la","text_after":"idea."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '06d8a7c0-cff8-e9e4-56af-0abe43c2d317',
  '84048b53-8d0c-cc45-5646-69ec64e8522b',
  'fill_blank',
  'undefined',
  8,
  '{"correct":"disfruto","text_before":"Yo","text_after":"leer."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '35539c74-9d10-c253-b60d-d3602df9d61b',
  '84048b53-8d0c-cc45-5646-69ec64e8522b',
  'fill_blank',
  'undefined',
  9,
  '{"correct":"favorito","text_before":"Mi color","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'b1dc1860-aa3a-ae79-b337-a384c6a9c5f6',
  '84048b53-8d0c-cc45-5646-69ec64e8522b',
  'word_order',
  'undefined',
  10,
  '{"correct":["Preferiría","ir","a","casa."],"words":["Preferiría","ir","a","casa.","odio"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '82d74fa1-3550-0f94-3546-9f9699553db3',
  '84048b53-8d0c-cc45-5646-69ec64e8522b',
  'word_order',
  'undefined',
  11,
  '{"correct":["Me","gusta","mucho."],"words":["Me","gusta","mucho.","peor"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '1cbd2210-43c6-cdef-54c4-cc6426b36fc2',
  '84048b53-8d0c-cc45-5646-69ec64e8522b',
  'word_order',
  'undefined',
  12,
  '{"correct":["Ella","prefiere","el","café."],"words":["Ella","prefiere","el","café.","agua"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '37b36f97-4076-b9ed-60bc-c94ff2df58dd',
  '84048b53-8d0c-cc45-5646-69ec64e8522b',
  'word_order',
  'undefined',
  13,
  '{"correct":["No","es","el","mejor."],"words":["No","es","el","mejor.","favorito"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'e3472458-9bb6-8985-cd11-9f425185c60f',
  '84048b53-8d0c-cc45-5646-69ec64e8522b',
  'word_order',
  'undefined',
  14,
  '{"correct":["Odiamos","el","frío."],"words":["Odiamos","el","frío.","calor"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '53d7f54e-9f9e-fcec-abea-2141c4ad376c',
  '84048b53-8d0c-cc45-5646-69ec64e8522b',
  'word_order',
  'undefined',
  15,
  '{"correct":["Mi","película","favorita."],"words":["Mi","película","favorita.","libro"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('862f54f8-4b7c-35e6-f6ab-34ef09d005d2', 'life', 'intermediate', 401)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('e8216753-4775-273e-e7ac-3541df57b3f4', '862f54f8-4b7c-35e6-f6ab-34ef09d005d2', 'en', 'Emotions', 'Talking about feelings and moods.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('a5e125c0-6e8d-483a-1111-9af0fb00df93', '862f54f8-4b7c-35e6-f6ab-34ef09d005d2', 'es', 'Emociones', 'Hablando de sentimientos y estados de ánimo.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (base_key, category, level)
VALUES ('happy', 'life', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'happy'), 'en', 'happy', 'happy')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'happy'), 'es', 'feliz', 'feliz')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('sad', 'life', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'sad'), 'en', 'sad', 'sad')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'sad'), 'es', 'triste', 'triste')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('tired', 'life', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'tired'), 'en', 'tired', 'tired')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'tired'), 'es', 'cansado', 'cansado')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('angry', 'life', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'angry'), 'en', 'angry', 'angry')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'angry'), 'es', 'enojado', 'enojado')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('excited', 'life', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'excited'), 'en', 'excited', 'excited')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'excited'), 'es', 'emocionado', 'emocionado')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('afraid', 'life', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'afraid'), 'en', 'afraid', 'afraid')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'afraid'), 'es', 'asustado', 'asustado')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('surprised', 'life', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'surprised'), 'en', 'surprised', 'surprised')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'surprised'), 'es', 'sorprendido', 'sorprendido')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('nervous', 'life', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'nervous'), 'en', 'nervous', 'nervous')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'nervous'), 'es', 'nervioso', 'nervioso')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'facc80c0-1587-fce2-f87c-01bec9557583',
  '862f54f8-4b7c-35e6-f6ab-34ef09d005d2',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"enojado","options":["enojado","feliz","triste"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '237f4114-1760-33e1-12c6-7b1ff83365a4',
  '862f54f8-4b7c-35e6-f6ab-34ef09d005d2',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"cansada","options":["cansada","asustada","sorprendida"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '4276be1e-5030-2030-fabf-b22b4a77b4a1',
  '862f54f8-4b7c-35e6-f6ab-34ef09d005d2',
  'listening',
  'undefined',
  3,
  '{"correct":"They are happy.","audio_text":"Ellos están felices."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '2edd73f8-beb6-0efb-d561-2e585d8cb1f4',
  '862f54f8-4b7c-35e6-f6ab-34ef09d005d2',
  'fill_blank',
  'undefined',
  4,
  '{"correct":"triste","text_before":"Él está muy","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '9bdedc4f-6e29-ba44-5881-658029140081',
  '862f54f8-4b7c-35e6-f6ab-34ef09d005d2',
  'fill_blank',
  'undefined',
  5,
  '{"correct":"emocionado","text_before":"¡Estoy","text_after":"!"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '375c208c-1697-fadc-5a18-d0328695801a',
  '862f54f8-4b7c-35e6-f6ab-34ef09d005d2',
  'fill_blank',
  'undefined',
  6,
  '{"correct":"asustado","text_before":"¿Estás","text_after":"de la oscuridad?"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'b1b495a8-e02a-dee7-12e4-abb17acd9785',
  '862f54f8-4b7c-35e6-f6ab-34ef09d005d2',
  'fill_blank',
  'undefined',
  7,
  '{"correct":"sorprendidos","text_before":"Estábamos","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'd88524c1-0187-071d-8614-63cc20d0c3db',
  '862f54f8-4b7c-35e6-f6ab-34ef09d005d2',
  'fill_blank',
  'undefined',
  8,
  '{"correct":"nervioso","text_before":"Me siento","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'db68f003-c2bd-5575-f6ce-1815464221f7',
  '862f54f8-4b7c-35e6-f6ab-34ef09d005d2',
  'fill_blank',
  'undefined',
  9,
  '{"correct":"feliz","text_before":"Ella es","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '56915fc0-ac86-afc6-874a-e40cca75ac6e',
  '862f54f8-4b7c-35e6-f6ab-34ef09d005d2',
  'word_order',
  'undefined',
  10,
  '{"correct":["Ellos","están","muy","cansados","hoy."],"words":["Ellos","están","muy","cansados","hoy.","felices"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '4d5e1634-ce4a-2973-56fe-e4cbe346e51a',
  '862f54f8-4b7c-35e6-f6ab-34ef09d005d2',
  'word_order',
  'undefined',
  11,
  '{"correct":["No","estés","triste."],"words":["No","estés","triste.","feliz"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'f1224fba-e9db-2d37-6005-b4c795cff8d7',
  '862f54f8-4b7c-35e6-f6ab-34ef09d005d2',
  'word_order',
  'undefined',
  12,
  '{"correct":["Estoy","tan","enojado."],"words":["Estoy","tan","enojado.","asustado"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '7b43cc04-ed79-fb1b-f363-a526c7aa989c',
  '862f54f8-4b7c-35e6-f6ab-34ef09d005d2',
  'word_order',
  'undefined',
  13,
  '{"correct":["Estamos","emocionados","por","el","viaje."],"words":["Estamos","emocionados","por","el","viaje.","tristes"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '7b1e0b39-02d5-aa1c-eb82-b4419ef00ed4',
  '862f54f8-4b7c-35e6-f6ab-34ef09d005d2',
  'word_order',
  'undefined',
  14,
  '{"correct":["Se","sorprendió","al","verla."],"words":["Se","sorprendió","al","verla.","nervioso"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '342d2f2c-c369-eb06-74a9-1af7005581e7',
  '862f54f8-4b7c-35e6-f6ab-34ef09d005d2',
  'word_order',
  'undefined',
  15,
  '{"correct":["Ella","está","asustada","de","los","perros."],"words":["Ella","está","asustada","de","los","perros.","gatos"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('0eea0585-0041-eb51-550d-2d830b8e3d65', 'conversation', 'intermediate', 402)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('09b7e969-6075-2f7f-e270-04685182dc34', '0eea0585-0041-eb51-550d-2d830b8e3d65', 'en', 'Conversations', 'Keywords to maintain dialogs.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('d902a99c-cd06-d681-36e9-1ef2596d444a', '0eea0585-0041-eb51-550d-2d830b8e3d65', 'es', 'Conversaciones', 'Palabras clave para mantener diálogos.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (base_key, category, level)
VALUES ('dialog', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'dialog'), 'en', 'dialog', 'dialog')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'dialog'), 'es', 'diálogo', 'diálogo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('ask', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'ask'), 'en', 'ask', 'ask')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'ask'), 'es', 'preguntar', 'preguntar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('help', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'help'), 'en', 'help', 'help')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'help'), 'es', 'ayudar', 'ayudar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('pardon', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'pardon'), 'en', 'pardon', 'pardon')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'pardon'), 'es', 'perdón', 'perdón')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('repeat', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'repeat'), 'en', 'repeat', 'repeat')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'repeat'), 'es', 'repetir', 'repetir')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('slowly', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'slowly'), 'en', 'slowly', 'slowly')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'slowly'), 'es', 'lentamente', 'lentamente')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('understand', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'understand'), 'en', 'understand', 'understand')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'understand'), 'es', 'entender', 'entender')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('mean', 'conversation', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'mean'), 'en', 'mean', 'mean')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'mean'), 'es', 'significar', 'significar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '9cbe56db-b81b-8a0e-8657-6c6d21a3e8dc',
  '0eea0585-0041-eb51-550d-2d830b8e3d65',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"lentamente","options":["lentamente","perdón","ayudar"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'f8ceb848-d72e-009a-9610-4710d1f888af',
  '0eea0585-0041-eb51-550d-2d830b8e3d65',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"entiendo","options":["entiendo","pregunto","repito"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'd4f156fc-b1c7-4fcb-3486-4f36d3c74e68',
  '0eea0585-0041-eb51-550d-2d830b8e3d65',
  'listening',
  'undefined',
  3,
  '{"correct":"Can you help me?","audio_text":"¿Puedes ayudarme?"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '41ab15c6-c55c-14fc-ce51-0e94ba6a6c4b',
  '0eea0585-0041-eb51-550d-2d830b8e3d65',
  'fill_blank',
  'undefined',
  4,
  '{"correct":"repetir","text_before":"¿Podría","text_after":"eso?"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'e4aa155e-c3e9-1c5a-f5fc-f0736d797fb2',
  '0eea0585-0041-eb51-550d-2d830b8e3d65',
  'fill_blank',
  'undefined',
  5,
  '{"correct":"preguntar","text_before":"Quiero","text_after":"una pregunta."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '09eff74d-71bc-3551-90f6-a5abab77d974',
  '0eea0585-0041-eb51-550d-2d830b8e3d65',
  'fill_blank',
  'undefined',
  6,
  '{"correct":"significa","text_before":"¿Qué","text_after":"esto?"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '79805f2c-b559-128f-f58f-dc44b79442e6',
  '0eea0585-0041-eb51-550d-2d830b8e3d65',
  'fill_blank',
  'undefined',
  7,
  '{"correct":"Perdón","text_before":"","text_after":", disculpe."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '4a4eb3e2-54a6-6525-6ac1-2ab8e6b2d54a',
  '0eea0585-0041-eb51-550d-2d830b8e3d65',
  'fill_blank',
  'undefined',
  8,
  '{"correct":"diálogo","text_before":"Tuvieron un largo","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '5a91e1a7-5edb-189f-c943-63977d0eca96',
  '0eea0585-0041-eb51-550d-2d830b8e3d65',
  'fill_blank',
  'undefined',
  9,
  '{"correct":"entiendo","text_before":"Ya","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '46477ae5-3a4d-f4a0-088e-5e0767eacd31',
  '0eea0585-0041-eb51-550d-2d830b8e3d65',
  'word_order',
  'undefined',
  10,
  '{"correct":["¿Puedes","ayudarme","por","favor?"],"words":["¿Puedes","ayudarme","por","favor?","preguntar"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '09d96916-5cec-6901-dbb6-90bdbae7364f',
  '0eea0585-0041-eb51-550d-2d830b8e3d65',
  'word_order',
  'undefined',
  11,
  '{"correct":["Por","favor","habla","más","lentamente."],"words":["Por","favor","habla","más","lentamente.","rápido"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'd4223928-88b2-3f86-30d7-b4b696d756c8',
  '0eea0585-0041-eb51-550d-2d830b8e3d65',
  'word_order',
  'undefined',
  12,
  '{"correct":["¿Qué","significa","esa","palabra?"],"words":["¿Qué","significa","esa","palabra?","diálogo"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '017936c5-d640-4e8e-e01c-0da20d700ec7',
  '0eea0585-0041-eb51-550d-2d830b8e3d65',
  'word_order',
  'undefined',
  13,
  '{"correct":["Necesito","preguntarte","algo."],"words":["Necesito","preguntarte","algo.","entender"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'd85d0b33-4b73-d849-ef91-11fae4b15cbb',
  '0eea0585-0041-eb51-550d-2d830b8e3d65',
  'word_order',
  'undefined',
  14,
  '{"correct":["Perdón,","no","te","escuché."],"words":["Perdón,","no","te","escuché.","repetir"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '66eb6f62-c1f8-e51a-17a5-58a06d9a3a60',
  '0eea0585-0041-eb51-550d-2d830b8e3d65',
  'word_order',
  'undefined',
  15,
  '{"correct":["¿Puedes","repetir","la","pregunta?"],"words":["¿Puedes","repetir","la","pregunta?","lentamente"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('c222a766-f685-0d79-5014-9e04c23d8b57', 'travel', 'intermediate', 403)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('3e9a9649-be04-1ff3-1b25-80fc5f1d5146', 'c222a766-f685-0d79-5014-9e04c23d8b57', 'en', 'Travel Advanced', 'Vocabulary for airport and travel logistics.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('3bc8a411-c4d4-974e-7727-5f3b08c710c2', 'c222a766-f685-0d79-5014-9e04c23d8b57', 'es', 'Viajes Avanzados', 'Vocabulario para aeropuerto y logística de viajes.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (base_key, category, level)
VALUES ('passport', 'travel', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'passport'), 'en', 'passport', 'passport')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'passport'), 'es', 'pasaporte', 'pasaporte')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('luggage', 'travel', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'luggage'), 'en', 'luggage', 'luggage')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'luggage'), 'es', 'equipaje', 'equipaje')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('flight', 'travel', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'flight'), 'en', 'flight', 'flight')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'flight'), 'es', 'vuelo', 'vuelo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('delay', 'travel', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'delay'), 'en', 'delay', 'delay')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'delay'), 'es', 'retraso', 'retraso')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('gate', 'travel', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'gate'), 'en', 'gate', 'gate')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'gate'), 'es', 'puerta', 'puerta')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('customs', 'travel', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'customs'), 'en', 'customs', 'customs')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'customs'), 'es', 'aduana', 'aduana')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('boarding', 'travel', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'boarding'), 'en', 'boarding', 'boarding')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'boarding'), 'es', 'embarque', 'embarque')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('ticket', 'travel', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'ticket'), 'en', 'ticket', 'ticket')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'ticket'), 'es', 'boleto', 'boleto')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '398761d5-3ca5-2acc-58e3-86915986041a',
  'c222a766-f685-0d79-5014-9e04c23d8b57',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"puerta","options":["puerta","aduana","equipaje"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '6fb26f40-1174-f42a-9f8f-b47546a36383',
  'c222a766-f685-0d79-5014-9e04c23d8b57',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"retraso","options":["retraso","pasaporte","boleto"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '9d227588-9490-4226-d0aa-c5fde77b779e',
  'c222a766-f685-0d79-5014-9e04c23d8b57',
  'listening',
  'undefined',
  3,
  '{"correct":"Show your passport at customs.","audio_text":"Muestre su pasaporte en la aduana."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '81db0cd0-b81f-addb-f95b-618a68c3922c',
  'c222a766-f685-0d79-5014-9e04c23d8b57',
  'fill_blank',
  'undefined',
  4,
  '{"correct":"equipaje","text_before":"Perdí mi","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '58b30c6a-9675-a49d-02c7-2ea72a7fddce',
  'c222a766-f685-0d79-5014-9e04c23d8b57',
  'fill_blank',
  'undefined',
  5,
  '{"correct":"embarque","text_before":"El","text_after":"comienza ahora."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'c806fef3-bf4c-38c4-a7d6-701c9e7af877',
  'c222a766-f685-0d79-5014-9e04c23d8b57',
  'fill_blank',
  'undefined',
  6,
  '{"correct":"boleto","text_before":"¿Tienes tu","text_after":"?"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '415324ce-d104-4f73-657a-ca6b9471faf6',
  'c222a766-f685-0d79-5014-9e04c23d8b57',
  'fill_blank',
  'undefined',
  7,
  '{"correct":"vuelo","text_before":"El","text_after":"está cancelado."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '05654f71-474a-05cd-17d0-e8ed6d0e08f6',
  'c222a766-f685-0d79-5014-9e04c23d8b57',
  'fill_blank',
  'undefined',
  8,
  '{"correct":"aduana","text_before":"Pase por la","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '1092d1cf-a46d-eb35-25e1-649a635a580e',
  'c222a766-f685-0d79-5014-9e04c23d8b57',
  'fill_blank',
  'undefined',
  9,
  '{"correct":"pasaporte","text_before":"Necesito un nuevo","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '07a00673-de7c-49e8-9461-0a35da8641b6',
  'c222a766-f685-0d79-5014-9e04c23d8b57',
  'word_order',
  'undefined',
  10,
  '{"correct":["Estamos","esperando","en","la","puerta."],"words":["Estamos","esperando","en","la","puerta.","vuelo"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'c6183e89-91d5-3ef9-e9d9-b48531a3965d',
  'c222a766-f685-0d79-5014-9e04c23d8b57',
  'word_order',
  'undefined',
  11,
  '{"correct":["El","vuelo","tiene","un","largo","retraso."],"words":["El","vuelo","tiene","un","largo","retraso.","equipaje"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '4fb410ed-ba1a-17fd-f09f-07bd74069c12',
  'c222a766-f685-0d79-5014-9e04c23d8b57',
  'word_order',
  'undefined',
  12,
  '{"correct":["Aquí","está","mi","pase","de","embarque."],"words":["Aquí","está","mi","pase","de","embarque.","aduana"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'd3a7d814-2a36-38a1-48e5-ac8eca4f052b',
  'c222a766-f685-0d79-5014-9e04c23d8b57',
  'word_order',
  'undefined',
  13,
  '{"correct":["Muestre","su","pasaporte","y","boleto."],"words":["Muestre","su","pasaporte","y","boleto.","retraso"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'd522ed10-326c-27dd-7d7d-fe59d8c55157',
  'c222a766-f685-0d79-5014-9e04c23d8b57',
  'word_order',
  'undefined',
  14,
  '{"correct":["Revisaron","nuestro","equipaje","en","la","aduana."],"words":["Revisaron","nuestro","equipaje","en","la","aduana.","puerta"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '71b861d4-73c9-6b28-fea0-97ec2dbd906c',
  'c222a766-f685-0d79-5014-9e04c23d8b57',
  'word_order',
  'undefined',
  15,
  '{"correct":["El","vuelo","sale","al","mediodía."],"words":["El","vuelo","sale","al","mediodía.","boleto"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('92581f31-6c8f-e2c0-9436-4aceb36c6f12', 'life', 'intermediate', 404)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('693ed740-1a3e-21b6-963a-618451c95f23', '92581f31-6c8f-e2c0-9436-4aceb36c6f12', 'en', 'Work & School', 'Terms related to professional and academic life.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('53ed39bb-0c85-14e0-87b7-e10d100b2b9d', '92581f31-6c8f-e2c0-9436-4aceb36c6f12', 'es', 'Trabajo y Escuela', 'Términos relacionados con la vida profesional y académica.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (base_key, category, level)
VALUES ('meeting', 'life', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'meeting'), 'en', 'meeting', 'meeting')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'meeting'), 'es', 'reunión', 'reunión')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('boss', 'life', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'boss'), 'en', 'boss', 'boss')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'boss'), 'es', 'jefe', 'jefe')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('teacher', 'life', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'teacher'), 'en', 'teacher', 'teacher')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'teacher'), 'es', 'profesor', 'profesor')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('exam', 'life', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'exam'), 'en', 'exam', 'exam')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'exam'), 'es', 'examen', 'examen')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('project', 'life', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'project'), 'en', 'project', 'project')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'project'), 'es', 'proyecto', 'proyecto')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('deadline', 'life', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'deadline'), 'en', 'deadline', 'deadline')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'deadline'), 'es', 'fecha límite', 'fecha límite')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('desk', 'life', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'desk'), 'en', 'desk', 'desk')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'desk'), 'es', 'escritorio', 'escritorio')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('office', 'life', 'intermediate')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'office'), 'en', 'office', 'office')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'office'), 'es', 'oficina', 'oficina')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'ed7441a9-1ad8-6892-3c1a-f9507bbebfd7',
  '92581f31-6c8f-e2c0-9436-4aceb36c6f12',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"reunión","options":["reunión","examen","proyecto"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '096d9240-e85a-2e64-1a52-1b85c67e6b6d',
  '92581f31-6c8f-e2c0-9436-4aceb36c6f12',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"jefe","options":["jefe","profesor","escritorio"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '95c1e9db-5d14-7784-a10f-93e91a0d67bd',
  '92581f31-6c8f-e2c0-9436-4aceb36c6f12',
  'listening',
  'undefined',
  3,
  '{"correct":"The deadline is tomorrow.","audio_text":"La fecha límite es mañana."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '015c82f7-21fe-6abd-08c2-89824b0ca424',
  '92581f31-6c8f-e2c0-9436-4aceb36c6f12',
  'fill_blank',
  'undefined',
  4,
  '{"correct":"profesor","text_before":"Mi","text_after":"es muy inteligente."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'd9ac9635-0cca-a9e9-f63d-7a3e67e1161b',
  '92581f31-6c8f-e2c0-9436-4aceb36c6f12',
  'fill_blank',
  'undefined',
  5,
  '{"correct":"examen","text_before":"Reprobé el","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '3b15467e-ed7d-5c7e-ac40-2903fe161e33',
  '92581f31-6c8f-e2c0-9436-4aceb36c6f12',
  'fill_blank',
  'undefined',
  6,
  '{"correct":"proyecto","text_before":"El","text_after":"está completo."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'b8e1ed0b-fc4f-b4ee-2197-ce9dcf47345b',
  '92581f31-6c8f-e2c0-9436-4aceb36c6f12',
  'fill_blank',
  'undefined',
  7,
  '{"correct":"escritorio","text_before":"Déjalo en mi","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '1c9ea7c8-bc41-ec85-c746-dcc550d3cc8b',
  '92581f31-6c8f-e2c0-9436-4aceb36c6f12',
  'fill_blank',
  'undefined',
  8,
  '{"correct":"oficina","text_before":"Trabajamos en la misma","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '9f2b9bc4-6adf-270c-cc10-ce19dc70f97c',
  '92581f31-6c8f-e2c0-9436-4aceb36c6f12',
  'fill_blank',
  'undefined',
  9,
  '{"correct":"reunión","text_before":"La","text_after":"es larga."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'ff9dbbc8-dc02-765b-9bb0-56c8eca19f80',
  '92581f31-6c8f-e2c0-9436-4aceb36c6f12',
  'word_order',
  'undefined',
  10,
  '{"correct":["Necesito","hablar","con","mi","jefe."],"words":["Necesito","hablar","con","mi","jefe.","profesor"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '36320130-26be-73b7-a1b3-d13d05ce21da',
  '92581f31-6c8f-e2c0-9436-4aceb36c6f12',
  'word_order',
  'undefined',
  11,
  '{"correct":["El","nuevo","proyecto","empieza","hoy."],"words":["El","nuevo","proyecto","empieza","hoy.","examen"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '4f508afd-072f-ef1c-9740-f7188d0e401b',
  '92581f31-6c8f-e2c0-9436-4aceb36c6f12',
  'word_order',
  'undefined',
  12,
  '{"correct":["Perdimos","la","fecha","límite","del","proyecto."],"words":["Perdimos","la","fecha","límite","del","proyecto.","reunión"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'be5b310d-a645-308e-5657-d07825aa706d',
  '92581f31-6c8f-e2c0-9436-4aceb36c6f12',
  'word_order',
  'undefined',
  13,
  '{"correct":["Tus","papeles","están","en","el","escritorio."],"words":["Tus","papeles","están","en","el","escritorio.","oficina"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '3785521e-9c48-5246-a6ea-4e4464b97552',
  '92581f31-6c8f-e2c0-9436-4aceb36c6f12',
  'word_order',
  'undefined',
  14,
  '{"correct":["El","profesor","calificó","nuestros","exámenes."],"words":["El","profesor","calificó","nuestros","exámenes.","proyectos"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '03e8994f-e18e-2f77-b716-ac559b5d8719',
  '92581f31-6c8f-e2c0-9436-4aceb36c6f12',
  'word_order',
  'undefined',
  15,
  '{"correct":["Ella","trabaja","en","una","oficina","grande."],"words":["Ella","trabaja","en","una","oficina","grande.","jefe"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

