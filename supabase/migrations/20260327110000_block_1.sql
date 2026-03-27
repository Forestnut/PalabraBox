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

INSERT INTO public.words (base_key, category, level)
VALUES ('hello', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'hello'), 'en', 'hello', 'hello')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'hello'), 'es', 'hola', 'hola')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('yes', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'yes'), 'en', 'yes', 'yes')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'yes'), 'es', 'sí', 'sí')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('no', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'no'), 'en', 'no', 'no')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'no'), 'es', 'no', 'no')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('please', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'please'), 'en', 'please', 'please')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'please'), 'es', 'por favor', 'por favor')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('thanks', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'thanks'), 'en', 'thanks', 'thanks')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'thanks'), 'es', 'gracias', 'gracias')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('sorry', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'sorry'), 'en', 'sorry', 'sorry')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'sorry'), 'es', 'lo siento', 'lo siento')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('goodbye', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'goodbye'), 'en', 'goodbye', 'goodbye')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'goodbye'), 'es', 'adiós', 'adiós')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('and', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'and'), 'en', 'and', 'and')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'and'), 'es', 'y', 'y')
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

INSERT INTO public.words (base_key, category, level)
VALUES ('I', 'grammar', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'I'), 'en', 'I', 'I')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'I'), 'es', 'yo', 'yo')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('you', 'grammar', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'you'), 'en', 'you', 'you')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'you'), 'es', 'tú', 'tú')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('he', 'grammar', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'he'), 'en', 'he', 'he')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'he'), 'es', 'él', 'él')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('she', 'grammar', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'she'), 'en', 'she', 'she')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'she'), 'es', 'ella', 'ella')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('am', 'grammar', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'am'), 'en', 'am (estar)', 'am (estar)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'am'), 'es', 'estoy', 'estoy')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('is', 'grammar', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'is'), 'en', 'is (estar)', 'is (estar)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'is'), 'es', 'está', 'está')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('are', 'grammar', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'are'), 'en', 'are (estar)', 'are (estar)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'are'), 'es', 'estás', 'estás')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('happy', 'grammar', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'happy'), 'en', 'happy', 'happy')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'happy'), 'es', 'feliz', 'feliz')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('tired', 'grammar', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'tired'), 'en', 'tired', 'tired')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'tired'), 'es', 'cansado', 'cansado')
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

INSERT INTO public.words (base_key, category, level)
VALUES ('name', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'name'), 'en', 'name', 'name')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'name'), 'es', 'nombre', 'nombre')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('my', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'my'), 'en', 'my', 'my')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'my'), 'es', 'mi', 'mi')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('from', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'from'), 'en', 'from', 'from')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'from'), 'es', 'de', 'de')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('country', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'country'), 'en', 'country', 'country')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'country'), 'es', 'país', 'país')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('meet', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'meet'), 'en', 'meet / to know', 'meet / to know')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'meet'), 'es', 'conocer', 'conocer')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('nice', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'nice'), 'en', 'nice / pleasure', 'nice / pleasure')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'nice'), 'es', 'gusto', 'gusto')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('is_ser', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'is_ser'), 'en', 'is (ser)', 'is (ser)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'is_ser'), 'es', 'es', 'es')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('am_ser', 'basics', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'am_ser'), 'en', 'am (ser)', 'am (ser)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'am_ser'), 'es', 'soy', 'soy')
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

INSERT INTO public.words (base_key, category, level)
VALUES ('eat', 'verbs', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'eat'), 'en', 'to eat', 'to eat')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'eat'), 'es', 'comer', 'comer')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('drink', 'verbs', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'drink'), 'en', 'to drink', 'to drink')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'drink'), 'es', 'beber', 'beber')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('go', 'verbs', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'go'), 'en', 'to go', 'to go')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'go'), 'es', 'ir', 'ir')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('like', 'verbs', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'like'), 'en', 'to like', 'to like')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'like'), 'es', 'gustar', 'gustar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('have', 'verbs', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'have'), 'en', 'to have', 'to have')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'have'), 'es', 'tener', 'tener')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('want', 'verbs', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'want'), 'en', 'to want', 'to want')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'want'), 'es', 'querer', 'querer')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('need', 'verbs', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'need'), 'en', 'to need', 'to need')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'need'), 'es', 'necesitar', 'necesitar')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('i_want', 'verbs', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'i_want'), 'en', 'I want', 'I want')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'i_want'), 'es', 'quiero', 'quiero')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('i_need', 'verbs', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'i_need'), 'en', 'I need', 'I need')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'i_need'), 'es', 'necesito', 'necesito')
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

INSERT INTO public.words (base_key, category, level)
VALUES ('a_masc', 'vocabulary', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'a_masc'), 'en', 'a (masculine)', 'a (masculine)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'a_masc'), 'es', 'un', 'un')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('a_fem', 'vocabulary', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'a_fem'), 'en', 'a (feminine)', 'a (feminine)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'a_fem'), 'es', 'una', 'una')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('the_masc', 'vocabulary', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'the_masc'), 'en', 'the (masculine)', 'the (masculine)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'the_masc'), 'es', 'el', 'el')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('the_fem', 'vocabulary', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'the_fem'), 'en', 'the (feminine)', 'the (feminine)')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'the_fem'), 'es', 'la', 'la')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('dog', 'vocabulary', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'dog'), 'en', 'dog', 'dog')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'dog'), 'es', 'perro', 'perro')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('car', 'vocabulary', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'car'), 'en', 'car', 'car')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'car'), 'es', 'coche', 'coche')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('house', 'vocabulary', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'house'), 'en', 'house', 'house')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'house'), 'es', 'casa', 'casa')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('book', 'vocabulary', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'book'), 'en', 'book', 'book')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'book'), 'es', 'libro', 'libro')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.words (base_key, category, level)
VALUES ('pen', 'vocabulary', 'beginner')
ON CONFLICT (base_key) DO UPDATE SET category = EXCLUDED.category, level = EXCLUDED.level;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'pen'), 'en', 'pen', 'pen')
ON CONFLICT (word_id, language) DO UPDATE SET text = EXCLUDED.text;

INSERT INTO public.word_translations (word_id, language, text, audio_text)
VALUES ((SELECT id FROM public.words WHERE base_key = 'pen'), 'es', 'bolígrafo', 'bolígrafo')
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

