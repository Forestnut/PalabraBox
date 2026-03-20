import uuid
import json

base_scenario = 9 # Let's say scenario 9, but let's just query what scenarios exist
scenarios = [1, 2, 3, 4] # "At the Airport", "In the Restaurant", etc. (they have ids like 1, 2, 3, 4 ... up to 12 maybe)

new_rows = []
for s_id in range(1, 13):
    # Word Order
    new_rows.append(f"('{uuid.uuid4()}', 'word_order', 'Arrange the words to form the sentence.', 'I would like a coffee', 'I would like a coffee', ARRAY['I', 'would', 'like', 'a', 'coffee'], NULL, {s_id}),")
    new_rows.append(f"('{uuid.uuid4()}', 'word_order', 'Arrange the words.', 'Where is the bathroom', 'Where is the bathroom', ARRAY['Where', 'is', 'the', 'bathroom'], NULL, {s_id}),")
    # Fill in blank
    new_rows.append(f"('{uuid.uuid4()}', 'fill_blank', 'Complete the sentence.', 'Hello, nice to _ you.', 'meet', ARRAY['meet', 'meat', 'greet', 'seat'], NULL, {s_id}),")
    new_rows.append(f"('{uuid.uuid4()}', 'fill_blank', 'Complete the sentence.', 'I need to go to the _.', 'airport', ARRAY['airport', 'plane', 'sky', 'fly'], NULL, {s_id}),")

with open('supabase/seed.sql', 'a') as f:
    f.write("\n-- New Generated Questions for word_order and fill_blank\n")
    f.write("INSERT INTO public.questions (id, type, prompt, text_to_read, correct_answer, options, image_url, scenario_id)\n")
    f.write("VALUES\n")
    for row in new_rows[:-1]:
        f.write(row + "\n")
    # last row with semicolon
    f.write(new_rows[-1][:-1] + ";\n")

print("Appended D&D and Fill Blank questions successfully!")
