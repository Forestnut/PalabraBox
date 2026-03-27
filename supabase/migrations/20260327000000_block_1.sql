-- Migration auto-generated for content update

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('c3cd8c0e-ef75-a403-a415-d847a5ad9377', 'basics', 'beginner', 100)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('077dfe4b-0d45-9195-8ea9-e97c882110b8', 'c3cd8c0e-ef75-a403-a415-d847a5ad9377', 'en', 'Basics', 'Learn essential greetings and polite words.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('0589d78f-87bc-3299-dd32-aa32bee88cb7', 'c3cd8c0e-ef75-a403-a415-d847a5ad9377', 'es', 'Básicos', 'Aprende saludos esenciales y palabras de cortesía.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('07559b55-f44d-f244-40d3-a27a8be62665', 'hello', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('5c62f1e6-e011-2be8-f9b9-72b64e178fbc', '07559b55-f44d-f244-40d3-a27a8be62665', 'en', 'hello', 'hello')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('875ea756-988b-00ca-183c-6f168d6cbbe9', '07559b55-f44d-f244-40d3-a27a8be62665', 'es', 'hola', 'hola')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('cd1a4638-40be-2940-7da0-de6c4ce613a3', 'yes', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('3f6ad78f-463a-4bfb-bf12-db5fa96ed7ea', 'cd1a4638-40be-2940-7da0-de6c4ce613a3', 'en', 'yes', 'yes')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('90508f31-9086-56e1-09c6-f06651366c57', 'cd1a4638-40be-2940-7da0-de6c4ce613a3', 'es', 'sí', 'sí')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('7fbfd6fa-707b-266f-e4e7-b662b0e2abcc', 'no', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('c19a6027-0e0a-4157-5e12-68148006c19c', '7fbfd6fa-707b-266f-e4e7-b662b0e2abcc', 'en', 'no', 'no')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('e916716d-a1f2-77b7-8c66-0e5bb24214da', '7fbfd6fa-707b-266f-e4e7-b662b0e2abcc', 'es', 'no', 'no')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('416f5f04-0581-fac8-8119-07daa1c4a391', 'please', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('145ef34f-b5ad-d600-b606-a871da901737', '416f5f04-0581-fac8-8119-07daa1c4a391', 'en', 'please', 'please')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('15da4d29-1909-5ce1-8a85-80cdaf5caf14', '416f5f04-0581-fac8-8119-07daa1c4a391', 'es', 'por favor', 'por favor')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('083bc82d-dc9f-3669-f8e3-3d6639dcc155', 'thanks', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('1f66d2d2-2550-1741-f3e4-b83b1ceb3959', '083bc82d-dc9f-3669-f8e3-3d6639dcc155', 'en', 'thanks', 'thanks')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('747e0301-0384-cda2-f321-5f90d1356bc6', '083bc82d-dc9f-3669-f8e3-3d6639dcc155', 'es', 'gracias', 'gracias')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('8891a54c-63b7-d829-1593-614f66d6448c', 'sorry', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('cc885a77-f5d8-c8c3-c612-95aa9e80cff6', '8891a54c-63b7-d829-1593-614f66d6448c', 'en', 'sorry', 'sorry')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('21796b6c-ec08-15fa-0f67-fb557a791929', '8891a54c-63b7-d829-1593-614f66d6448c', 'es', 'lo siento', 'lo siento')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('790a98e7-5c54-5bbb-afa0-e9b58abace58', 'goodbye', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('8b38e9fb-e38c-dedb-9f20-6c423e773860', '790a98e7-5c54-5bbb-afa0-e9b58abace58', 'en', 'goodbye', 'goodbye')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('1e123f89-decc-e302-294c-fd4c3cc25d9b', '790a98e7-5c54-5bbb-afa0-e9b58abace58', 'es', 'adiós', 'adiós')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('23dbd3de-4ead-2180-9023-78e308d6f326', 'and', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('6301e516-5c92-8c16-65b0-9b796f0d07d4', '23dbd3de-4ead-2180-9023-78e308d6f326', 'en', 'and', 'and')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('7057b362-cbc3-4078-3e00-ed6052b90843', '23dbd3de-4ead-2180-9023-78e308d6f326', 'es', 'y', 'y')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '5d8bf3ab-ec46-7ef9-af39-2710b579bb97',
  'c3cd8c0e-ef75-a403-a415-d847a5ad9377',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"hola","options":["adiós","hola","gracias"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '9514b32c-2770-2b17-287d-a55d0fb2dd6b',
  'c3cd8c0e-ef75-a403-a415-d847a5ad9377',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"por favor y gracias","options":["sí y no","hola y adiós","por favor y gracias"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '3bf26e68-e936-64ef-12b0-39e2334b0f70',
  'c3cd8c0e-ef75-a403-a415-d847a5ad9377',
  'listening',
  'undefined',
  3,
  '{"correct":"sorry","audio_text":"lo siento"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'a253d021-8813-2d22-4f4a-f3eec96f5809',
  'c3cd8c0e-ef75-a403-a415-d847a5ad9377',
  'fill_blank',
  'undefined',
  4,
  '{"correct":"sí","text_before":"","text_after":", gracias"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'd46754a7-2528-68a8-1a78-8675afc9a53f',
  'c3cd8c0e-ef75-a403-a415-d847a5ad9377',
  'fill_blank',
  'undefined',
  5,
  '{"correct":"no","text_before":"Oh, ","text_after":", lo siento"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'ef3a869a-883b-b192-a995-9ab1ca09446b',
  'c3cd8c0e-ef75-a403-a415-d847a5ad9377',
  'fill_blank',
  'undefined',
  6,
  '{"correct":"hola","text_before":"¡","text_after":"!"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '35ccc611-5e59-e2c3-47cc-0471bf039112',
  'c3cd8c0e-ef75-a403-a415-d847a5ad9377',
  'fill_blank',
  'undefined',
  7,
  '{"correct":"gracias","text_before":"Sí, ","text_after":"!"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '317d163a-b22e-7a30-2658-7381af76e9d5',
  'c3cd8c0e-ef75-a403-a415-d847a5ad9377',
  'fill_blank',
  'undefined',
  8,
  '{"correct":"por favor","text_before":"Un café, ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'e1af3066-a4fb-0a09-dac2-f74583c71954',
  'c3cd8c0e-ef75-a403-a415-d847a5ad9377',
  'fill_blank',
  'undefined',
  9,
  '{"correct":"adiós","text_before":"Bueno, ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '6f38181d-1cc4-e185-2088-87fe5ae38f05',
  'c3cd8c0e-ef75-a403-a415-d847a5ad9377',
  'word_order',
  'undefined',
  10,
  '{"correct":["hola","sí","por favor"],"words":["hola","sí","por favor","no","gracias"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '404ea3ca-b32d-ad2a-b157-3742a1bd5b8a',
  'c3cd8c0e-ef75-a403-a415-d847a5ad9377',
  'word_order',
  'undefined',
  11,
  '{"correct":["no","gracias"],"words":["no","gracias","sí","hola"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '22ef0c68-5165-db74-1cb3-2be3a415bae1',
  'c3cd8c0e-ef75-a403-a415-d847a5ad9377',
  'word_order',
  'undefined',
  12,
  '{"correct":["lo siento","adiós"],"words":["lo siento","adiós","por favor","hola"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'da80193b-d975-7041-47e3-3b2fa41c8734',
  'c3cd8c0e-ef75-a403-a415-d847a5ad9377',
  'word_order',
  'undefined',
  13,
  '{"correct":["sí","y","no"],"words":["sí","y","no","hola","gracias"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'c385228f-ff0e-9e02-074a-6ae27404dc36',
  'c3cd8c0e-ef75-a403-a415-d847a5ad9377',
  'word_order',
  'undefined',
  14,
  '{"correct":["hola","y","adiós"],"words":["hola","y","adiós","por favor","sí"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '62be4a00-5744-968c-a9ae-376b1d911926',
  'c3cd8c0e-ef75-a403-a415-d847a5ad9377',
  'word_order',
  'undefined',
  15,
  '{"correct":["por favor","gracias"],"words":["por favor","gracias","lo siento","no"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('a55a651d-faae-e3f7-f23d-8916a4e6da4f', 'grammar', 'beginner', 101)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('d0dbf0cf-dea4-b1b3-062b-84adfddd6d8b', 'a55a651d-faae-e3f7-f23d-8916a4e6da4f', 'en', 'To Be + Pronouns', 'Learn basic pronouns and the verb ''to be''.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('cefc0e42-1c40-791d-b49a-1fc0a00ac4bb', 'a55a651d-faae-e3f7-f23d-8916a4e6da4f', 'es', 'Ser/Estar + Pronombres', 'Aprende pronombres básicos y el verbo ''ser/estar''.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('41af0b6e-df0f-14f2-72b4-ac4b2b094592', 'I', 'grammar', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('5a06da28-a653-fc72-825f-65eda3265639', '41af0b6e-df0f-14f2-72b4-ac4b2b094592', 'en', 'I', 'I')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('64b399e7-11d8-fc06-8d3f-aeb6efef77a5', '41af0b6e-df0f-14f2-72b4-ac4b2b094592', 'es', 'yo', 'yo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('ea505417-9f1f-ff70-c2d6-305f5e292674', 'you', 'grammar', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('a51c2015-8fd1-42e5-b23a-6c28dd829dd5', 'ea505417-9f1f-ff70-c2d6-305f5e292674', 'en', 'you', 'you')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('2d8ad908-2c06-6a56-57a6-0b9e0c2e277d', 'ea505417-9f1f-ff70-c2d6-305f5e292674', 'es', 'tú', 'tú')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('a19ce408-4c31-184e-89aa-4693e43b75e4', 'he', 'grammar', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('bc792da8-898b-ec8e-c31d-0513b375f86d', 'a19ce408-4c31-184e-89aa-4693e43b75e4', 'en', 'he', 'he')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('1e904e36-0da2-5a33-5c33-25510d906198', 'a19ce408-4c31-184e-89aa-4693e43b75e4', 'es', 'él', 'él')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('7e45fc01-4086-359f-6304-a9662f00b3b8', 'she', 'grammar', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('c3763e1c-b0e1-b3a3-8181-e0fe96028ca3', '7e45fc01-4086-359f-6304-a9662f00b3b8', 'en', 'she', 'she')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('68933f22-6548-59e1-0d43-7080ce562382', '7e45fc01-4086-359f-6304-a9662f00b3b8', 'es', 'ella', 'ella')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('49f7fdba-3960-4aaa-12e3-2f5f882b7afc', 'am', 'grammar', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('fdeeadc2-20eb-bac1-cca1-5e0a9a4120f6', '49f7fdba-3960-4aaa-12e3-2f5f882b7afc', 'en', 'am (estar)', 'am (estar)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('93d1f3a5-5ed3-d18a-16d9-ddf3b3e29514', '49f7fdba-3960-4aaa-12e3-2f5f882b7afc', 'es', 'estoy', 'estoy')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('402ce23a-a482-c3d5-dad7-03323684d33a', 'is', 'grammar', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('7520a97d-b00d-c6d6-785a-ea33dcc34d11', '402ce23a-a482-c3d5-dad7-03323684d33a', 'en', 'is (estar)', 'is (estar)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('0ab21a92-d2d7-56c2-0b64-5c19725edbde', '402ce23a-a482-c3d5-dad7-03323684d33a', 'es', 'está', 'está')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('0f8c00f5-755a-9267-4cc8-a33279e48b14', 'are', 'grammar', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('5f52dc0c-d14b-361f-3b32-e40601569897', '0f8c00f5-755a-9267-4cc8-a33279e48b14', 'en', 'are (estar)', 'are (estar)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('e8979302-6a73-ed42-76fa-35523fb71200', '0f8c00f5-755a-9267-4cc8-a33279e48b14', 'es', 'estás', 'estás')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('318b8a53-e0ce-ebb8-92ef-3a3ac4356eeb', 'happy', 'grammar', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('0dce96d7-5613-2670-9adb-88757f797389', '318b8a53-e0ce-ebb8-92ef-3a3ac4356eeb', 'en', 'happy', 'happy')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('93d25855-8472-45e0-7735-f5956d7a6630', '318b8a53-e0ce-ebb8-92ef-3a3ac4356eeb', 'es', 'feliz', 'feliz')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('73d1c74e-c352-c05c-6ef2-ce99728f94e5', 'tired', 'grammar', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('7e70e4a8-6829-dcdd-5b5b-e6802720e5d1', '73d1c74e-c352-c05c-6ef2-ce99728f94e5', 'en', 'tired', 'tired')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('82fbbdc6-4685-3de0-458e-148b1a31a211', '73d1c74e-c352-c05c-6ef2-ce99728f94e5', 'es', 'cansado', 'cansado')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'd32f1eed-7143-e2a9-af4e-dc7546d7a0c5',
  'a55a651d-faae-e3f7-f23d-8916a4e6da4f',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"yo estoy feliz","options":["tú estás feliz","yo estoy feliz","ella está cansada"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'e0351c6c-1c53-7713-2d9a-b0bd1d78c786',
  'a55a651d-faae-e3f7-f23d-8916a4e6da4f',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"tú estás cansado","options":["él está feliz","tú estás cansado","yo estoy cansado"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '668b58dc-014a-0c0e-d5af-d5fe69b2df61',
  'a55a651d-faae-e3f7-f23d-8916a4e6da4f',
  'listening',
  'undefined',
  3,
  '{"correct":"she is happy","audio_text":"ella está feliz"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '981913cc-07dd-20f8-c674-4784fe3fc4fd',
  'a55a651d-faae-e3f7-f23d-8916a4e6da4f',
  'fill_blank',
  'undefined',
  4,
  '{"correct":"yo","text_before":"","text_after":" estoy cansado."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '16e0a0f3-4e24-34cf-3e2b-0a52933ac08f',
  'a55a651d-faae-e3f7-f23d-8916a4e6da4f',
  'fill_blank',
  'undefined',
  5,
  '{"correct":"estoy","text_before":"Hola, yo ","text_after":" feliz."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'bd4e1987-ef12-bbe3-724c-4855c48cf5cb',
  'a55a651d-faae-e3f7-f23d-8916a4e6da4f',
  'fill_blank',
  'undefined',
  6,
  '{"correct":"estás","text_before":"Tú ","text_after":" cansado."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '17676245-758c-afab-686f-a7fd6c9ff852',
  'a55a651d-faae-e3f7-f23d-8916a4e6da4f',
  'fill_blank',
  'undefined',
  7,
  '{"correct":"está","text_before":"Sí, él ","text_after":" feliz."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'd5d491e2-ae63-edf9-5562-414bcf6ce70e',
  'a55a651d-faae-e3f7-f23d-8916a4e6da4f',
  'fill_blank',
  'undefined',
  8,
  '{"correct":"ella","text_before":"","text_after":" está cansada."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'b2401233-6f4f-d2c0-70fd-470fa95f6219',
  'a55a651d-faae-e3f7-f23d-8916a4e6da4f',
  'fill_blank',
  'undefined',
  9,
  '{"correct":"feliz","text_before":"Ella está ","text_after":"!"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '1077662a-e78b-91fe-405c-24e82b4ed827',
  'a55a651d-faae-e3f7-f23d-8916a4e6da4f',
  'word_order',
  'undefined',
  10,
  '{"correct":["yo","estoy","feliz"],"words":["yo","estoy","feliz","tú","cansado"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'eccf921b-a295-bf27-cc4e-a2431be8f3cc',
  'a55a651d-faae-e3f7-f23d-8916a4e6da4f',
  'word_order',
  'undefined',
  11,
  '{"correct":["tú","estás","cansado"],"words":["tú","estás","cansado","él","feliz"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '9e246765-2dfb-6e77-15eb-35837e7179c7',
  'a55a651d-faae-e3f7-f23d-8916a4e6da4f',
  'word_order',
  'undefined',
  12,
  '{"correct":["él","está","feliz"],"words":["él","está","feliz","ella","estoy"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '16e7409e-c268-148a-a4ba-690dfdb4a710',
  'a55a651d-faae-e3f7-f23d-8916a4e6da4f',
  'word_order',
  'undefined',
  13,
  '{"correct":["ella","está","cansada"],"words":["ella","está","cansada","yo","feliz"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '24e1f18a-ab97-4836-0028-50f8921f7f26',
  'a55a651d-faae-e3f7-f23d-8916a4e6da4f',
  'word_order',
  'undefined',
  14,
  '{"correct":["hola","yo","estoy","cansado"],"words":["hola","yo","estoy","cansado","feliz"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'f323a35c-7f93-fb2c-4394-acad13d70b57',
  'a55a651d-faae-e3f7-f23d-8916a4e6da4f',
  'word_order',
  'undefined',
  15,
  '{"correct":["sí","ella","está","feliz"],"words":["sí","ella","está","feliz","cansado"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('5cc18025-2de5-5507-c6ca-50ca28ee91ae', 'basics', 'beginner', 102)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('5c57039e-9ad9-6392-87e8-64cccf4f7037', '5cc18025-2de5-5507-c6ca-50ca28ee91ae', 'en', 'Introductions', 'Introduce yourself and ask where others are from.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('8abb7ee1-c6ee-0646-4b90-9145395c6005', '5cc18025-2de5-5507-c6ca-50ca28ee91ae', 'es', 'Presentaciones', 'Preséntate y pregunta de dónde son los demás.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('f21fb6f9-41f7-78b3-f1f2-25da922124f1', 'name', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('045ad94c-6587-24c5-6bed-84d43d21e8d7', 'f21fb6f9-41f7-78b3-f1f2-25da922124f1', 'en', 'name', 'name')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('9c9b9087-f068-9b1f-f308-859cdf432775', 'f21fb6f9-41f7-78b3-f1f2-25da922124f1', 'es', 'nombre', 'nombre')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('415bb6d6-da37-a975-39be-5a5d63fc3498', 'my', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('e3b91da2-a6f5-2be7-a801-76d7343c9d74', '415bb6d6-da37-a975-39be-5a5d63fc3498', 'en', 'my', 'my')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('0a2c409e-789f-7bd7-3613-6498ca973d19', '415bb6d6-da37-a975-39be-5a5d63fc3498', 'es', 'mi', 'mi')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('4b63bae0-275a-c766-eda9-1ff514576853', 'from', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('5b73c417-792a-4da1-dc16-a7e370fced62', '4b63bae0-275a-c766-eda9-1ff514576853', 'en', 'from', 'from')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('80c26c7a-76bd-8ad6-5c03-1c46e0b26e64', '4b63bae0-275a-c766-eda9-1ff514576853', 'es', 'de', 'de')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('a3ca9bd3-efa7-710c-ff2a-a49fe683b09e', 'country', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('9fca37f0-3b39-058f-24bd-c9f3784bec50', 'a3ca9bd3-efa7-710c-ff2a-a49fe683b09e', 'en', 'country', 'country')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('15250ac1-1bab-21fb-4a67-559be8dd8e68', 'a3ca9bd3-efa7-710c-ff2a-a49fe683b09e', 'es', 'país', 'país')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('5afb8514-22e0-9eef-4f6c-00638f005404', 'meet', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('e5219c87-d11b-e84f-478f-ae0ee4c5a34b', '5afb8514-22e0-9eef-4f6c-00638f005404', 'en', 'meet / to know', 'meet / to know')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('c5ba56d3-361a-25e5-8fb6-eab0174fa89b', '5afb8514-22e0-9eef-4f6c-00638f005404', 'es', 'conocer', 'conocer')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('dbaabd24-c405-66da-0d87-8f2b10fd77ec', 'nice', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('dabfd1cc-8606-1116-10cb-37c95ac678b0', 'dbaabd24-c405-66da-0d87-8f2b10fd77ec', 'en', 'nice / pleasure', 'nice / pleasure')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('b68c3816-6b8a-0457-a090-fcfbf952e131', 'dbaabd24-c405-66da-0d87-8f2b10fd77ec', 'es', 'gusto', 'gusto')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('4cc7f124-b6e9-4654-6604-761f77004132', 'is_ser', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('89f26b31-4f21-9af8-fcbf-c87ee0477c5e', '4cc7f124-b6e9-4654-6604-761f77004132', 'en', 'is (ser)', 'is (ser)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('3654ea81-a6c7-7972-8d2b-2404ba750792', '4cc7f124-b6e9-4654-6604-761f77004132', 'es', 'es', 'es')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('d8a08be7-a7ab-80c5-3c1f-7bacf4f56017', 'am_ser', 'basics', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('1d4dab1a-94c7-d19e-d190-f92158cdd53f', 'd8a08be7-a7ab-80c5-3c1f-7bacf4f56017', 'en', 'am (ser)', 'am (ser)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('b8ebb060-1e1d-43db-5195-2739bc0d9dd6', 'd8a08be7-a7ab-80c5-3c1f-7bacf4f56017', 'es', 'soy', 'soy')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'fd91514d-bbb0-855e-1a1a-b981d4f68e78',
  '5cc18025-2de5-5507-c6ca-50ca28ee91ae',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"mi nombre es","options":["yo soy","mi nombre es","yo estoy"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '6644ecff-d8dc-6b7f-b32e-21e8e33f7769',
  '5cc18025-2de5-5507-c6ca-50ca28ee91ae',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"mucho gusto","options":["mucho gusto","mi nombre es","hola adiós"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '5cc54653-317b-66e6-2006-0612ca4a26ed',
  '5cc18025-2de5-5507-c6ca-50ca28ee91ae',
  'listening',
  'undefined',
  3,
  '{"correct":"I am from Spain","audio_text":"yo soy de España"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'ac2ed3d5-6059-2897-df13-627e9fcb0ea5',
  '5cc18025-2de5-5507-c6ca-50ca28ee91ae',
  'fill_blank',
  'undefined',
  4,
  '{"correct":"mi","text_before":"Hola, ","text_after":" nombre es Juan."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'ea27fc51-155d-7edd-1708-b1d3e74b8a7e',
  '5cc18025-2de5-5507-c6ca-50ca28ee91ae',
  'fill_blank',
  'undefined',
  5,
  '{"correct":"nombre","text_before":"Mi ","text_after":" es Ana."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '4492a4ae-7e3c-73e7-e929-598263a3585c',
  '5cc18025-2de5-5507-c6ca-50ca28ee91ae',
  'fill_blank',
  'undefined',
  6,
  '{"correct":"es","text_before":"Mi nombre ","text_after":" Carlos."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '74c8e455-a51c-d262-8d48-f8a47baff628',
  '5cc18025-2de5-5507-c6ca-50ca28ee91ae',
  'fill_blank',
  'undefined',
  7,
  '{"correct":"de","text_before":"Yo soy ","text_after":" México."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'a263ea79-1373-2a22-3f47-18cbf53bf388',
  '5cc18025-2de5-5507-c6ca-50ca28ee91ae',
  'fill_blank',
  'undefined',
  8,
  '{"correct":"soy","text_before":"Yo ","text_after":" de Colombia."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '14d21868-2e30-59e3-5819-eaa2f6a0ee58',
  '5cc18025-2de5-5507-c6ca-50ca28ee91ae',
  'fill_blank',
  'undefined',
  9,
  '{"correct":"gusto","text_before":"Mucho ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'f3cd1c2b-133a-f553-4af7-b17c7a629278',
  '5cc18025-2de5-5507-c6ca-50ca28ee91ae',
  'word_order',
  'undefined',
  10,
  '{"correct":["mi","nombre","es","Carlos"],"words":["mi","nombre","es","Carlos","soy"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '8995b926-7dac-b667-9bd9-b2c46bfe046e',
  '5cc18025-2de5-5507-c6ca-50ca28ee91ae',
  'word_order',
  'undefined',
  11,
  '{"correct":["yo","soy","de","España"],"words":["yo","soy","de","España","estoy"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'e7e55f9d-e002-d64c-2589-ef1909347a6a',
  '5cc18025-2de5-5507-c6ca-50ca28ee91ae',
  'word_order',
  'undefined',
  12,
  '{"correct":["hola","mi","nombre","es","Ana"],"words":["hola","mi","nombre","es","Ana","de"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'f9309a07-f427-c8b9-142b-455b0214fb35',
  '5cc18025-2de5-5507-c6ca-50ca28ee91ae',
  'word_order',
  'undefined',
  13,
  '{"correct":["mucho","gusto"],"words":["mucho","gusto","hola","adiós"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '3a39418e-8f6f-a5bc-cb96-55045812af04',
  '5cc18025-2de5-5507-c6ca-50ca28ee91ae',
  'word_order',
  'undefined',
  14,
  '{"correct":["él","es","de","México"],"words":["él","es","de","México","soy"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'c080ac89-5611-8d20-3c48-e83a24923ac9',
  '5cc18025-2de5-5507-c6ca-50ca28ee91ae',
  'word_order',
  'undefined',
  15,
  '{"correct":["sí","yo","soy","Ana","mucho","gusto"],"words":["sí","yo","soy","Ana","mucho","gusto","es","estoy"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('cd44da6a-6f21-da23-f755-431fd36a2898', 'verbs', 'beginner', 103)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('bc12eca9-4e2b-35d0-f864-fcf652bf32d8', 'cd44da6a-6f21-da23-f755-431fd36a2898', 'en', 'Basic Verbs', 'Learn to express actions and desires.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('690354a5-1fd4-8193-8a43-4bb23ddd8ebd', 'cd44da6a-6f21-da23-f755-431fd36a2898', 'es', 'Verbos Básicos', 'Aprende a expresar acciones y deseos.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('3bdfdd9f-0a4c-36ee-69e1-4c102d188fce', 'eat', 'verbs', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('1728a55d-f5b5-5ec4-ae7a-909b15d6ab98', '3bdfdd9f-0a4c-36ee-69e1-4c102d188fce', 'en', 'to eat', 'to eat')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('13a5ce44-2ad8-6e45-d3ab-a74a584c35a7', '3bdfdd9f-0a4c-36ee-69e1-4c102d188fce', 'es', 'comer', 'comer')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('33ef89bd-97a0-b394-bc48-2a99902a4714', 'drink', 'verbs', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('913a768c-866d-f3da-df00-a842b575cbd1', '33ef89bd-97a0-b394-bc48-2a99902a4714', 'en', 'to drink', 'to drink')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('131e2d29-988c-963a-9ab8-82dfedf9f24c', '33ef89bd-97a0-b394-bc48-2a99902a4714', 'es', 'beber', 'beber')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('858a5b1c-b3d0-5583-d2b1-ef6d68ce9287', 'go', 'verbs', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('17a30a33-a8cd-6b12-d907-617ad1ad074a', '858a5b1c-b3d0-5583-d2b1-ef6d68ce9287', 'en', 'to go', 'to go')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('57c706d3-0aca-d263-6176-2e3bb8c9822f', '858a5b1c-b3d0-5583-d2b1-ef6d68ce9287', 'es', 'ir', 'ir')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('9bf05bbc-00c3-4254-1cf8-dd124b4276c7', 'like', 'verbs', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('3c108d7c-4814-6d16-abe7-6a49c73eb235', '9bf05bbc-00c3-4254-1cf8-dd124b4276c7', 'en', 'to like', 'to like')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('b58a06f9-37ac-f4a0-8406-93d5620f8171', '9bf05bbc-00c3-4254-1cf8-dd124b4276c7', 'es', 'gustar', 'gustar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('5d9854b2-483d-801e-b123-4fce68ba5ac1', 'have', 'verbs', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('b74f6923-633d-4667-55c4-964a6fe1c7fa', '5d9854b2-483d-801e-b123-4fce68ba5ac1', 'en', 'to have', 'to have')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('ca8bd53f-9e79-b89d-9113-03f5b44f4efc', '5d9854b2-483d-801e-b123-4fce68ba5ac1', 'es', 'tener', 'tener')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('8e60b28c-e566-4f3f-96ac-f1ab8aae4af6', 'want', 'verbs', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('17e21bf2-554b-74ef-cf95-b05fb0a1254c', '8e60b28c-e566-4f3f-96ac-f1ab8aae4af6', 'en', 'to want', 'to want')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('c513e60d-246a-918e-8d91-5ffe1e168129', '8e60b28c-e566-4f3f-96ac-f1ab8aae4af6', 'es', 'querer', 'querer')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('85e72602-61e0-6065-f50a-f0223259bd64', 'need', 'verbs', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('708bfb3f-579f-5060-f29b-4eda18f8a94e', '85e72602-61e0-6065-f50a-f0223259bd64', 'en', 'to need', 'to need')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('f7e12734-bc4c-179a-1d5f-87faa5b1a012', '85e72602-61e0-6065-f50a-f0223259bd64', 'es', 'necesitar', 'necesitar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('d55feca5-8537-af04-d9d0-1e626a7d19e2', 'i_want', 'verbs', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('bcbdaed8-cc85-a841-5d6c-f60f5136ba00', 'd55feca5-8537-af04-d9d0-1e626a7d19e2', 'en', 'I want', 'I want')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('c57d5d99-098f-d991-4fb6-9564f5889266', 'd55feca5-8537-af04-d9d0-1e626a7d19e2', 'es', 'quiero', 'quiero')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('87d65fad-5a12-35e9-1b2d-450eb68c1bef', 'i_need', 'verbs', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('db9283a8-6877-e498-c5b1-545b28f2cb20', '87d65fad-5a12-35e9-1b2d-450eb68c1bef', 'en', 'I need', 'I need')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('559cbb6c-a7dd-fb2c-f7e9-5457eced51a8', '87d65fad-5a12-35e9-1b2d-450eb68c1bef', 'es', 'necesito', 'necesito')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '4826bf48-e768-660d-4c01-de1c46265da8',
  'cd44da6a-6f21-da23-f755-431fd36a2898',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"comer","options":["beber","comer","ir"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '1c8998af-e8c3-90cc-8fe7-1772caee2191',
  'cd44da6a-6f21-da23-f755-431fd36a2898',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"necesito beber","options":["quiero comer","necesito beber","quiero ir"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '03f295ff-79eb-0b1f-738d-47415bbcbe1a',
  'cd44da6a-6f21-da23-f755-431fd36a2898',
  'listening',
  'undefined',
  3,
  '{"correct":"I want to go","audio_text":"quiero ir"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '12367c4c-b635-6c75-6444-32d6c163cea0',
  'cd44da6a-6f21-da23-f755-431fd36a2898',
  'fill_blank',
  'undefined',
  4,
  '{"correct":"quiero","text_before":"Yo ","text_after":" comer."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '10644976-c0b9-6949-658d-bf941332a4f2',
  'cd44da6a-6f21-da23-f755-431fd36a2898',
  'fill_blank',
  'undefined',
  5,
  '{"correct":"comer","text_before":"Quiero ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '030fc6d0-06ea-6377-b1cf-178f73178826',
  'cd44da6a-6f21-da23-f755-431fd36a2898',
  'fill_blank',
  'undefined',
  6,
  '{"correct":"necesito","text_before":"Yo ","text_after":" ir."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '91dc285d-f287-e138-45ad-0a8c0c7c58ec',
  'cd44da6a-6f21-da23-f755-431fd36a2898',
  'fill_blank',
  'undefined',
  7,
  '{"correct":"ir","text_before":"Necesito ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'a0c9063a-6117-f5a0-e32a-db0e37da3c17',
  'cd44da6a-6f21-da23-f755-431fd36a2898',
  'fill_blank',
  'undefined',
  8,
  '{"correct":"beber","text_before":"Quiero ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '8dc9cb8a-3ec5-a091-e1a9-f62c97d1edda',
  'cd44da6a-6f21-da23-f755-431fd36a2898',
  'fill_blank',
  'undefined',
  9,
  '{"correct":"tener","text_before":"Necesito ","text_after":" un libro."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '42496104-aa15-9638-24e1-b1e5582c9219',
  'cd44da6a-6f21-da23-f755-431fd36a2898',
  'word_order',
  'undefined',
  10,
  '{"correct":["yo","quiero","comer"],"words":["yo","quiero","comer","necesito","beber"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'bbaa4ef7-7ddd-84bb-b3cb-d6ceb9b2f11c',
  'cd44da6a-6f21-da23-f755-431fd36a2898',
  'word_order',
  'undefined',
  11,
  '{"correct":["yo","necesito","ir"],"words":["yo","necesito","ir","quiero","comer"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'b3c84bae-c202-bf24-aa50-d29732218b13',
  'cd44da6a-6f21-da23-f755-431fd36a2898',
  'word_order',
  'undefined',
  12,
  '{"correct":["quiero","beber"],"words":["quiero","beber","necesito","ir"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '6b54c130-c62d-73a4-4e4d-3922a48fbc27',
  'cd44da6a-6f21-da23-f755-431fd36a2898',
  'word_order',
  'undefined',
  13,
  '{"correct":["por favor","necesito","comer"],"words":["por favor","necesito","comer","quiero","beber"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '0c397f60-d13e-24f0-038a-ec5e2f47cc7e',
  'cd44da6a-6f21-da23-f755-431fd36a2898',
  'word_order',
  'undefined',
  14,
  '{"correct":["sí","quiero","ir"],"words":["sí","quiero","ir","yo","comer"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'feb8f95d-0a77-64f6-7cf7-eb97f23859f5',
  'cd44da6a-6f21-da23-f755-431fd36a2898',
  'word_order',
  'undefined',
  15,
  '{"correct":["necesito","tener"],"words":["necesito","tener","quiero","ir"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.scenarios (id, category, level, sort_order)
VALUES ('923c6a4b-051d-6f4d-960d-4b67d3a0ed87', 'vocabulary', 'beginner', 104)
ON CONFLICT (id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('65429292-6cc0-a4fa-8b86-9dc47f2dd4e3', '923c6a4b-051d-6f4d-960d-4b67d3a0ed87', 'en', 'Objects & Articles', 'Learn to talk about everyday objects.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.scenario_translations (id, scenario_id, language, title, description)
VALUES ('376a9f8e-1aef-259a-0fd3-b1ff9f3bf23d', '923c6a4b-051d-6f4d-960d-4b67d3a0ed87', 'es', 'Objetos y Artículos', 'Aprende a hablar de objetos cotidianos.')
ON CONFLICT (scenario_id, language) DO UPDATE SET title = EXCLUDED.title, description = EXCLUDED.description;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('3699cfdc-19d3-ef32-f6d2-9c9bde6828fb', 'a_masc', 'vocabulary', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('474b273a-7378-76d7-0868-1e30bcb6205e', '3699cfdc-19d3-ef32-f6d2-9c9bde6828fb', 'en', 'a (masculine)', 'a (masculine)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('4cbb93e7-2b10-9917-9dd2-c768007e9ef9', '3699cfdc-19d3-ef32-f6d2-9c9bde6828fb', 'es', 'un', 'un')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('400ffe3b-fb8e-2cf4-a8a0-bbcd9a8397d7', 'a_fem', 'vocabulary', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('39aa9d23-21ea-3a21-342e-a31d4b67d02e', '400ffe3b-fb8e-2cf4-a8a0-bbcd9a8397d7', 'en', 'a (feminine)', 'a (feminine)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('19461ad1-2055-7917-6d02-1f395578fe7c', '400ffe3b-fb8e-2cf4-a8a0-bbcd9a8397d7', 'es', 'una', 'una')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('91843e29-0e20-4344-c804-7369a99df7a9', 'the_masc', 'vocabulary', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('c729726a-0f3d-b3d1-872a-55a2d70ce8a0', '91843e29-0e20-4344-c804-7369a99df7a9', 'en', 'the (masculine)', 'the (masculine)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('f0693679-3cfc-8d49-5a55-c2c03dda2d71', '91843e29-0e20-4344-c804-7369a99df7a9', 'es', 'el', 'el')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('123b14d6-427c-f4bf-eab3-0792fa9d34b0', 'the_fem', 'vocabulary', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('9d4cfe5e-7b1f-1949-11f4-57c2d37f98e7', '123b14d6-427c-f4bf-eab3-0792fa9d34b0', 'en', 'the (feminine)', 'the (feminine)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('efe490bb-8310-54cd-0c98-532227aa470f', '123b14d6-427c-f4bf-eab3-0792fa9d34b0', 'es', 'la', 'la')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('b3cd1617-af77-feca-3cdd-f5831497627a', 'dog', 'vocabulary', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('ddb3ee5b-cb46-b689-6fd1-51ad0e303fa8', 'b3cd1617-af77-feca-3cdd-f5831497627a', 'en', 'dog', 'dog')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('9b6f11e1-0c0d-a6a5-4157-01dd677c2af7', 'b3cd1617-af77-feca-3cdd-f5831497627a', 'es', 'perro', 'perro')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('f4de60c9-5396-2bb1-bdbf-03d554a3d96b', 'car', 'vocabulary', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('3970dcfc-8478-f2cd-75a1-fceb2bbc1650', 'f4de60c9-5396-2bb1-bdbf-03d554a3d96b', 'en', 'car', 'car')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('419091d3-1180-ebd7-905d-4ed0c68d55ca', 'f4de60c9-5396-2bb1-bdbf-03d554a3d96b', 'es', 'coche', 'coche')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('a8130a52-916b-7e33-b7a5-e3178db9a103', 'house', 'vocabulary', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('b6b89cf1-2450-2bc7-b39e-ea269666f3ff', 'a8130a52-916b-7e33-b7a5-e3178db9a103', 'en', 'house', 'house')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('bcd7e252-819d-59fb-8021-c2b7d644b818', 'a8130a52-916b-7e33-b7a5-e3178db9a103', 'es', 'casa', 'casa')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('ca123085-cc44-dd9f-7634-0b205d908b8a', 'book', 'vocabulary', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('9cb0068b-8fb2-56e4-7c65-6d023d7d99ef', 'ca123085-cc44-dd9f-7634-0b205d908b8a', 'en', 'book', 'book')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('36bfdb3e-a52d-8141-7542-60eb7b201d97', 'ca123085-cc44-dd9f-7634-0b205d908b8a', 'es', 'libro', 'libro')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (id, base_key, category, level)
VALUES ('a4315625-e768-c693-2a1b-3a74bf362844', 'pen', 'vocabulary', 'beginner')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('6919cee9-c901-9459-d5c8-823e99cdb422', 'a4315625-e768-c693-2a1b-3a74bf362844', 'en', 'pen', 'pen')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (id, word_id, language, text, audio_text)
VALUES ('674c8a60-c5d3-1abe-63a7-a0990ab7a23a', 'a4315625-e768-c693-2a1b-3a74bf362844', 'es', 'bolígrafo', 'bolígrafo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'e52f3e61-5170-04cf-2e6f-733e7be58a5f',
  '923c6a4b-051d-6f4d-960d-4b67d3a0ed87',
  'multiple_choice',
  'undefined',
  1,
  '{"correct":"el perro","options":["la casa","el perro","un coche"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '678f36a2-e29d-6015-424c-af377b8f5a45',
  '923c6a4b-051d-6f4d-960d-4b67d3a0ed87',
  'multiple_choice',
  'undefined',
  2,
  '{"correct":"un libro","options":["el libro","una casa","un libro"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '99488943-225a-e0e4-82de-69563b923b5f',
  '923c6a4b-051d-6f4d-960d-4b67d3a0ed87',
  'listening',
  'undefined',
  3,
  '{"correct":"the house","audio_text":"la casa"}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'f7ab7241-c6dd-632a-14b4-4536053e2c0a',
  '923c6a4b-051d-6f4d-960d-4b67d3a0ed87',
  'fill_blank',
  'undefined',
  4,
  '{"correct":"el","text_before":"Quiero ","text_after":" coche."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '5d408154-e897-f74d-e524-6841813dae07',
  '923c6a4b-051d-6f4d-960d-4b67d3a0ed87',
  'fill_blank',
  'undefined',
  5,
  '{"correct":"una","text_before":"Necesito ","text_after":" casa."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '281258e0-1d76-c24f-5389-46f765ff82dc',
  '923c6a4b-051d-6f4d-960d-4b67d3a0ed87',
  'fill_blank',
  'undefined',
  6,
  '{"correct":"coche","text_before":"Tengo un ","text_after":"."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '5af58e81-ee1c-2ba5-8339-beae88a0fed2',
  '923c6a4b-051d-6f4d-960d-4b67d3a0ed87',
  'fill_blank',
  'undefined',
  7,
  '{"correct":"casa","text_before":"La ","text_after":" es grande."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  'b78eff34-e190-76e5-d434-e56cc5310d0c',
  '923c6a4b-051d-6f4d-960d-4b67d3a0ed87',
  'fill_blank',
  'undefined',
  8,
  '{"correct":"perro","text_before":"El ","text_after":" está cansado."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '1a2dd3d7-d57a-dcf6-e1b1-a9954ea33a85',
  '923c6a4b-051d-6f4d-960d-4b67d3a0ed87',
  'fill_blank',
  'undefined',
  9,
  '{"correct":"libro","text_before":"Quiero un ","text_after":" por favor."}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '4239c9cd-009e-ef02-ada0-1f1217e1e5a5',
  '923c6a4b-051d-6f4d-960d-4b67d3a0ed87',
  'word_order',
  'undefined',
  10,
  '{"correct":["yo","quiero","el","coche"],"words":["yo","quiero","el","coche","la"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '568d2cf4-58e8-feb4-6d1e-04032dcb29bc',
  '923c6a4b-051d-6f4d-960d-4b67d3a0ed87',
  'word_order',
  'undefined',
  11,
  '{"correct":["necesito","una","casa"],"words":["necesito","una","casa","un","coche"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '7db8ecc5-6559-520c-bd44-662ae209a45c',
  '923c6a4b-051d-6f4d-960d-4b67d3a0ed87',
  'word_order',
  'undefined',
  12,
  '{"correct":["el","perro","está","feliz"],"words":["el","perro","está","feliz","cansado"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '7fbf60bf-3ad9-9c58-6dd6-2bfe9cd3138e',
  '923c6a4b-051d-6f4d-960d-4b67d3a0ed87',
  'word_order',
  'undefined',
  13,
  '{"correct":["quiero","un","libro","por favor"],"words":["quiero","un","libro","por favor","una"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '08618a64-b3ca-b797-3aa0-c3df82273c23',
  '923c6a4b-051d-6f4d-960d-4b67d3a0ed87',
  'word_order',
  'undefined',
  14,
  '{"correct":["la","casa","y","el","coche"],"words":["la","casa","y","el","coche","un"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

INSERT INTO public.questions (id, scenario_id, type, question_text, sort_order, data, source_language, target_language)
VALUES (
  '83234720-e178-0d1a-5dff-20f29893a555',
  '923c6a4b-051d-6f4d-960d-4b67d3a0ed87',
  'word_order',
  'undefined',
  15,
  '{"correct":["necesito","un","bolígrafo"],"words":["necesito","un","bolígrafo","el","casa"]}'::jsonb,
  'en',
  'es'
)
ON CONFLICT (id) DO UPDATE SET data = EXCLUDED.data, question_text = EXCLUDED.question_text;

