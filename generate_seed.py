import json

# Output file
SEED_FILE = "supabase/seed.sql"

scenarios = [
    # EN (Learning Spanish from English - actually, the app seems to teach EN to ES speakers and ES to EN speakers).
    # "language" column in scenario denotes the language *being taught*.
    ('e11c8282-e565-4f40-8483-e0202e8d3eaa', 'Colors & Shapes', 'Colores y Formas', 'english', 'beginner', 'Learn the primary colors and basic shapes in English.', '🎨', 'colors', 1),
    ('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'Animals', 'Los Animales', 'english', 'beginner', 'Learn the names of common animals in English.', '🐶', 'animals', 2),
    ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'Food & Drinks', 'Comida y Bebidas', 'english', 'beginner', 'Essential vocabulary for eating and drinking.', '🍔', 'food', 3),
    ('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'Family', 'La Familia', 'english', 'beginner', 'Vocabulary related to family members.', '👨‍👩‍👧‍👦', 'family', 4),
    ('5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'Parts of the Body', 'Partes del Cuerpo', 'english', 'intermediate', 'Learn how to name body parts in English.', '🦵', 'body', 5),
    ('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Travel & Transport', 'Viajes y Transporte', 'english', 'intermediate', 'Useful words for traveling and transportation.', '✈️', 'travel', 6),
    ('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'Los Colores y Formas', 'Colors & Shapes', 'spanish', 'beginner', 'Learn the primary colors and basic shapes in Spanish.', '🎨', 'colors', 1),
    ('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'Los Animales', 'Animals', 'spanish', 'beginner', 'Aprende los nombres de los animales más comunes en español.', '🐶', 'animals', 2),
    ('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Comida y Bebidas', 'Food & Drinks', 'spanish', 'beginner', 'Essential vocabulary for eating and drinking in Spanish.', '🍔', 'food', 3),
    ('0d1e2f3a-4b5c-6d7e-8f9a-0b1c2d3e4f5a', 'Mi Familia', 'My Family', 'spanish', 'beginner', 'Vocabulary related to family members in Spanish.', '👨‍👩‍👧‍👦', 'family', 4),
    ('1e2f3a4b-5c6d-7e8f-9a0b-1c2d3e4f5a6b', 'Partes del Cuerpo', 'Body Parts', 'spanish', 'intermediate', 'Learn how to name body parts in Spanish.', '🦵', 'body', 5),
    ('2f3a4b5c-6d7e-8f9a-0b1c-2d3e4f5a6b7c', 'Viajes y Transporte', 'Travel', 'spanish', 'intermediate', 'Useful words for traveling and transportation in Spanish.', '✈️', 'travel', 6)
]

words = [
    # (word, language, level, category, trans_es, trans_en, emoji, audio_text)
    ('red', 'english', 'beginner', 'colors', 'rojo', None, '🔴', 'red'),
    ('blue', 'english', 'beginner', 'colors', 'azul', None, '🔵', 'blue'),
    ('yellow', 'english', 'beginner', 'colors', 'amarillo', None, '🟡', 'yellow'),
    ('green', 'english', 'beginner', 'colors', 'verde', None, '🟢', 'green'),
    ('black', 'english', 'beginner', 'colors', 'negro', None, '⚫', 'black'),
    ('white', 'english', 'beginner', 'colors', 'blanco', None, '⚪', 'white'),
    ('purple', 'english', 'beginner', 'colors', 'morado', None, '🟣', 'purple'),
    ('orange', 'english', 'beginner', 'colors', 'naranja', None, '🟠', 'orange'),
    ('dog', 'english', 'beginner', 'animals', 'perro', None, '🐶', 'dog'),
    ('cat', 'english', 'beginner', 'animals', 'gato', None, '🐱', 'cat'),
    ('bird', 'english', 'beginner', 'animals', 'pájaro', None, '🐦', 'bird'),
    ('fish', 'english', 'beginner', 'animals', 'pez', None, '🐟', 'fish'),
    ('cow', 'english', 'beginner', 'animals', 'vaca', None, '🐄', 'cow'),
    ('horse', 'english', 'beginner', 'animals', 'caballo', None, '🐴', 'horse'),
    ('pig', 'english', 'beginner', 'animals', 'cerdo', None, '🐷', 'pig'),
    ('rabbit', 'english', 'beginner', 'animals', 'conejo', None, '🐰', 'rabbit'),
    ('apple', 'english', 'beginner', 'food', 'manzana', None, '🍎', 'apple'),
    ('bread', 'english', 'beginner', 'food', 'pan', None, '🍞', 'bread'),
    ('water', 'english', 'beginner', 'food', 'agua', None, '💧', 'water'),
    ('milk', 'english', 'beginner', 'food', 'leche', None, '🥛', 'milk'),
    ('cheese', 'english', 'beginner', 'food', 'queso', None, '🧀', 'cheese'),
    ('egg', 'english', 'beginner', 'food', 'huevo', None, '🥚', 'egg'),
    ('meat', 'english', 'beginner', 'food', 'carne', None, '🥩', 'meat'),
    ('chicken', 'english', 'beginner', 'food', 'pollo', None, '🍗', 'chicken'),
    ('mother', 'english', 'beginner', 'family', 'madre', None, '👩', 'mother'),
    ('father', 'english', 'beginner', 'family', 'padre', None, '👨', 'father'),
    ('brother', 'english', 'beginner', 'family', 'hermano', None, '👦', 'brother'),
    ('sister', 'english', 'beginner', 'family', 'hermana', None, '👧', 'sister'),
    ('grandmother', 'english', 'beginner', 'family', 'abuela', None, '👵', 'grandmother'),
    ('grandfather', 'english', 'beginner', 'family', 'abuelo', None, '👴', 'grandfather'),
    ('aunt', 'english', 'beginner', 'family', 'tía', None, '👱‍♀️', 'aunt'),
    ('uncle', 'english', 'beginner', 'family', 'tío', None, '👱‍♂️', 'uncle'),
    ('head', 'english', 'intermediate', 'body', 'cabeza', None, '🗣️', 'head'),
    ('hand', 'english', 'intermediate', 'body', 'mano', None, '✋', 'hand'),
    ('leg', 'english', 'intermediate', 'body', 'pierna', None, '🦵', 'leg'),
    ('foot', 'english', 'intermediate', 'body', 'pie', None, '🦶', 'foot'),
    ('eye', 'english', 'intermediate', 'body', 'ojo', None, '👁️', 'eye'),
    ('ear', 'english', 'intermediate', 'body', 'oreja', None, '👂', 'ear'),
    ('mouth', 'english', 'intermediate', 'body', 'boca', None, '👄', 'mouth'),
    ('nose', 'english', 'intermediate', 'body', 'nariz', None, '👃', 'nose'),
    ('car', 'english', 'intermediate', 'travel', 'coche', None, '🚗', 'car'),
    ('bus', 'english', 'intermediate', 'travel', 'autobús', None, '🚌', 'bus'),
    ('train', 'english', 'intermediate', 'travel', 'tren', None, '🚆', 'train'),
    ('plane', 'english', 'intermediate', 'travel', 'avión', None, '✈️', 'plane'),
    ('ticket', 'english', 'intermediate', 'travel', 'billete', None, '🎫', 'ticket'),
    ('hotel', 'english', 'intermediate', 'travel', 'hotel', None, '🏨', 'hotel'),
    ('passport', 'english', 'intermediate', 'travel', 'pasaporte', None, '🛂', 'passport'),
    ('airport', 'english', 'intermediate', 'travel', 'aeropuerto', None, '🛫', 'airport'),
    ('rojo', 'spanish', 'beginner', 'colors', None, 'red', '🔴', 'rojo'),
    ('azul', 'spanish', 'beginner', 'colors', None, 'blue', '🔵', 'azul'),
    ('amarillo', 'spanish', 'beginner', 'colors', None, 'yellow', '🟡', 'amarillo'),
    ('verde', 'spanish', 'beginner', 'colors', None, 'green', '🟢', 'verde'),
    ('negro', 'spanish', 'beginner', 'colors', None, 'black', '⚫', 'negro'),
    ('blanco', 'spanish', 'beginner', 'colors', None, 'white', '⚪', 'blanco'),
    ('morado', 'spanish', 'beginner', 'colors', None, 'purple', '🟣', 'morado'),
    ('naranja', 'spanish', 'beginner', 'colors', None, 'orange', '🟠', 'naranja'),
    ('perro', 'spanish', 'beginner', 'animals', None, 'dog', '🐶', 'perro'),
    ('gato', 'spanish', 'beginner', 'animals', None, 'cat', '🐱', 'gato'),
    ('pájaro', 'spanish', 'beginner', 'animals', None, 'bird', '🐦', 'pájaro'),
    ('pez', 'spanish', 'beginner', 'animals', None, 'fish', '🐟', 'pez'),
    ('vaca', 'spanish', 'beginner', 'animals', None, 'cow', '🐄', 'vaca'),
    ('caballo', 'spanish', 'beginner', 'animals', None, 'horse', '🐴', 'caballo'),
    ('cerdo', 'spanish', 'beginner', 'animals', None, 'pig', '🐷', 'cerdo'),
    ('conejo', 'spanish', 'beginner', 'animals', None, 'rabbit', '🐰', 'conejo'),
    ('manzana', 'spanish', 'beginner', 'food', None, 'apple', '🍎', 'manzana'),
    ('pan', 'spanish', 'beginner', 'food', None, 'bread', '🍞', 'pan'),
    ('agua', 'spanish', 'beginner', 'food', None, 'water', '💧', 'agua'),
    ('leche', 'spanish', 'beginner', 'food', None, 'milk', '🥛', 'leche'),
    ('queso', 'spanish', 'beginner', 'food', None, 'cheese', '🧀', 'queso'),
    ('huevo', 'spanish', 'beginner', 'food', None, 'egg', '🥚', 'huevo'),
    ('carne', 'spanish', 'beginner', 'food', None, 'meat', '🥩', 'carne'),
    ('pollo', 'spanish', 'beginner', 'food', None, 'chicken', '🍗', 'pollo'),
    ('madre', 'spanish', 'beginner', 'family', None, 'mother', '👩', 'madre'),
    ('padre', 'spanish', 'beginner', 'family', None, 'father', '👨', 'padre'),
    ('hermano', 'spanish', 'beginner', 'family', None, 'brother', '👦', 'hermano'),
    ('hermana', 'spanish', 'beginner', 'family', None, 'sister', '👧', 'hermana'),
    ('abuela', 'spanish', 'beginner', 'family', None, 'grandmother', '👵', 'abuela'),
    ('abuelo', 'spanish', 'beginner', 'family', None, 'grandfather', '👴', 'abuelo'),
    ('tía', 'spanish', 'beginner', 'family', None, 'aunt', '👱‍♀️', 'tía'),
    ('tío', 'spanish', 'beginner', 'family', None, 'uncle', '👱‍♂️', 'tío'),
    ('cabeza', 'spanish', 'intermediate', 'body', None, 'head', '🗣️', 'cabeza'),
    ('mano', 'spanish', 'intermediate', 'body', None, 'hand', '✋', 'mano'),
    ('pierna', 'spanish', 'intermediate', 'body', None, 'leg', '🦵', 'pierna'),
    ('pie', 'spanish', 'intermediate', 'body', None, 'foot', '🦶', 'pie'),
    ('ojo', 'spanish', 'intermediate', 'body', None, 'eye', '👁️', 'ojo'),
    ('oreja', 'spanish', 'intermediate', 'body', None, 'ear', '👂', 'oreja'),
    ('boca', 'spanish', 'intermediate', 'body', None, 'mouth', '👄', 'boca'),
    ('nariz', 'spanish', 'intermediate', 'body', None, 'nose', '👃', 'nariz'),
    ('coche', 'spanish', 'intermediate', 'travel', None, 'car', '🚗', 'coche'),
    ('autobús', 'spanish', 'intermediate', 'travel', None, 'bus', '🚌', 'autobús'),
    ('tren', 'spanish', 'intermediate', 'travel', None, 'train', '🚆', 'tren'),
    ('avión', 'spanish', 'intermediate', 'travel', None, 'plane', '✈️', 'avión'),
    ('billete', 'spanish', 'intermediate', 'travel', None, 'ticket', '🎫', 'billete'),
    ('hotel', 'spanish', 'intermediate', 'travel', None, 'hotel', '🏨', 'hotel'),
    ('pasaporte', 'spanish', 'intermediate', 'travel', None, 'passport', '🛂', 'pasaporte'),
    ('aeropuerto', 'spanish', 'intermediate', 'travel', None, 'airport', '🛫', 'aeropuerto')
]

# We will generate massive lists of questions per scenario.
qs = []
def add_q(sid, type_, q_txt, q_tts, canswer, wansws, emoji, hint=None):
    qs.append({
        'sid': sid, 'type': type_, 'q': q_txt, 'tts': q_tts, 'cans': canswer, 'wans': wansws, 'emoji': emoji, 'hint': hint
    })

# Scenario mapping
EN_COLORS = 'e11c8282-e565-4f40-8483-e0202e8d3eaa'
EN_ANIMALS = '2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e'
EN_FOOD = '3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f'
EN_FAMILY = '4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a'
EN_BODY = '5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b'
EN_TRAVEL = '6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c'

ES_COLORS = '7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d'
ES_ANIMALS = '3a2ecbbd-0112-4c22-bde1-f8e136cf95fc'
ES_FOOD = '9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f'
ES_FAMILY = '0d1e2f3a-4b5c-6d7e-8f9a-0b1c2d3e4f5a'
ES_BODY = '1e2f3a4b-5c6d-7e8f-9a0b-1c2d3e4f5a6b'
ES_TRAVEL = '2f3a4b5c-6d7e-8f9a-0b1c-2d3e4f5a6b7c'

# Let's populate ENGLISH (teaching English to ES speaker)
add_q(EN_COLORS, 'multiple_choice', '¿Cómo se dice "rojo" en inglés?', 'red', 'red', ['orange', 'green', 'purple'], None)
add_q(EN_COLORS, 'multiple_choice', '¿Cómo se dice "azul" en inglés?', 'blue', 'blue', ['red', 'white', 'black'], None)
add_q(EN_COLORS, 'multiple_choice', '¿Cómo se dice "verde" en inglés?', 'green', 'green', ['yellow', 'blue', 'orange'], None)
add_q(EN_COLORS, 'image_match', '¿Qué palabra representa 🔴?', 'red', 'red', ['yellow', 'orange', 'blue'], '🔴')
add_q(EN_COLORS, 'image_match', '¿Qué palabra representa 🔵?', 'blue', 'blue', ['purple', 'green', 'white'], '🔵')
add_q(EN_COLORS, 'listening', 'Escucha y selecciona la palabra correcta', 'yellow', 'yellow', ['black', 'orange', 'green'], None)
add_q(EN_COLORS, 'listening', 'Escucha y selecciona la palabra correcta', 'white', 'white', ['black', 'red', 'green'], None)
add_q(EN_COLORS, 'word_order', 'Ordena las palabras para formar: "El color es rojo"', 'the color is red', 'the color is red', ['sun', 'not', 'blue'], None, 'Translate to English')
add_q(EN_COLORS, 'word_order', 'Ordena las palabras para formar: "El cielo es azul"', 'the sky is blue', 'the sky is blue', ['green', 'are', 'bird'], None, 'Translate to English')
add_q(EN_COLORS, 'word_order', 'Ordena las palabras para formar: "La caja amarilla"', 'the yellow box', 'the yellow box', ['red', 'boxes', 'is'], None, 'Translate to English')
add_q(EN_COLORS, 'fill_blank', 'The color of a frog is ____.', 'green', 'green', ['red', 'blue', 'white'], None)
add_q(EN_COLORS, 'fill_blank', 'The sun is ____.', 'yellow', 'yellow', ['purple', 'black', 'orange'], None)

add_q(EN_ANIMALS, 'multiple_choice', '¿Cómo se dice "perro" en inglés?', 'dog', 'dog', ['fish', 'cow', 'cat'], None)
add_q(EN_ANIMALS, 'image_match', '¿Qué palabra representa 🐱?', 'cat', 'cat', ['horse', 'fish', 'rabbit'], '🐱')
add_q(EN_ANIMALS, 'listening', 'Escucha y selecciona la palabra correcta', 'pig', 'pig', ['bird', 'rabbit', 'dog'], None)
add_q(EN_ANIMALS, 'word_order', 'Ordena las palabras para formar: "El perro ladra"', 'the dog barks', 'the dog barks', ['cat', 'meows', 'is'], None, 'Translate to English')
add_q(EN_ANIMALS, 'word_order', 'Ordena las palabras para formar: "Un conejo rápido"', 'a fast rabbit', 'a fast rabbit', ['slow', 'turtle', 'the'], None, 'Translate to English')
add_q(EN_ANIMALS, 'word_order', 'Ordena las palabras para formar: "Mi gato duerme"', 'my cat sleeps', 'my cat sleeps', ['dog', 'playing', 'is'], None, 'Translate to English')
add_q(EN_ANIMALS, 'fill_blank', 'A ___ says meow.', 'cat', 'cat', ['dog', 'cow', 'fish'], None)
add_q(EN_ANIMALS, 'fill_blank', 'A ___ swims in the water.', 'fish', 'fish', ['bird', 'cat', 'horse'], None)

add_q(EN_FOOD, 'multiple_choice', '¿Cómo se dice "queso" en inglés?', 'cheese', 'cheese', ['bread', 'water', 'meat'], None)
add_q(EN_FOOD, 'image_match', '¿Qué palabra representa 🥛?', 'milk', 'milk', ['cheese', 'apple', 'meat'], '🥛')
add_q(EN_FOOD, 'listening', 'Escucha y selecciona la palabra correcta', 'cheese', 'cheese', ['milk', 'water', 'apple'], None)
add_q(EN_FOOD, 'word_order', 'Ordena las palabras para formar: "Yo bebo agua"', 'i drink water', 'i drink water', ['eat', 'milk', 'you'], None, 'Translate to English')
add_q(EN_FOOD, 'word_order', 'Ordena las palabras para formar: "Me gusta el pollo"', 'i like chicken', 'i like chicken', ['hate', 'fish', 'do'], None, 'Translate to English')
add_q(EN_FOOD, 'word_order', 'Ordena las palabras para formar: "Una manzana roja"', 'a red apple', 'a red apple', ['green', 'the', 'meat'], None, 'Translate to English')
add_q(EN_FOOD, 'fill_blank', 'I eat ___ with cheese.', 'bread', 'bread', ['water', 'milk', 'apple'], None)
add_q(EN_FOOD, 'fill_blank', 'Cows give us ___.', 'milk', 'milk', ['bread', 'chicken', 'apple'], None)

add_q(EN_FAMILY, 'multiple_choice', '¿Cómo se dice "madre" en inglés?', 'mother', 'mother', ['brother', 'father', 'grandmother'], None)
add_q(EN_FAMILY, 'image_match', '¿Qué palabra representa 👴?', 'grandfather', 'grandfather', ['aunt', 'brother', 'grandmother'], '👴')
add_q(EN_FAMILY, 'listening', 'Escucha y selecciona la palabra correcta', 'brother', 'brother', ['mother', 'father', 'sister'], None)
add_q(EN_FAMILY, 'word_order', 'Ordena las palabras para formar: "Mi hermano pequeño"', 'my little brother', 'my little brother', ['big', 'sister', 'is'], None, 'Translate to English')
add_q(EN_FAMILY, 'word_order', 'Ordena las palabras para formar: "Ella es mi tía"', 'she is my aunt', 'she is my aunt', ['he', 'uncle', 'the'], None, 'Translate to English')
add_q(EN_FAMILY, 'word_order', 'Ordena las palabras para formar: "Mi padre trabaja"', 'my father works', 'my father works', ['mother', 'sleeping', 'is'], None, 'Translate to English')
add_q(EN_FAMILY, 'fill_blank', 'My mother and ___.', 'father', 'father', ['sister', 'uncle', 'aunt'], None)

add_q(EN_BODY, 'multiple_choice', '¿Cómo se dice "cabeza" en inglés?', 'head', 'head', ['mouth', 'ear', 'eye'], None)
add_q(EN_BODY, 'image_match', '¿Qué palabra representa 👁️?', 'eye', 'eye', ['ear', 'leg', 'head'], '👁️')
add_q(EN_BODY, 'listening', 'Escucha y selecciona la palabra correcta', 'leg', 'leg', ['hand', 'foot', 'ear'], None)
add_q(EN_BODY, 'word_order', 'Ordena las palabras para formar: "Cierra los ojos"', 'close your eyes', 'close your eyes', ['open', 'mouth', 'my'], None, 'Translate to English')
add_q(EN_BODY, 'word_order', 'Ordena las palabras para formar: "Mis dos manos"', 'my two hands', 'my two hands', ['one', 'feet', 'the'], None, 'Translate to English')
add_q(EN_BODY, 'word_order', 'Ordena las palabras para formar: "Tengo una nariz"', 'i have a nose', 'i have a nose', ['two', 'ears', 'has'], None, 'Translate to English')

add_q(EN_TRAVEL, 'multiple_choice', '¿Cómo se dice "hotel" en inglés?', 'hotel', 'hotel', ['plane', 'ticket', 'car'], None)
add_q(EN_TRAVEL, 'image_match', '¿Qué palabra representa 🚌?', 'bus', 'bus', ['train', 'passport', 'hotel'], '🚌')
add_q(EN_TRAVEL, 'listening', 'Escucha y selecciona la palabra correcta', 'car', 'car', ['airport', 'hotel', 'plane'], None)
add_q(EN_TRAVEL, 'word_order', 'Ordena las palabras para formar: "Dónde está el hotel"', 'where is the hotel', 'where is the hotel', ['who', 'airport', 'are'], None, 'Translate to English')
add_q(EN_TRAVEL, 'word_order', 'Ordena las palabras para formar: "Necesito un billete"', 'i need a ticket', 'i need a ticket', ['want', 'passport', 'the'], None, 'Translate to English')
add_q(EN_TRAVEL, 'word_order', 'Ordena las palabras para formar: "El tren rápido"', 'the fast train', 'the fast train', ['slow', 'bus', 'a'], None, 'Translate to English')


# SPANISH (teaching Spanish to EN speaker)
add_q(ES_COLORS, 'multiple_choice', 'How do you say "white" in Spanish?', 'blanco', 'blanco', ['morado', 'verde', 'naranja'], None)
add_q(ES_COLORS, 'multiple_choice', 'How do you say "blue" in Spanish?', 'azul', 'azul', ['naranja', 'blanco', 'verde'], None)
add_q(ES_COLORS, 'multiple_choice', 'How do you say "red" in Spanish?', 'rojo', 'rojo', ['naranja', 'blanco', 'morado'], None)
add_q(ES_COLORS, 'image_match', 'Which word represents 🟣?', 'morado', 'morado', ['rojo', 'negro', 'azul'], '🟣')
add_q(ES_COLORS, 'image_match', 'Which word represents 🟠?', 'naranja', 'naranja', ['verde', 'morado', 'negro'], '🟠')
add_q(ES_COLORS, 'listening', 'Listen and select the correct word', 'azul', 'azul', ['amarillo', 'rojo', 'verde'], None)
add_q(ES_COLORS, 'listening', 'Listen and select the correct word', 'blanco', 'blanco', ['naranja', 'rojo', 'negro'], None)
add_q(ES_COLORS, 'word_order', 'Translate to Spanish: "The color is red"', 'el color es rojo', 'el color es rojo', ['sol', 'no', 'azul'], None, 'Translate to Spanish')
add_q(ES_COLORS, 'word_order', 'Translate to Spanish: "The sky is blue"', 'el cielo es azul', 'el cielo es azul', ['verde', 'son', 'pájaro'], None, 'Translate to Spanish')
add_q(ES_COLORS, 'word_order', 'Translate to Spanish: "The yellow box"', 'la caja amarilla', 'la caja amarilla', ['rojo', 'cajas', 'es'], None, 'Translate to Spanish')

add_q(ES_ANIMALS, 'multiple_choice', 'How do you say "fish" in Spanish?', 'pez', 'pez', ['gato', 'vaca', 'cerdo'], None)
add_q(ES_ANIMALS, 'image_match', 'Which word represents 🐷?', 'cerdo', 'cerdo', ['pájaro', 'conejo', 'pez'], '🐷')
add_q(ES_ANIMALS, 'listening', 'Listen and select the correct word', 'perro', 'perro', ['cerdo', 'gato', 'conejo'], None)
add_q(ES_ANIMALS, 'word_order', 'Translate to Spanish: "The dog barks"', 'el perro ladra', 'el perro ladra', ['gato', 'maúlla', 'es'], None, 'Translate to Spanish')
add_q(ES_ANIMALS, 'word_order', 'Translate to Spanish: "A fast rabbit"', 'un conejo rápido', 'un conejo rápido', ['lento', 'tortuga', 'la'], None, 'Translate to Spanish')
add_q(ES_ANIMALS, 'word_order', 'Translate to Spanish: "My cat sleeps"', 'mi gato duerme', 'mi gato duerme', ['perro', 'jugando', 'está'], None, 'Translate to Spanish')

add_q(ES_FOOD, 'multiple_choice', 'How do you say "cheese" in Spanish?', 'queso', 'queso', ['pollo', 'pan', 'manzana'], None)
add_q(ES_FOOD, 'image_match', 'Which word represents 🍗?', 'pollo', 'pollo', ['manzana', 'carne', 'queso'], '🍗')
add_q(ES_FOOD, 'listening', 'Listen and select the correct word', 'agua', 'agua', ['leche', 'pan', 'carne'], None)
add_q(ES_FOOD, 'word_order', 'Translate to Spanish: "I drink water"', 'yo bebo agua', 'yo bebo agua', ['como', 'leche', 'tú'], None, 'Translate to Spanish')
add_q(ES_FOOD, 'word_order', 'Translate to Spanish: "I like chicken"', 'me gusta el pollo', 'me gusta el pollo', ['odio', 'pescado', 'sé'], None, 'Translate to Spanish')
add_q(ES_FOOD, 'word_order', 'Translate to Spanish: "A red apple"', 'una manzana roja', 'una manzana roja', ['verde', 'la', 'carne'], None, 'Translate to Spanish')

add_q(ES_FAMILY, 'multiple_choice', 'How do you say "mother" in Spanish?', 'madre', 'madre', ['padre', 'abuela', 'hermana'], None)
add_q(ES_FAMILY, 'image_match', 'Which word represents 👵?', 'abuela', 'abuela', ['tío', 'padre', 'hermana'], '👵')
add_q(ES_FAMILY, 'listening', 'Listen and select the correct word', 'madre', 'madre', ['abuelo', 'hermano', 'padre'], None)
add_q(ES_FAMILY, 'word_order', 'Translate to Spanish: "My little brother"', 'mi hermano pequeño', 'mi hermano pequeño', ['grande', 'hermana', 'es'], None, 'Translate to Spanish')
add_q(ES_FAMILY, 'word_order', 'Translate to Spanish: "She is my aunt"', 'ella es mi tía', 'ella es mi tía', ['él', 'tío', 'la'], None, 'Translate to Spanish')
add_q(ES_FAMILY, 'word_order', 'Translate to Spanish: "My father works"', 'mi padre trabaja', 'mi padre trabalha', ['madre', 'durmiendo', 'está'], None, 'Translate to Spanish')

add_q(ES_BODY, 'multiple_choice', 'How do you say "foot" in Spanish?', 'pie', 'pie', ['oreja', 'nariz', 'ojo'], None)
add_q(ES_BODY, 'image_match', 'Which word represents 👂?', 'oreja', 'oreja', ['pie', 'pierna', 'boca'], '👂')
add_q(ES_BODY, 'listening', 'Listen and select the correct word', 'oreja', 'oreja', ['boca', 'pierna', 'nariz'], None)
add_q(ES_BODY, 'word_order', 'Translate to Spanish: "Close your eyes"', 'cierra los ojos', 'cierra los ojos', ['abre', 'boca', 'mis'], None, 'Translate to Spanish')
add_q(ES_BODY, 'word_order', 'Translate to Spanish: "My two hands"', 'mis dos manos', 'mis dos manos', ['una', 'pies', 'las'], None, 'Translate to Spanish')
add_q(ES_BODY, 'word_order', 'Translate to Spanish: "I have a nose"', 'tengo una nariz', 'tengo una nariz', ['dos', 'orejas', 'tiene'], None, 'Translate to Spanish')

add_q(ES_TRAVEL, 'multiple_choice', 'How do you say "car" in Spanish?', 'coche', 'coche', ['billete', 'hotel', 'autobús'], None)
add_q(ES_TRAVEL, 'image_match', 'Which word represents 🚌?', 'autobús', 'autobús', ['pasaporte', 'billete', 'hotel'], '🚌')
add_q(ES_TRAVEL, 'listening', 'Listen and select the correct word', 'avión', 'avión', ['billete', 'aeropuerto', 'coche'], None)
add_q(ES_TRAVEL, 'word_order', 'Translate to Spanish: "Where is the hotel"', 'dónde está el hotel', 'dónde está el hotel', ['quién', 'aeropuerto', 'son'], None, 'Translate to Spanish')
add_q(ES_TRAVEL, 'word_order', 'Translate to Spanish: "I need a ticket"', 'necesito un billete', 'necesito un billete', ['quiero', 'pasaporte', 'el'], None, 'Translate to Spanish')
add_q(ES_TRAVEL, 'word_order', 'Translate to Spanish: "The fast train"', 'el tren rápido', 'el tren rápido', ['lento', 'autobús', 'un'], None, 'Translate to Spanish')

import uuid

def generate_sql():
    out = []
    out.append("-- Seed Data for PalabraBox Phase 3.5")
    
    # Scenarios
    out.append("INSERT INTO public.scenarios (id, title, title_display, language, level, description, emoji, category, sort_order) VALUES")
    scen_vals = []
    for s in scenarios:
        scen_vals.append(f"('{s[0]}', '{s[1]}', '{s[2]}', '{s[3]}', '{s[4]}', '{s[5]}', '{s[6]}', '{s[7]}', {s[8]})")
    out.append(",\n".join(scen_vals) + "\nON CONFLICT (id) DO NOTHING;\n")

    # Words
    out.append("INSERT INTO public.words (word, language, level, category, translation_es, translation_en, image_emoji, audio_text) VALUES")
    word_vals = []
    for w in words:
        tes = f"'{w[4]}'" if w[4] else "NULL"
        ten = f"'{w[5]}'" if w[5] else "NULL"
        im = f"'{w[6]}'" if w[6] else "NULL"
        word_vals.append(f"('{w[0]}', '{w[1]}', '{w[2]}', '{w[3]}', {tes}, {ten}, {im}, '{w[7]}')")
    out.append(",\n".join(word_vals) + ";\n")

    # Questions
    out.append("INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, hint, sort_order) VALUES")
    q_vals = []
    sort_order = 1
    for q in qs:
        w_escaped = [ans.replace("'", "''") for ans in q['wans']]
        w_arr = "ARRAY[" + ", ".join(f"'{ans}'" for ans in w_escaped) + "]"
        im = f"'{q['emoji']}'" if q['emoji'] else "NULL"
        ht = f"'{q['hint']}'" if q.get('hint') else "NULL"
        t = q['tts'] if q['tts'] else q['cans']
        
        q_txt = q['q'].replace("'", "''")
        t_txt = t.replace("'", "''")
        cans = q['cans'].replace("'", "''")
        q_vals.append(f"('{q['sid']}', '{q['type']}', '{q_txt}', '{t_txt}', '{cans}', {w_arr}, {im}, {ht}, {sort_order})")
        sort_order += 1
    
    out.append(",\n".join(q_vals) + ";\n")

    with open(SEED_FILE, "w", encoding="utf-8") as f:
        f.write("\n".join(out))

    print(f"Generated {SEED_FILE} successfully.")

if __name__ == "__main__":
    generate_sql()
