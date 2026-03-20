import re
import uuid

def fix_sql():
    with open('supabase/seed.sql', 'r') as f:
        content = f.read()

    # Find all UUIDs that appear inside the questions insert statement
    # Specifically those inserted by our hacky script
    def repl(match):
        return f"'{str(uuid.uuid4())}'"
        
    # Find incorrect uuids (stuff with 't', 'n', or not exactly 36 chars)
    bad_uuid_pattern = r"'[a-f0-9-]{32,}'"
    
    # We only want to replace ones that are strictly invalid formatting.
    # To be safe, any uuid that matches /'[a-f0-9-]{36}'/ is good, but ones that are like 38 chars or have non hex?
    pass

with open('supabase/seed.sql', 'r') as f:
    lines = f.readlines()

new_lines = []
for line in lines:
    if 'INSERT INTO public.questions (id' in line or "('6f7a" in line or "('2b4d" in line:
        pass
    
    # Let's just find anything matching ('[a-zA-Z0-9-]{30,}', 
    match = re.search(r"\('([^']+)',", line)
    if match and len(match.group(1)) > 10 and 'INSERT' not in line:
        val = match.group(1)
        # Check if valid uuid
        try:
            uuid.UUID(val)
            new_lines.append(line)
        except ValueError:
            new_val = str(uuid.uuid4())
            new_lines.append(line.replace(f"'{val}'", f"'{new_val}'"))
    else:
        new_lines.append(line)
        
with open('supabase/seed.sql', 'w') as f:
    f.writelines(new_lines)
print("done")
