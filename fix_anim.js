const fs = require('fs');
let code = fs.readFileSync('src/components/ui/Mascot.tsx', 'utf-8');
code = code.replace(
  'animate={currentAnim as any}',
  '// eslint-disable-next-line @typescript-eslint/no-explicit-any\n          animate={currentAnim as any}'
);
fs.writeFileSync('src/components/ui/Mascot.tsx', code);
