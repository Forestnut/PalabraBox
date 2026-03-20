import json
import base64
import random

# We will read seed.sql, find the scenarios, and add more questions, especially word_order.
# Word order has options as the shuffled correct_answer, or wrong_answers array (WordOrder component uses wrong_answers, let's check DB schema).
# Actually Word Order uses `wrong_answers` as distraction words in `WordOrder.tsx`.

seed_file = "supabase/seed.sql"

scenarios = [
  {"id": "c1fc3572-1b15-46aa-ab54-20ce4b1386ab", "name": "Basic Greetings"},
  {"id": "62e1a8bb-e054-46c5-8f6a-1153e77f98c1", "name": "Family Members"},
  {"id": "848bb226-8cf9-4fef-9a5d-16a7571cf3b1", "name": "Food & Drink"},
  {"id": "2816f1a8-8e3d-4c3e-82d1-0309dd0a6712", "name": "Travel"}
]

new_questions = [
  # Basic Greetings Word Order
  ("c1fc3572-1b15-46aa-ab54-20ce4b1386ab", "word_order", "¿Cómo te llamas?", "¿ Cómo te llamas ?", "['yo', 'es']", "null", "11"),
  ("c1fc3572-1b15-46aa-ab54-20ce4b1386ab", "word_order", "Encantado de conocerte", "Encantado de conocerte", "['mucho', 'mal']", "null", "12"),
  ("c1fc3572-1b15-46aa-ab54-20ce4b1386ab", "word_order", "Yo soy de España", "Yo soy de España", "['nosotros', 'en']", "null", "13"),
  ("c1fc3572-1b15-46aa-ab54-20ce4b1386ab", "word_order", "Hasta la vista", "Hasta la vista", "['luego', 'hola']", "null", "14"),
  
  # Family
  ("62e1a8bb-e054-46c5-8f6a-1153e77f98c1", "word_order", "Mi madre es muy amable", "Mi madre es muy amable", "['padre', 'poco']", "null", "11"),
  ("62e1a8bb-e054-46c5-8f6a-1153e77f98c1", "word_order", "Mi familia es bastante grande", "Mi familia es bastante grande", "['pequeña', 'un']", "null", "12"),
  ("62e1a8bb-e054-46c5-8f6a-1153e77f98c1", "word_order", "Tengo dos hermanos menores", "Tengo dos hermanos menores", "['hermana', 'tres']", "null", "13"),
  
  # Food
  ("848bb226-8cf9-4fef-9a5d-16a7571cf3b1", "word_order", "Me gusta comer paella", "Me gusta comer paella", "['beber', 'agua']", "null", "11"),
  ("848bb226-8cf9-4fef-9a5d-16a7571cf3b1", "word_order", "Un vaso de agua por favor", "Un vaso de agua por favor", "['taza', 'leche']", "null", "12"),
  ("848bb226-8cf9-4fef-9a5d-16a7571cf3b1", "word_order", "La comida está deliciosa", "La comida está deliciosa", "['mala', 'el']", "null", "13"),

  # Travel
  ("2816f1a8-8e3d-4c3e-82d1-0309dd0a6712", "word_order", "¿Dónde está el aeropuerto?", "¿ Dónde está el aeropuerto ?", "['estacion', 'como']", "null", "11"),
  ("2816f1a8-8e3d-4c3e-82d1-0309dd0a6712", "word_order", "Un billete de ida", "Un billete de ida", "['vuelta', 'dos']", "null", "12"),
]

with open(seed_file, 'a', encoding='utf-8') as f:
    f.write("\n\n-- Extended Word Order Questions\n")
    f.write("INSERT INTO public.questions (scenario_id, type, question_text, correct_answer, wrong_answers, image_emoji, sort_order) VALUES\n")
    
    values = []
    for q in new_questions:
        sid, qtype, qtext, cans, wans, imj, so = q
        # Ensure single quotes for SQL string safety
        qtext_sql = f"'{qtext}'"
        cans_sql = f"'{cans}'"
        # wans is like "['yo', 'es']" -> needs array literal in jsonb: '["yo", "es"]'::jsonb
        wans_json = wans.replace("'", '"')
        wans_sql = f"'{wans_json}'::jsonb"
        values.append(f"('{sid}', '{qtype}', {qtext_sql}, {cans_sql}, {wans_sql}, {imj}, {so})")
    
    f.write(",\n".join(values) + ";\n")

print("Added Word Order questions to seed.sql")
