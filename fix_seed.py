import re

with open('supabase/seed.sql', 'r') as f:
    lines = f.readlines()

new_lines = []
seen = set()

for line in lines:
    if 'INSERT INTO public.questions' in line or line.strip() == '':
        new_lines.append(line)
        continue
    if line.startswith('--'):
        new_lines.append(line)
        seen.clear()
        continue
        
    if '(' in line and ')' in line and 'ARRAY' in line:
        # Check uniqueness by question text
        m = re.search(r"'(.*?)'", line)
        if m:
            q_text = m.group(1)
            if q_text in seen:
                # modify the duplicate to be a word_order or something else, but it's complex
                pass

