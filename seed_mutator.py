import re

with open('supabase/seed.sql', 'r') as f:
    text = f.read()

# Fix Animals duplicate perro for english
text = text.replace("('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'multiple_choice', 'How do you say \"perro\" in English?', 'dog', 'dog', ARRAY['rabbit', 'cow', 'fish'], NULL, 2),", "('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'fill_blank', 'The ____ barks loudly.', 'dog', 'dog', ARRAY['cat', 'cow', 'fish'], NULL, 2),\n('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'word_order', 'Arrange the words correctly', 'the dog is big', 'the dog is big', ARRAY['small', 'not'], NULL, 11),")

# Fix Travel duplicates and add word order
text = text.replace("('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'multiple_choice', 'How do you say \"hotel\" in English?', 'hotel', 'hotel', ARRAY['bus', 'airport', 'car'], NULL, 2),", "('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'word_order', 'Arrange the words correctly', 'we sleep at the hotel', 'we sleep at the hotel', ARRAY['run', 'not'], NULL, 2),")

# Add some to Spanish
text = text.replace("('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'multiple_choice', 'How do you say \"blue\" in Spanish?', 'azul', 'azul', ARRAY['naranja', 'negro', 'amarillo'], NULL, 5),", "('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'fill_blank', 'El cielo es ____.', 'azul', 'azul', ARRAY['rojo', 'negro', 'verde'], NULL, 5),")

text = text.replace("('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'multiple_choice', 'How do you say \"bird\" in Spanish?', 'pájaro', 'pájaro', ARRAY['vaca', 'pez', 'conejo'], NULL, 7),", "('3a2ecbbd-0112-4c22-bde1-f8e136cf95fc', 'word_order', 'Arrange the words correctly', 'el pájaro puede volar', 'el pájaro puede volar', ARRAY['perro', 'no'], NULL, 7),")

with open('supabase/seed.sql', 'w') as f:
    f.write(text)

print("Seed mutated")
