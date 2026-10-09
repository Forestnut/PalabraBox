


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";





SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."questions" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "scenario_id" "uuid" NOT NULL,
    "type" "text" NOT NULL,
    "question_text" "text" NOT NULL,
    "question_text_tts" "text",
    "hint" "text",
    "sort_order" integer DEFAULT 0,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "word_id" "uuid",
    "data" "jsonb",
    "source_language" "text",
    "target_language" "text",
    "correct_answer" "text",
    "wrong_answers" "text"[],
    "image_emoji" "text",
    CONSTRAINT "questions_type_check" CHECK (("type" = ANY (ARRAY['multiple_choice'::"text", 'image_match'::"text", 'listening'::"text", 'fill_blank'::"text", 'word_order'::"text"])))
);


ALTER TABLE "public"."questions" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."scenario_translations" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "scenario_id" "uuid" NOT NULL,
    "language" "text" NOT NULL,
    "title" "text" NOT NULL,
    "description" "text"
);


ALTER TABLE "public"."scenario_translations" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."scenarios" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "category" "text" NOT NULL,
    "level" "text" NOT NULL,
    "sort_order" integer DEFAULT 0,
    CONSTRAINT "scenarios_new_level_check" CHECK (("level" = ANY (ARRAY['beginner'::"text", 'intermediate'::"text"])))
);


ALTER TABLE "public"."scenarios" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."word_translations" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "word_id" "uuid" NOT NULL,
    "language" "text" NOT NULL,
    "text" "text" NOT NULL,
    "audio_text" "text"
);


ALTER TABLE "public"."word_translations" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."words" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "base_key" "text",
    "category" "text" NOT NULL,
    "level" "text" NOT NULL,
    "word" "text",
    "language" "text",
    "translation_es" "text",
    "translation_en" "text",
    "image_emoji" "text",
    "audio_text" "text",
    CONSTRAINT "words_new_level_check" CHECK (("level" = ANY (ARRAY['beginner'::"text", 'intermediate'::"text"])))
);


ALTER TABLE "public"."words" OWNER TO "postgres";


ALTER TABLE ONLY "public"."questions"
    ADD CONSTRAINT "questions_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."scenario_translations"
    ADD CONSTRAINT "scenario_translations_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."scenario_translations"
    ADD CONSTRAINT "scenario_translations_scenario_id_language_key" UNIQUE ("scenario_id", "language");



ALTER TABLE ONLY "public"."scenarios"
    ADD CONSTRAINT "scenarios_new_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."word_translations"
    ADD CONSTRAINT "word_translations_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."word_translations"
    ADD CONSTRAINT "word_translations_word_id_language_key" UNIQUE ("word_id", "language");



ALTER TABLE ONLY "public"."words"
    ADD CONSTRAINT "words_new_base_key_key" UNIQUE ("base_key");



ALTER TABLE ONLY "public"."words"
    ADD CONSTRAINT "words_new_pkey" PRIMARY KEY ("id");



CREATE INDEX "idx_questions_scenario" ON "public"."questions" USING "btree" ("scenario_id");



CREATE INDEX "idx_word_translations_word_lang" ON "public"."word_translations" USING "btree" ("word_id", "language");



ALTER TABLE ONLY "public"."questions"
    ADD CONSTRAINT "questions_scenario_id_fkey" FOREIGN KEY ("scenario_id") REFERENCES "public"."scenarios"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."questions"
    ADD CONSTRAINT "questions_word_id_fkey" FOREIGN KEY ("word_id") REFERENCES "public"."words"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."scenario_translations"
    ADD CONSTRAINT "scenario_translations_scenario_id_fkey" FOREIGN KEY ("scenario_id") REFERENCES "public"."scenarios"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."word_translations"
    ADD CONSTRAINT "word_translations_word_id_fkey" FOREIGN KEY ("word_id") REFERENCES "public"."words"("id") ON DELETE CASCADE;



CREATE POLICY "Allow public read - questions" ON "public"."questions" FOR SELECT USING (true);



CREATE POLICY "Allow public read - scenario_translations" ON "public"."scenario_translations" FOR SELECT USING (true);



CREATE POLICY "Allow public read - scenarios" ON "public"."scenarios" FOR SELECT USING (true);



CREATE POLICY "Allow public read - word_translations" ON "public"."word_translations" FOR SELECT USING (true);



CREATE POLICY "Allow public read - words" ON "public"."words" FOR SELECT USING (true);



ALTER TABLE "public"."questions" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."scenario_translations" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."scenarios" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."word_translations" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."words" ENABLE ROW LEVEL SECURITY;




ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";


GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";





































































































































































GRANT ALL ON TABLE "public"."questions" TO "anon";
GRANT ALL ON TABLE "public"."questions" TO "authenticated";
GRANT ALL ON TABLE "public"."questions" TO "service_role";



GRANT ALL ON TABLE "public"."scenario_translations" TO "anon";
GRANT ALL ON TABLE "public"."scenario_translations" TO "authenticated";
GRANT ALL ON TABLE "public"."scenario_translations" TO "service_role";



GRANT ALL ON TABLE "public"."scenarios" TO "anon";
GRANT ALL ON TABLE "public"."scenarios" TO "authenticated";
GRANT ALL ON TABLE "public"."scenarios" TO "service_role";



GRANT ALL ON TABLE "public"."word_translations" TO "anon";
GRANT ALL ON TABLE "public"."word_translations" TO "authenticated";
GRANT ALL ON TABLE "public"."word_translations" TO "service_role";



GRANT ALL ON TABLE "public"."words" TO "anon";
GRANT ALL ON TABLE "public"."words" TO "authenticated";
GRANT ALL ON TABLE "public"."words" TO "service_role";









ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "service_role";































