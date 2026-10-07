# 🎨 Design System

## Design Philosophy

PalabraBox follows a **"playful cardboard box"** visual language. Every interactive element should feel like a small 3D box — elevated with shadows, pressing down on click, and floating up on hover. Inspired by Duolingo's approachable design but with a unique box/packaging theme.

**Key principles:**

- **Friendly & warm** — rounded corners, soft shadows, playful colors
- **Kid-safe** — large touch targets (min 48px), clear contrast, readable fonts
- **Box-like** — every card/tile has the "elevated box" look with bottom shadows
- **Mobile-first** — designed for phones, scales up to desktop

## Color Palette

Using a **60/30/10** distribution:

### Primary Colors

| Name      | Hex       | CSS Variable | Usage (%) | Purpose                                    |
| --------- | --------- | ------------ | --------- | ------------------------------------------ |
| **Dark**  | `#080C08` | `--pb-dark`  | 60%       | Text, headings, dark backgrounds           |
| **Green** | `#56876D` | `--pb-green` | 30%       | Secondary sections, card backgrounds       |
| **Amber** | `#FFA42C` | `--pb-amber` | 10%       | CTA buttons, highlights, important accents |

### Supporting Colors

| Name             | Hex       | CSS Variable      | Purpose                                      |
| ---------------- | --------- | ----------------- | -------------------------------------------- |
| **Emerald**      | `#04724D` | `--pb-emerald`    | Secondary buttons, links, progress bar start |
| **Background**   | `#F0F5F1` | `--pb-bg`         | Page background                              |
| **Surface**      | `#FFFFFF` | —                 | Cards, tiles                                 |
| **Success**      | `#10B981` | `--pb-success`    | Correct answer feedback                      |
| **Error**        | `#EF4444` | `--pb-error`      | Wrong answer feedback                        |
| **Text Light**   | `#6B7B71` | `--pb-text-light` | Secondary text, descriptions                 |
| **Text on Dark** | `#F0F5F1` | —                 | Light text on dark backgrounds               |

### Usage Guide

| Element             | Color            | Tailwind Class                |
| ------------------- | ---------------- | ----------------------------- |
| Page background     | Light gray-green | `bg-pb-bg`                    |
| Main headings       | Dark             | `text-pb-dark`                |
| Cards/tiles         | White + shadow   | `bg-white shadow-box`         |
| Primary CTA (Play)  | Amber            | `bg-pb-amber text-white`      |
| Secondary button    | Emerald          | `bg-pb-emerald text-white`    |
| Progress bar        | Gradient         | `from-pb-emerald to-pb-amber` |
| Section backgrounds | Green            | `bg-pb-green`                 |
| Correct answer      | Green            | `bg-pb-success`               |
| Wrong answer        | Red              | `bg-pb-error`                 |
| Locked scenario     | Gray             | `bg-gray-200 opacity-60`      |

## Typography

### Font: Nunito (Google Fonts)

- Rounded, warm, child-friendly
- Highly readable on small screens
- Weights: 400 (Regular), 600 (SemiBold), 700 (Bold), 800 (ExtraBold)

```html
<link
  href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap"
  rel="stylesheet"
/>
```

### Text Scale

| Element        | Size       | Weight          | Example                 |
| -------------- | ---------- | --------------- | ----------------------- |
| Screen title   | `text-3xl` | ExtraBold (800) | "Seleccionar idioma"    |
| Question text  | `text-xl`  | Bold (700)      | "¿Cómo se dice 'gato'?" |
| Answer options | `text-lg`  | SemiBold (600)  | "cat"                   |
| Secondary text | `text-sm`  | Regular (400)   | "Principiante · A1"     |
| Score display  | `text-2xl` | ExtraBold (800) | "80/100"                |
| Button text    | `text-lg`  | Bold (700)      | "JUGAR"                 |

## Component Styles

### The "Box" Effect

Every card/tile in the app uses this base style for the elevated box look:

- **Base:** shadow on bottom (feels elevated)
- **Hover:** shadow grows, card lifts slightly (-translate-y-0.5)
- **Active:** shadow shrinks, card presses down (+translate-y-0.5)

### Tailwind Configuration

```ts
// tailwind.config.ts
{
  theme: {
    extend: {
      colors: {
        'pb-dark': '#080C08',
        'pb-green': '#56876D',
        'pb-emerald': '#04724D',
        'pb-amber': '#FFA42C',
        'pb-bg': '#F0F5F1',
        'pb-success': '#10B981',
        'pb-error': '#EF4444',
        'pb-text-light': '#6B7B71',
      },
      fontFamily: {
        sans: ['Nunito', 'system-ui', 'sans-serif'],
      },
      borderRadius: {
        'box': '12px',
        'box-lg': '16px',
      },
      boxShadow: {
        'box': '0 4px 0 0 rgba(8, 12, 8, 0.15), 0 2px 8px rgba(8, 12, 8, 0.08)',
        'box-hover': '0 6px 0 0 rgba(8, 12, 8, 0.15), 0 4px 12px rgba(8, 12, 8, 0.12)',
        'box-pressed': '0 2px 0 0 rgba(8, 12, 8, 0.15), 0 1px 4px rgba(8, 12, 8, 0.08)',
      },
    },
  },
}
```

## Button Variants

| Variant       | Background   | Text      | Usage                                       |
| ------------- | ------------ | --------- | ------------------------------------------- |
| **primary**   | `pb-amber`   | White     | Main CTA — "Jugar", "Siguiente"             |
| **secondary** | `pb-emerald` | White     | Important actions — "Tarjetas", "Comprobar" |
| **ghost**     | Transparent  | `pb-dark` | Back buttons, subtle actions                |
| **danger**    | `pb-error`   | White     | Destructive actions (if any)                |

All buttons include: `shadow-box`, `rounded-box`, hover lift, active press, `transition-all duration-150`.

Sizes: `sm` (py-2 px-4), `md` (py-3 px-6), `lg` (py-4 px-8, text-lg).

## Answer Card States

| State                | Background      | Text  | Icon | Animation                |
| -------------------- | --------------- | ----- | ---- | ------------------------ |
| **Default**          | White           | Dark  | —    | —                        |
| **Hover**            | White           | Dark  | —    | Lift up                  |
| **Selected Correct** | `pb-success`    | White | ✅   | Bounce (scale 1→1.05→1)  |
| **Selected Wrong**   | `pb-error`      | White | ❌   | Shake (x: 0→-6→6→-6→6→0) |
| **Revealed Correct** | `pb-success/80` | White | ✅   | Fade in                  |
| **Disabled**         | White           | Gray  | —    | opacity-50               |

## Animations (Framer Motion)

| Animation      | Trigger          | Properties                 | Duration   |
| -------------- | ---------------- | -------------------------- | ---------- |
| Page enter     | Route change     | `opacity: 0→1, y: 20→0`    | 250ms      |
| Page exit      | Route change     | `opacity: 1→0, y: 0→-20`   | 250ms      |
| Correct answer | Right selection  | `scale: 1→1.05→1`          | 300ms      |
| Wrong answer   | Wrong selection  | `x: 0, -6, 6, -6, 6, 0`    | 400ms      |
| Heart loss     | Life lost        | `scale: 1→0, opacity: 1→0` | 300ms      |
| Progress bar   | Question advance | `width: smooth transition` | 500ms      |
| Card flip      | Flashcard tap    | `rotateY: 0→180`           | 400ms      |
| Results stars  | Results shown    | Staggered scale-in         | 300ms each |

## Responsive Breakpoints

| Screen           | Width      | Layout Adjustments                     |
| ---------------- | ---------- | -------------------------------------- |
| **Small mobile** | < 375px    | Stack language cards vertically        |
| **Mobile**       | 375–640px  | Default layout, max-w-lg               |
| **Tablet**       | 640–1024px | Centered, larger cards                 |
| **Desktop**      | > 1024px   | Centered, max-w-lg, decorative margins |

**Critical mobile rules:**

- All touch targets: minimum 48px height
- Screen wrapper: `max-w-lg mx-auto px-4 py-6 min-h-screen`
- Answer cards: `min-h-[52px] w-full`
- Scenario grid: `grid-cols-2 gap-3`

## Design References

The `designs/` folder contains AI-generated screen mockups as visual inspiration:

- `splash_screen/` — Entry animation
- `main_menu/` — Home screen layout
- `game_screen/` — Gameplay layout
- `quiz_multiple_choice/` — Answer tiles
- `match_coincidencia/` — Image matching UI
- `listening_s_uchanie/` — Audio question UI
- `uzupe_nianie_luk_luki/` — Fill-in-the-blank
- `drag_drop_ordenar/` — Word ordering
- `scenario_selection/` — Scenario grid
- `modo_tarjetas_fiszki/` — Flashcard flip
- `pantalla_de_resultados_wyniki/` — Results screen
- `pantalla_de_ajustes_ustawienia/` — Settings

> **Note:** These mockups are for inspiration only. The mascot in the mockups is not our final mascot — we want a **cute, friendly cardboard box** character (more Duolingo-style). Generate assets in CSS/SVG, don't use external images.
