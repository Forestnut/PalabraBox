import uuid

uuids = [
    "e11c8282-e565-4f40-8483-e0202e8d3eaa",
    "2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e",
    "3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f",
    "4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f9a",
    "5e6f7a8b-9c0d-1e2f-3a4b-5c6d7e8f9a0b",
    "6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c",
    "7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d",
    "3a2ecbbd-0112-4c22-bde1-f8e136cf95fc",
    "9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f",
    "0d1e2f3a-4b5c-6d7e-8f9a-0b1c2d3e4f5a",
    "1e2f3a4b-5c6d-7e8f-9a0b-1c2d3e4f5a6b",
    "2f3a4b5c-6d7e-8f9a-0b1c-2d3e4f5a6b7c"
]

rows = []
for idx, s_id in enumerate(uuids):
    base_order = 11
    # word_order
    rows.append(f"('{s_id}', 'word_order', 'Arrange the words to form the sentence.', 'I would like a coffee', 'I would like a coffee', ARRAY['I', 'would', 'like', 'a', 'coffee'], NULL, {base_order}),")
    rows.append(f"('{s_id}', 'word_order', 'Arrange the words.', 'Where is the bathroom', 'Where is the bathroom', ARRAY['Where', 'is', 'the', 'bathroom'], NULL, {base_order+1}),")
    # fill_blank
    rows.append(f"('{s_id}', 'fill_blank', 'Complete the sentence.', 'Hello, nice to _ you.', 'meet', ARRAY['meet', 'meat', 'greet', 'seat'], NULL, {base_order+2}),")
    rows.append(f"('{s_id}', 'fill_blank', 'Complete the sentence.', 'I need to go to the _.', 'airport', ARRAY['airport', 'plane', 'sky', 'fly'], NULL, {base_order+3}),")

with open('supabase/seed.sql', 'a') as f:
    f.write("\n-- New Generated Questions for word_order and fill_blank\n")
    f.write("INSERT INTO public.questions (scenario_id, type, question_text, question_text_tts, correct_answer, wrong_answers, image_emoji, sort_order) VALUES\n")
    for row in rows[:-1]:
        f.write(row + "\n")
    # last row
    f.write(rows[-1][:-1] + ";\n")

print("Added DND!")
