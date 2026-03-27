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

INSERT INTO public.words (id, base_key, category, level)
VALUES ('5302f249-1625-fc2a-3020-3a8e5780772f', 'went', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('860516c2-936b-91b5-181e-7eb6f3163547', '5302f249-1625-fc2a-3020-3a8e5780772f', 'en', 'went', 'went')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('ef527ffe-9454-5fa2-b067-db5b0660fb73', '5302f249-1625-fc2a-3020-3a8e5780772f', 'es', 'fui', 'fui')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('e316bbe9-6787-08b6-a3b0-04abf7183e86', 'ate', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('6043ba88-24d3-c075-99cf-3738410bb64d', 'e316bbe9-6787-08b6-a3b0-04abf7183e86', 'en', 'ate', 'ate')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('3853c0d6-4475-093a-fe71-05223f99a602', 'e316bbe9-6787-08b6-a3b0-04abf7183e86', 'es', 'comí', 'comí')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('4a865774-4155-6ab3-142b-9fcea14e95c1', 'saw', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('7c11e121-6df3-dc19-a4b9-83c8bd6d1177', '4a865774-4155-6ab3-142b-9fcea14e95c1', 'en', 'saw', 'saw')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('c525634f-9980-3443-a7ce-66f443587166', '4a865774-4155-6ab3-142b-9fcea14e95c1', 'es', 'vi', 'vi')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('3a7ee2ba-b532-4c36-2dec-60df8058f47d', 'played', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('15296004-4b35-2cc3-844a-0ce3e9fece37', '3a7ee2ba-b532-4c36-2dec-60df8058f47d', 'en', 'played', 'played')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('fac07d74-e68a-4cc1-89bb-a64181f8d343', '3a7ee2ba-b532-4c36-2dec-60df8058f47d', 'es', 'jugué', 'jugué')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('e52dbacb-fdf1-9b40-e181-bd9655348e75', 'worked', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('4c94069a-2385-a271-edbc-494921c15e89', 'e52dbacb-fdf1-9b40-e181-bd9655348e75', 'en', 'worked', 'worked')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('aaf5de4b-01b6-7dde-0ca8-44c36ccfa671', 'e52dbacb-fdf1-9b40-e181-bd9655348e75', 'es', 'trabajé', 'trabajé')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('7e4b3c4c-f523-b73d-c720-389aab3ebaa7', 'bought', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('5e12a4e9-ffc8-4990-89a2-fdb001aff662', '7e4b3c4c-f523-b73d-c720-389aab3ebaa7', 'en', 'bought', 'bought')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('22a6d906-3aae-217a-327b-a2ce75f2499b', '7e4b3c4c-f523-b73d-c720-389aab3ebaa7', 'es', 'compré', 'compré')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('34c38c2b-9407-7b1b-72da-5b0a0e76b898', 'yesterday', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('64f7875b-f72e-392f-091d-55378d2d9098', '34c38c2b-9407-7b1b-72da-5b0a0e76b898', 'en', 'yesterday', 'yesterday')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('ee7a9476-b511-3742-f52d-f1dde0f8ddd9', '34c38c2b-9407-7b1b-72da-5b0a0e76b898', 'es', 'ayer', 'ayer')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('a36237cd-afb3-7a6c-7f09-775bdb17471a', 'last week', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('8bab52ac-34ab-f79a-9477-ed5789b31857', 'a36237cd-afb3-7a6c-7f09-775bdb17471a', 'en', 'last week', 'last week')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('16dc47a8-6efb-8bef-308a-509ec2e2cbca', 'a36237cd-afb3-7a6c-7f09-775bdb17471a', 'es', 'la semana pasada', 'la semana pasada')
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

INSERT INTO public.words (id, base_key, category, level)
VALUES ('953192b7-fcf3-fe49-f2eb-1a52195ddff0', 'will', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('26f52f88-5b96-1602-2da2-94e7dbc18fae', '953192b7-fcf3-fe49-f2eb-1a52195ddff0', 'en', 'will (voy a)', 'will (voy a)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('6a01911b-f584-23c5-b2d5-54ad9518d5e2', '953192b7-fcf3-fe49-f2eb-1a52195ddff0', 'es', 'voy a', 'voy a')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('93605170-07f5-1a06-7b4d-cf84b753e205', 'going to', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('8b4b3703-f8f6-8d17-709d-7c2b55e5f9e6', '93605170-07f5-1a06-7b4d-cf84b753e205', 'en', 'going to', 'going to')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('bd71bc0c-19d6-c38a-c03c-fcdf0148836d', '93605170-07f5-1a06-7b4d-cf84b753e205', 'es', 'iré a', 'iré a')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('21c4f300-8403-839e-6df4-2972ac1a4618', 'tomorrow', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('bc9c79c8-6fa8-333c-ae4b-685e1165da49', '21c4f300-8403-839e-6df4-2972ac1a4618', 'en', 'tomorrow', 'tomorrow')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('5b48becd-fa27-19aa-9367-f0af399fc1b1', '21c4f300-8403-839e-6df4-2972ac1a4618', 'es', 'mañana', 'mañana')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('166c6790-b6a6-2ea7-8638-b69fb548f42f', 'next week', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('6b8fee2c-537e-4b8d-146f-c0febd2fa038', '166c6790-b6a6-2ea7-8638-b69fb548f42f', 'en', 'next week', 'next week')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('02031911-4273-307a-29ce-ef0889303798', '166c6790-b6a6-2ea7-8638-b69fb548f42f', 'es', 'la próxima semana', 'la próxima semana')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('ce3d79cd-2031-9614-3ebf-a8a6071b2750', 'soon', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('c198cfa9-a49e-4073-d8aa-239eea8b02bd', 'ce3d79cd-2031-9614-3ebf-a8a6071b2750', 'en', 'soon', 'soon')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('bdee7222-ddc5-5e58-0745-7a14e4aafc65', 'ce3d79cd-2031-9614-3ebf-a8a6071b2750', 'es', 'pronto', 'pronto')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('03a85ae0-bbd5-63e9-bd6a-e1e4e5a598cc', 'travel', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('b0154df6-2ef4-0482-948b-967992c18cdb', '03a85ae0-bbd5-63e9-bd6a-e1e4e5a598cc', 'en', 'travel', 'travel')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('25458db9-d3dd-5a2b-998c-44aa4cdef6d3', '03a85ae0-bbd5-63e9-bd6a-e1e4e5a598cc', 'es', 'viajar', 'viajar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('0b071f45-0d52-9051-33a1-de3139d0f71a', 'visit', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('ff014234-ca3e-802a-818e-ee72d10a1470', '0b071f45-0d52-9051-33a1-de3139d0f71a', 'en', 'visit', 'visit')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('3f126556-eb5e-6207-c39e-d4b1db8311b4', '0b071f45-0d52-9051-33a1-de3139d0f71a', 'es', 'visitar', 'visitar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('3bdfdd9f-0a4c-36ee-69e1-4c102d188fce', 'eat', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('1728a55d-f5b5-5ec4-ae7a-909b15d6ab98', '3bdfdd9f-0a4c-36ee-69e1-4c102d188fce', 'en', 'eat (future)', 'eat (future)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('13a5ce44-2ad8-6e45-d3ab-a74a584c35a7', '3bdfdd9f-0a4c-36ee-69e1-4c102d188fce', 'es', 'comeré', 'comeré')
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

INSERT INTO public.words (id, base_key, category, level)
VALUES ('fc92138b-fbbb-cc45-96a2-df1a87fa9908', 'can', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('d68018dd-e9c3-4a66-7e46-2c646d8fc786', 'fc92138b-fbbb-cc45-96a2-df1a87fa9908', 'en', 'can', 'can')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('51655424-84fe-24bc-73ef-3c09b3e79b4a', 'fc92138b-fbbb-cc45-96a2-df1a87fa9908', 'es', 'puedo', 'puedo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('ad6c3e8d-2ce1-7125-c953-fdfb935584a0', 'must', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('f78c479c-61fa-3627-d5c9-6f51fee18e0b', 'ad6c3e8d-2ce1-7125-c953-fdfb935584a0', 'en', 'must', 'must')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('a5abf2f5-edd5-94e0-9acd-aea836a2b94b', 'ad6c3e8d-2ce1-7125-c953-fdfb935584a0', 'es', 'debo', 'debo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('8eb7179f-f4cb-ffe7-cb7a-3c6fbf7cdb84', 'should', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('9cfa6209-7821-23fe-1fe4-578f94e0c44e', '8eb7179f-f4cb-ffe7-cb7a-3c6fbf7cdb84', 'en', 'should', 'should')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('d0c11067-3e1e-58d0-291f-5f35b6227060', '8eb7179f-f4cb-ffe7-cb7a-3c6fbf7cdb84', 'es', 'debería', 'debería')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('8e278d44-4a79-40be-30b7-dd6ffdc96fd6', 'could', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('ca6c6131-4c31-0811-8222-4dbc6bd6aaca', '8e278d44-4a79-40be-30b7-dd6ffdc96fd6', 'en', 'could', 'could')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('8ba431bd-2277-2341-39b2-cc4c6289179b', '8e278d44-4a79-40be-30b7-dd6ffdc96fd6', 'es', 'podría', 'podría')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('f533da0b-3358-854d-7bcc-3b044427dd89', 'would', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('382fd32a-f0e0-361e-8731-45997180413a', 'f533da0b-3358-854d-7bcc-3b044427dd89', 'en', 'would', 'would')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('8a14d0f7-0bce-fecf-ff2d-3d3a1e60e12c', 'f533da0b-3358-854d-7bcc-3b044427dd89', 'es', 'haría', 'haría')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('6366f988-d440-50a9-bc30-679f19d1ae70', 'help', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('d7bee670-555a-87de-9b7b-927210786d90', '6366f988-d440-50a9-bc30-679f19d1ae70', 'en', 'help', 'help')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('200684da-5843-3ca3-5e64-8c9ec7cf9731', '6366f988-d440-50a9-bc30-679f19d1ae70', 'es', 'ayudar', 'ayudar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('e511d93f-79c8-3213-f36b-72b27cc3417c', 'learn', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('a5663da6-8a73-6412-3c9f-26d5f00b944c', 'e511d93f-79c8-3213-f36b-72b27cc3417c', 'en', 'learn', 'learn')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('9f7cc9dd-29a5-03f9-32f9-4a0cd3959faf', 'e511d93f-79c8-3213-f36b-72b27cc3417c', 'es', 'aprender', 'aprender')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('8e60b28c-e566-4f3f-96ac-f1ab8aae4af6', 'want', 'grammar', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('17e21bf2-554b-74ef-cf95-b05fb0a1254c', '8e60b28c-e566-4f3f-96ac-f1ab8aae4af6', 'en', 'want', 'want')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('c513e60d-246a-918e-8d91-5ffe1e168129', '8e60b28c-e566-4f3f-96ac-f1ab8aae4af6', 'es', 'quiero', 'quiero')
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

INSERT INTO public.words (id, base_key, category, level)
VALUES ('b6a37030-ef90-b422-dc5e-3c12ac6a4f58', 'think', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('669462ab-16e0-2e1c-9b53-56fd59b5a67b', 'b6a37030-ef90-b422-dc5e-3c12ac6a4f58', 'en', 'think', 'think')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('5f053718-ab4a-b090-ad3c-45d0f75c4493', 'b6a37030-ef90-b422-dc5e-3c12ac6a4f58', 'es', 'pienso que', 'pienso que')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('42746be3-8232-f7ba-86ba-d13953dfe563', 'believe', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('311a11fa-9407-5a22-9b1d-e3ff9c487710', '42746be3-8232-f7ba-86ba-d13953dfe563', 'en', 'believe', 'believe')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('a891cc45-779f-7647-2c95-5f28ef76dc83', '42746be3-8232-f7ba-86ba-d13953dfe563', 'es', 'creo que', 'creo que')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('796f48c5-1fef-4875-35bb-eb8d1164b6e2', 'guess', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('ba543b71-a09a-a0a0-854c-7585a31ca2e4', '796f48c5-1fef-4875-35bb-eb8d1164b6e2', 'en', 'guess', 'guess')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('7d2a1a64-3581-ed07-fae7-1b728ec1d7b3', '796f48c5-1fef-4875-35bb-eb8d1164b6e2', 'es', 'supongo', 'supongo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('9f4b94a0-2dfe-400b-7872-269935cbfa30', 'agree', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('5ebd4eb3-06cf-e3eb-d4e3-ecfee11cd96c', '9f4b94a0-2dfe-400b-7872-269935cbfa30', 'en', 'agree', 'agree')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('d131248b-08b6-71a9-88c3-84634aab1040', '9f4b94a0-2dfe-400b-7872-269935cbfa30', 'es', 'de acuerdo', 'de acuerdo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('a0b3c0e6-d71a-6948-b193-42aa42c4de8a', 'disagree', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('da29fe8c-0cdf-57ab-67dc-2b093022e584', 'a0b3c0e6-d71a-6948-b193-42aa42c4de8a', 'en', 'disagree', 'disagree')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('76a29486-13e2-5ba4-ea33-732f2323f9ee', 'a0b3c0e6-d71a-6948-b193-42aa42c4de8a', 'es', 'en desacuerdo', 'en desacuerdo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('a27f3bb9-064a-3c40-c4f4-da1ea26b8997', 'idea', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('5289c1c5-0805-1440-ae7c-7970db1d936e', 'a27f3bb9-064a-3c40-c4f4-da1ea26b8997', 'en', 'idea', 'idea')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('379b4759-84b0-e952-c67d-64317f0f3c39', 'a27f3bb9-064a-3c40-c4f4-da1ea26b8997', 'es', 'idea', 'idea')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('2d39e204-50c5-c64a-4877-ba0f8626d65e', 'maybe', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('892ec3f1-15e3-0293-1587-5d579a4c7118', '2d39e204-50c5-c64a-4877-ba0f8626d65e', 'en', 'maybe', 'maybe')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('ad53b261-923e-bc6e-5bfe-332be0298884', '2d39e204-50c5-c64a-4877-ba0f8626d65e', 'es', 'tal vez', 'tal vez')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('41a36c9d-5c6b-3c33-e32d-26be8c37e7b8', 'opinion', 'conversation', 'intermediate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('52e176ae-7faa-28ac-1481-bc3de46841fc', '41a36c9d-5c6b-3c33-e32d-26be8c37e7b8', 'en', 'opinion', 'opinion')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('02e3d3b5-3aef-e13a-342d-5b8b725f45ff', '41a36c9d-5c6b-3c33-e32d-26be8c37e7b8', 'es', 'opinión', 'opinión')
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

