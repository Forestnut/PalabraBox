import json
import uuid

import os

scenarios = [
    {"id": "e11c8282-e565-4f40-8483-e0202e8d3eaa", "lang": "english", "level": "beginner", "title": "Colors & Shapes", "display": "Colores y Formas", "desc": "Learn the primary colors and basic shapes in English.", "emoji": "🎨", "category": "colors", "order": 1},
    {"id": "2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e", "lang": "english", "level": "beginner", "title": "Animals", "display": "Los Animales", "desc": "Learn the names of common animals in English.", "emoji": "🐶", "category": "animals", "order": 2},
    {"id": "3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f", "lang": "english", "level": "beginner", "title": "Food & Drinks", "display": "Comida y Bebidas", "desc": "Essential vocabulary for eating and drinking.", "emoji": "🍔", "category": "food", "order": 3},
    {"id": "4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a", "lang": "english", "level": "beginner", "title": "Family", "display": "La Familia", "desc": "Vocabulary related to family members.", "emoji": "👨‍👩‍👧‍👦", "category": "family", "order": 4},
    {"id": "5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b", "lang": "english", "level": "intermediate", "title": "Parts of the Body", "display": "Partes del Cuerpo", "desc": "Learn how to name body parts in English.", "emoji": "🦵", "category": "body", "order": 5},
    {"id": "6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c", "lang": "english", "level": "intermediate", "title": "Travel & Transport", "display": "Viajes y Transporte", "desc": "Useful words for traveling and transportation.", "emoji": "✈️", "category": "travel", "order": 6},
    
    {"id": "7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d", "lang": "spanish", "level": "beginner", "title": "Los Colores y Formas", "display": "Colors & Shapes", "desc": "Learn the primary colors and basic shapes in Spanish.", "emoji": "🎨", "category": "colors", "order": 1},
    {"id": "3a2ecbbd-0112-4c22-bde1-f8e136cf95fc", "lang": "spanish", "level": "beginner", "title": "Los Animales", "display": "Animals", "desc": "Aprende los nombres de los animales más comunes en español.", "emoji": "🐶", "category": "animals", "order": 2},
    {"id": "9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f", "lang": "spanish", "level": "beginner", "title": "Comida y Bebidas", "display": "Food & Drinks", "desc": "Essential vocabulary for eating and drinking in Spanish.", "emoji": "🍔", "category": "food", "order": 3},
    {"id": "0d1e2f3a-4b5c-6d7e-8f9a-0b1c2d3e4f5a", "lang": "spanish", "level": "beginner", "title": "Mi Familia", "display": "My Family", "desc": "Vocabulary related to family members in Spanish.", "emoji": "👨‍👩‍👧‍👦", "category": "family", "order": 4},
    {"id": "1e2f3a4b-5c6d-7e8f-9a0b-1c2d3e4f5a6b", "lang": "spanish", "level": "intermediate", "title": "Partes del Cuerpo", "display": "Body Parts", "desc": "Learn how to name body parts in Spanish.", "emoji": "🦵", "category": "body", "order": 5},
    {"id": "2f3a4b5c-6d7e-8f9a-0b1c-2d3e4f5a6b7c", "lang": "spanish", "level": "intermediate", "title": "Viajes y Transporte", "display": "Travel", "desc": "Useful words for traveling and transportation in Spanish.", "emoji": "✈️", "category": "travel", "order": 6},
]

categories = {
    "colors": [
        ("red", "rojo", "🔴"), ("blue", "azul", "🔵"), ("yellow", "amarillo", "🟡"), ("green", "verde", "🟢"),
        ("black", "negro", "⚫"), ("white", "blanco", "⚪"), ("purple", "morado", "🟣"), ("orange", "naranja", "🟠")
    ],
    "animals": [
        ("dog", "perro", "🐶"), ("cat", "gato", "🐱"), ("bird", "pájaro", "🐦"), ("fish", "pez", "🐟"),
        ("cow", "vaca", "🐄"), ("horse", "caballo", "🐴"), ("pig", "cerdo", "🐷"), ("rabbit", "conejo", "🐰")
    ],
    "food": [
        ("apple", "manzana", "🍎"), ("bread", "pan", "🍞"), ("water", "agua", "💧"), ("milk", "leche", "🥛"),
        ("cheese", "queso", "🧀"), ("egg", "huevo", "🥚"), ("meat", "carne", "🥩"), ("chicken", "pollo", "🍗")
    ],
    "family": [
        ("mother", "madre", "👩"), ("father", "padre", "👨"), ("brother", "hermano", "👦"), ("sister", "hermana", "👧"),
        ("grandmother", "abuela", "👵"), ("grandfather", "abuelo", "👴"), ("aunt", "tía", "👱‍♀️"), ("uncle", "tío", "👱‍♂️")
    ],
    "body": [
        ("head", "cabeza", "🗣️"), ("hand", "mano", "✋"), ("leg", "pierna", "🦵"), ("foot", "pie", "🦶"),
        ("eye", "ojo", "👁️"), ("ear", "oreja", "👂"), ("mouth", "boca", "👄"), ("nose", "nariz", "👃")
    ],
    "travel": [
        ("car", "coche", "🚗"), ("bus", "autobús", "🚌"), ("train", "tren", "🚆"), ("plane", "avión", "✈️"),
        ("ticket", "billete", "🎫"), ("hotel", "hotel", "🏨"), ("passport", "pasaporte", "🛂"), ("airport", "aeropuerto", "🛫")
    ]
}

sql = []
sql.append("-- Seed Data for PalabraBox MVP (Auto-Generated 12 Modules)")
sql.append("-- SCENARIOS")

# Scenarios
for s in scenarios:
    sql.append(f"""INSERT INTO public.scenarios (id, title, title_display, language, level, description, emoji, category, sort_order) VALUES ('{s['id']}', '{s['title']}', '{s['display']}', '{s['lang']}', '{s['level']}', '{s['desc']}', '{s['emoji']}', '{s['category']}', {s['order']}) ON CONFLICT (id) DO NOTHING;""")

sql.append("\n-- WORDS")
sql.append("INSERT INTO public.words (word, language, level, category, translation_es, translation_en, image_emoji, audio_text) VALUES")
words_sql = []
for s in scenarios:
    for item in categories[s['category']]:
        en_word, es_word, emoji = item
        if s['lang'] == 'english':
            # English word entry
            words_sql.append(f"('{en_word}', 'english', '{s['level']}', '{s['category']}', '{es_word}', NULL, '{emoji}', '{en_word}')")
        else:
            # Spanish word entry
            words_sql.append(f"('{es_word}', 'spanish', '{s['level']}', '{s['category']}', NULL, '{en_word}', '{emoji}', '{es_word}')")

sql.append(",\n".join(words_sql) + " ")

sql.append("\n-- QUESTIONS")
for s in scenarios:
    sql.append(f"\n-- Questions for {s['title']}")
    items = categories[s['category']]
    q_sql = []
    
    # Generate 10 simple questions for each scenario by picking random combinations
    import random
    random.seed(hash(s['id']))
    
    for i in range(1, 11):
        target = random.choice(items)
        en_word, es_word, emoji = target
        
        # Determine correct/wrong text based on language
        if s['lang'] == 'english':
            correct = en_word
            wrong_pool = [x[0] for x in items if x[0] != en_word]
            q_text = f'How do you say "{es_word}" in English?'
            audio = correct
        else:
            correct = es_word
            wrong_pool = [x[1] for x in items if x[1] != es_word]
            q_text = f'How do you say "{en_word}" in Spanish?'
            audio = correct
            
        wrongs = random.sample(wrong_pool, 3)
        wrongs_str = f"ARRAY['{wrongs[0]}', '{wrongs[1]}', '{wrongs[2]}']"
        
        q_type = 'multiple_choice'
        if i % 3 == 0:
            q_type = 'image_match'
            q_text = f'Which word represents {emoji}?'
        elif i % 4 == 0:
            q_type = 'listening'
            q_text = 'Listen and select the correct word'
            
        q_sql.append(f"('{s['id']}', '{q_type}', '{q_text}', '{audio}', '{correct}', {wrongs_str}, {i})")
        
    sql.append("INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, sort_order) VALUES")
    sql.append(",\n".join(q_sql) + ";")

with open('supabase/seed.sql', 'w', encoding='utf-8') as f:
    f.write("\n".join(sql) + "\n")
