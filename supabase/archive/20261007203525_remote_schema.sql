drop extension if exists "pg_net";

alter table "public"."questions" add column "correct_answer" text;

alter table "public"."questions" add column "image_emoji" text;

alter table "public"."questions" add column "wrong_answers" text[];

alter table "public"."words" add column "audio_text" text;

alter table "public"."words" add column "image_emoji" text;

alter table "public"."words" add column "language" text;

alter table "public"."words" add column "translation_en" text;

alter table "public"."words" add column "translation_es" text;

alter table "public"."words" add column "word" text;

alter table "public"."words" alter column "base_key" drop not null;

CREATE TRIGGER protect_bucket_control_insert BEFORE INSERT ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.protect_bucket_control_columns('service_role');

CREATE TRIGGER protect_bucket_control_update BEFORE UPDATE OF lifecycle_configuration, lifecycle_configuration_generation ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.protect_bucket_control_columns();

CREATE TRIGGER protect_bucket_control_update_role AFTER UPDATE OF lifecycle_configuration, lifecycle_configuration_generation ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_lifecycle_service_role('service_role');


