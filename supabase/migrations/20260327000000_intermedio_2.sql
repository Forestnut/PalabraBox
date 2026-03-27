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

INSERT INTO public.words (id, base_key, category, level)
VALUES ('8ae63794-446d-c3e4-02b9-fa177452ef13', 'favorite', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('3ea0bde2-f24d-11a7-e5e1-aa659105f246', '8ae63794-446d-c3e4-02b9-fa177452ef13', 'en', 'favorite', 'favorite')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('6547292f-c6a3-4ef3-0eec-ec7d5a65ee09', '8ae63794-446d-c3e4-02b9-fa177452ef13', 'es', 'favorito', 'favorito')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('497bea6a-a87c-3ff4-bd90-dc12f4217249', 'prefer', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('ab210c87-dde4-2c53-88b3-5148ef4730dd', '497bea6a-a87c-3ff4-bd90-dc12f4217249', 'en', 'prefer', 'prefer')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('254ca88a-0c3c-905d-cbe4-26236095b93f', '497bea6a-a87c-3ff4-bd90-dc12f4217249', 'es', 'preferir', 'preferir')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('499e1eeb-1bd1-e9e8-41e1-32bb4b0f4390', 'best', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('5bafbe93-2816-4861-ec1c-4b84d9944001', '499e1eeb-1bd1-e9e8-41e1-32bb4b0f4390', 'en', 'best', 'best')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('bac4f383-d632-82fc-d8bc-4661417f5ff8', '499e1eeb-1bd1-e9e8-41e1-32bb4b0f4390', 'es', 'mejor', 'mejor')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('8e7e79e7-54af-6f3a-97a1-eb748d3acc63', 'worst', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('5ede3f0f-096d-3214-6da7-4b4c85971669', '8e7e79e7-54af-6f3a-97a1-eb748d3acc63', 'en', 'worst', 'worst')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('606f7111-0014-f947-2050-699ed5b1b8f2', '8e7e79e7-54af-6f3a-97a1-eb748d3acc63', 'es', 'peor', 'peor')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('63d245e9-4699-fa67-82f1-df7788689bbb', 'rather', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('62f6f341-e752-4e28-fce3-88eb64b426e3', '63d245e9-4699-fa67-82f1-df7788689bbb', 'en', 'rather', 'rather')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('8ebd50a0-600d-181c-f456-cf34c2c2e69a', '63d245e9-4699-fa67-82f1-df7788689bbb', 'es', 'preferiría', 'preferiría')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('9bf05bbc-00c3-4254-1cf8-dd124b4276c7', 'like', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('3c108d7c-4814-6d16-abe7-6a49c73eb235', '9bf05bbc-00c3-4254-1cf8-dd124b4276c7', 'en', 'like', 'like')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('b58a06f9-37ac-f4a0-8406-93d5620f8171', '9bf05bbc-00c3-4254-1cf8-dd124b4276c7', 'es', 'gustar', 'gustar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('2539c13c-2970-e039-bea1-61ac8dcaaa39', 'hate', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('af21e50f-3b4b-8aba-8e89-5ee7614a969d', '2539c13c-2970-e039-bea1-61ac8dcaaa39', 'en', 'hate', 'hate')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('cd69e025-0564-e1d3-071a-79731942f532', '2539c13c-2970-e039-bea1-61ac8dcaaa39', 'es', 'odiar', 'odiar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('d94ee5c0-e093-e62b-15f4-67bbdc9f9e31', 'enjoy', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('fb74fdba-df02-ebe3-d746-d3951200e97d', 'd94ee5c0-e093-e62b-15f4-67bbdc9f9e31', 'en', 'enjoy', 'enjoy')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('8552ef0a-97b4-5f9b-4e22-2e4f846833b9', 'd94ee5c0-e093-e62b-15f4-67bbdc9f9e31', 'es', 'disfrutar', 'disfrutar')
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

INSERT INTO public.words (id, base_key, category, level)
VALUES ('318b8a53-e0ce-ebb8-92ef-3a3ac4356eeb', 'happy', 'life', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('0dce96d7-5613-2670-9adb-88757f797389', '318b8a53-e0ce-ebb8-92ef-3a3ac4356eeb', 'en', 'happy', 'happy')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('93d25855-8472-45e0-7735-f5956d7a6630', '318b8a53-e0ce-ebb8-92ef-3a3ac4356eeb', 'es', 'feliz', 'feliz')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('89cc9de2-804f-8279-d98c-2454af2c32a4', 'sad', 'life', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('09cc9aab-30a3-fc56-5a18-1684bd98af9e', '89cc9de2-804f-8279-d98c-2454af2c32a4', 'en', 'sad', 'sad')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('66a4a479-b180-318d-516b-438a6be33a47', '89cc9de2-804f-8279-d98c-2454af2c32a4', 'es', 'triste', 'triste')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('73d1c74e-c352-c05c-6ef2-ce99728f94e5', 'tired', 'life', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('7e70e4a8-6829-dcdd-5b5b-e6802720e5d1', '73d1c74e-c352-c05c-6ef2-ce99728f94e5', 'en', 'tired', 'tired')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('82fbbdc6-4685-3de0-458e-148b1a31a211', '73d1c74e-c352-c05c-6ef2-ce99728f94e5', 'es', 'cansado', 'cansado')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('e5197741-664d-c280-19a2-d5b66d403226', 'angry', 'life', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('56a9d997-5627-83cd-6ae8-936f9475d86e', 'e5197741-664d-c280-19a2-d5b66d403226', 'en', 'angry', 'angry')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('a0173cd8-3a4d-7d8a-74d0-c6c25f5a6568', 'e5197741-664d-c280-19a2-d5b66d403226', 'es', 'enojado', 'enojado')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('3e991788-37cb-8f8f-a6d1-2225d5d224a7', 'excited', 'life', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('2b69a8be-96aa-750b-ae98-47f2cbbafcf0', '3e991788-37cb-8f8f-a6d1-2225d5d224a7', 'en', 'excited', 'excited')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('4a413cc5-d6d8-3368-7069-7a1df8d0d772', '3e991788-37cb-8f8f-a6d1-2225d5d224a7', 'es', 'emocionado', 'emocionado')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('b0b32346-d2c7-dcc4-328f-4cb3001408d1', 'afraid', 'life', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('c9e91b65-81cc-9892-15b7-b3f0d498f8b8', 'b0b32346-d2c7-dcc4-328f-4cb3001408d1', 'en', 'afraid', 'afraid')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('2196dfb0-29a0-5554-2914-1bc7eff1d141', 'b0b32346-d2c7-dcc4-328f-4cb3001408d1', 'es', 'asustado', 'asustado')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('56e974a1-2f7e-9032-ce6d-fd29a7f5c255', 'surprised', 'life', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('75f5c0b9-5af5-17a5-1682-04f6461ca32b', '56e974a1-2f7e-9032-ce6d-fd29a7f5c255', 'en', 'surprised', 'surprised')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('abf7c1ca-cb2d-a67e-c864-043013317e52', '56e974a1-2f7e-9032-ce6d-fd29a7f5c255', 'es', 'sorprendido', 'sorprendido')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('c288fa35-38e5-4ab3-851c-b9860c4755c4', 'nervous', 'life', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('70445213-8ff6-ba79-2158-6c60fa15d130', 'c288fa35-38e5-4ab3-851c-b9860c4755c4', 'en', 'nervous', 'nervous')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('db7e4322-362d-497c-14dd-5f740a2012fd', 'c288fa35-38e5-4ab3-851c-b9860c4755c4', 'es', 'nervioso', 'nervioso')
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

INSERT INTO public.words (id, base_key, category, level)
VALUES ('dd8e32d0-e29c-8c1c-5a67-95d8e94db12a', 'dialog', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('29f1f334-ed8f-cfc1-6386-544e61711cfe', 'dd8e32d0-e29c-8c1c-5a67-95d8e94db12a', 'en', 'dialog', 'dialog')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('5d5aca7c-5ec0-30ce-4242-3207fe207cbf', 'dd8e32d0-e29c-8c1c-5a67-95d8e94db12a', 'es', 'diálogo', 'diálogo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('8f2703ac-c31f-088b-3f5c-47c41c4bc180', 'ask', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('8c4d0012-2e18-608e-a114-f49f666e6b4c', '8f2703ac-c31f-088b-3f5c-47c41c4bc180', 'en', 'ask', 'ask')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('013fb9b9-e335-029b-ba72-99f8167d422d', '8f2703ac-c31f-088b-3f5c-47c41c4bc180', 'es', 'preguntar', 'preguntar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('6366f988-d440-50a9-bc30-679f19d1ae70', 'help', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('d7bee670-555a-87de-9b7b-927210786d90', '6366f988-d440-50a9-bc30-679f19d1ae70', 'en', 'help', 'help')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('200684da-5843-3ca3-5e64-8c9ec7cf9731', '6366f988-d440-50a9-bc30-679f19d1ae70', 'es', 'ayudar', 'ayudar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('22618afe-1344-09c9-a02e-bcba45bd2842', 'pardon', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('589bfc17-2620-52bc-a8d5-9c0ad040071a', '22618afe-1344-09c9-a02e-bcba45bd2842', 'en', 'pardon', 'pardon')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('ca0dd447-6162-6e7b-36a0-681bf703e5cf', '22618afe-1344-09c9-a02e-bcba45bd2842', 'es', 'perdón', 'perdón')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('ed65f345-70f5-ae2c-983f-075b27a6e61d', 'repeat', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('e4a23df4-fb47-c02d-94a3-2b47122b2f1e', 'ed65f345-70f5-ae2c-983f-075b27a6e61d', 'en', 'repeat', 'repeat')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('cb6ca25d-2b78-6e95-1862-ed1e10c2fafe', 'ed65f345-70f5-ae2c-983f-075b27a6e61d', 'es', 'repetir', 'repetir')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('fc29d17f-b38c-b238-a243-714de04dd04b', 'slowly', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('0739f268-8289-47be-d261-293186fbd547', 'fc29d17f-b38c-b238-a243-714de04dd04b', 'en', 'slowly', 'slowly')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('af6d3ac8-1aaa-d9b3-f777-169bc7af87f8', 'fc29d17f-b38c-b238-a243-714de04dd04b', 'es', 'lentamente', 'lentamente')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('c75012fc-0ca6-6f43-eb2e-4be4a8a6319a', 'understand', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('b0ec2b3b-44a1-79a1-9c24-c2191dd9b4be', 'c75012fc-0ca6-6f43-eb2e-4be4a8a6319a', 'en', 'understand', 'understand')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('bbe91bba-2d1b-9004-b997-16852b69e114', 'c75012fc-0ca6-6f43-eb2e-4be4a8a6319a', 'es', 'entender', 'entender')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('822bbc8d-414a-e2cc-b981-7fee0b0485d9', 'mean', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('cd70b380-5c22-4ece-0730-d66036e44888', '822bbc8d-414a-e2cc-b981-7fee0b0485d9', 'en', 'mean', 'mean')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('6fd0a625-48d0-13ea-6389-fe5b00cf2682', '822bbc8d-414a-e2cc-b981-7fee0b0485d9', 'es', 'significar', 'significar')
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

INSERT INTO public.words (id, base_key, category, level)
VALUES ('e2c4fb94-dbb4-d55a-2342-297e1eb2949c', 'passport', 'travel', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('c484875e-7e99-94f6-3786-a15ff3455a95', 'e2c4fb94-dbb4-d55a-2342-297e1eb2949c', 'en', 'passport', 'passport')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('4422b6b5-f6cb-456d-742d-f293ee6c775a', 'e2c4fb94-dbb4-d55a-2342-297e1eb2949c', 'es', 'pasaporte', 'pasaporte')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('9b2a0bcd-bbda-63fd-01d2-713ca7d85449', 'luggage', 'travel', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('b62f3b95-d4f3-d91e-0b2e-890e4952c512', '9b2a0bcd-bbda-63fd-01d2-713ca7d85449', 'en', 'luggage', 'luggage')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('ca8b34bf-3da4-938e-fb47-9e64fecda991', '9b2a0bcd-bbda-63fd-01d2-713ca7d85449', 'es', 'equipaje', 'equipaje')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('b4b9b06d-31f5-e400-591e-1f6a157af4ed', 'flight', 'travel', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('c1080a88-e617-00a8-522d-587ae904a8a5', 'b4b9b06d-31f5-e400-591e-1f6a157af4ed', 'en', 'flight', 'flight')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('b7055d54-d962-db11-2d90-41175704f0a1', 'b4b9b06d-31f5-e400-591e-1f6a157af4ed', 'es', 'vuelo', 'vuelo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('e32eefba-2377-068a-7802-7ebef23f080e', 'delay', 'travel', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('d8a849fa-fe12-4bfc-85cd-df655fb9c1c1', 'e32eefba-2377-068a-7802-7ebef23f080e', 'en', 'delay', 'delay')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('2c46b44b-a8bc-8589-bfb9-3cebdd2014c0', 'e32eefba-2377-068a-7802-7ebef23f080e', 'es', 'retraso', 'retraso')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('7b4303cb-84b7-c26c-4b65-b518dbce73a7', 'gate', 'travel', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('5767616b-3b00-3f49-d7c1-2050b8b9b7ea', '7b4303cb-84b7-c26c-4b65-b518dbce73a7', 'en', 'gate', 'gate')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('392e6cfa-dc6b-8263-4d26-df18c796a420', '7b4303cb-84b7-c26c-4b65-b518dbce73a7', 'es', 'puerta', 'puerta')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('6bcecaa3-e9b0-be41-5aa9-9f4022174049', 'customs', 'travel', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('7949e5db-6955-aab2-75be-5a4dcf4e97de', '6bcecaa3-e9b0-be41-5aa9-9f4022174049', 'en', 'customs', 'customs')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('4690e9d1-7646-3e79-c32f-76db5dd10ce8', '6bcecaa3-e9b0-be41-5aa9-9f4022174049', 'es', 'aduana', 'aduana')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('b769ae24-07c4-4e05-0d2b-27b2c1662016', 'boarding', 'travel', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('30c08a7d-e982-cf98-2326-4d653d8cdd36', 'b769ae24-07c4-4e05-0d2b-27b2c1662016', 'en', 'boarding', 'boarding')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('b57321f1-a0a8-b43b-7b88-c5bbcf42a02b', 'b769ae24-07c4-4e05-0d2b-27b2c1662016', 'es', 'embarque', 'embarque')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('15ab22fc-b198-ee23-c5c7-10a8b9b27b91', 'ticket', 'travel', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('f10e1830-b02b-30d7-ac5b-6a3419c30a60', '15ab22fc-b198-ee23-c5c7-10a8b9b27b91', 'en', 'ticket', 'ticket')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('daa1100e-ed76-513a-5672-0bfb0f89d2cd', '15ab22fc-b198-ee23-c5c7-10a8b9b27b91', 'es', 'boleto', 'boleto')
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

INSERT INTO public.words (id, base_key, category, level)
VALUES ('6893325a-dc38-07c3-995e-045c9ef10c39', 'meeting', 'life', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('fd86851c-c3f4-3ae1-eab3-4299f25a4b97', '6893325a-dc38-07c3-995e-045c9ef10c39', 'en', 'meeting', 'meeting')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('0fc4210b-f5ce-5bad-9507-edc5956af2e9', '6893325a-dc38-07c3-995e-045c9ef10c39', 'es', 'reunión', 'reunión')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('a74b2cee-a153-62fc-146f-e11c6507ef0f', 'boss', 'life', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('4e07f958-ebdc-67cd-4ae4-c51c4dd2f625', 'a74b2cee-a153-62fc-146f-e11c6507ef0f', 'en', 'boss', 'boss')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('bb791897-b907-a629-3a7f-6c844a48c7e3', 'a74b2cee-a153-62fc-146f-e11c6507ef0f', 'es', 'jefe', 'jefe')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('12a91708-ae94-87f0-d66b-b8de96dcd34f', 'teacher', 'life', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('de15b479-49c8-5e9f-8793-a036af34b6a6', '12a91708-ae94-87f0-d66b-b8de96dcd34f', 'en', 'teacher', 'teacher')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('6053532c-ec8b-ea0d-b21b-ac41e50bad95', '12a91708-ae94-87f0-d66b-b8de96dcd34f', 'es', 'profesor', 'profesor')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('e70da3bd-3165-77c1-3f24-9a918af3d009', 'exam', 'life', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('1b552bec-e6f6-73e4-e436-2543ebc40fb2', 'e70da3bd-3165-77c1-3f24-9a918af3d009', 'en', 'exam', 'exam')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('487bdbae-da6a-2e4a-465c-ba619c79e7c1', 'e70da3bd-3165-77c1-3f24-9a918af3d009', 'es', 'examen', 'examen')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('0d80bea3-c72e-6d12-f71e-43b96133bca4', 'project', 'life', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('53710043-a883-9e64-9568-7265e64f6cf5', '0d80bea3-c72e-6d12-f71e-43b96133bca4', 'en', 'project', 'project')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('2a8b5049-e2e8-6bc0-ff04-1e20ff05d16c', '0d80bea3-c72e-6d12-f71e-43b96133bca4', 'es', 'proyecto', 'proyecto')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('d3af978f-384c-20c3-6bf2-9a3936ea8353', 'deadline', 'life', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('b8b71c16-bec8-0e26-0046-8fcf496b07c0', 'd3af978f-384c-20c3-6bf2-9a3936ea8353', 'en', 'deadline', 'deadline')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('53c7052f-0ca1-2935-f09e-d324c19f18d8', 'd3af978f-384c-20c3-6bf2-9a3936ea8353', 'es', 'fecha límite', 'fecha límite')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('daa71302-270c-2bb2-246a-c25bc1d87615', 'desk', 'life', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('29308341-721c-919c-9271-d80cbfa12b56', 'daa71302-270c-2bb2-246a-c25bc1d87615', 'en', 'desk', 'desk')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('feeea487-790d-27ca-1ff3-f2072d7f5ab2', 'daa71302-270c-2bb2-246a-c25bc1d87615', 'es', 'escritorio', 'escritorio')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('a6427c8f-dcc1-f438-eb89-2507e067222a', 'office', 'life', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('4c36edf9-3a7b-e645-a57a-047e0d2117e9', 'a6427c8f-dcc1-f438-eb89-2507e067222a', 'en', 'office', 'office')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('a9dd68f5-dc6f-b74b-9af1-cb72474434e7', 'a6427c8f-dcc1-f438-eb89-2507e067222a', 'es', 'oficina', 'oficina')
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

