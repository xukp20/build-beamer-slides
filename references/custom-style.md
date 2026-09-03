# Custom Style Configuration

Use this workflow when the user wants a style other than the bundled default, supplies visual references, or asks to preserve a new reusable style.

## Sources of Style Intent

A user may define the style through any combination of:

- a verbal description of tone, audience, formality, density, and preferred visual character;
- an existing Beamer deck or template;
- screenshots, exported slides, a design system, or a brand guide;
- logos, fonts, icons, diagrams, color values, or other assets;
- explicit requests about title placement, page chrome, cards, imagery, diagrams, or animation.

Inspect the supplied material directly. Do not infer exact colors, fonts, or dimensions from memory when source files are available.

## Build a Style Contract

Before substantial slide implementation, record the active decisions in a compact deck-local note or in a reusable `STYLE.md`. Cover only what the deck needs:

1. **Identity and use case** — intended audience, tone, and presentation setting.
2. **Canvas and safe area** — aspect ratio, margins, title region, content region, and footer behavior.
3. **Palette** — semantic roles for title, body, muted text, lines, background, panels, and accents.
4. **Typography** — Latin and CJK fonts when applicable, size ranges, weight hierarchy, and leading.
5. **Page chrome** — title, page number, rules, logo, section markers, and cover treatment.
6. **Containers and spacing** — shapes, corners, borders, padding, title-to-body gaps, paragraph gaps, and separators.
7. **Diagram language** — node types, group fills, connector styles, arrowheads, edge labels, and status encoding.
8. **Images and data graphics** — cropping, framing, caption, legend, and illustration conventions.
9. **Density limits** — minimum readable text size and when content must be simplified or split.
10. **Review exceptions** — any intentional departure from common alignment or spacing, with a clear visual reason.

Resolve missing choices from the existing deck first. If there is no existing deck, use restrained, readable defaults for unspecified fields and state the meaningful assumptions when handing off the draft.

## Apply a One-Off Custom Style

- Keep the style contract with the deck rather than modifying this skill.
- Reuse project-local macros and assets.
- Apply the contract consistently across peer slides and shared components.
- Validate representative pages early: cover, ordinary content, dense content, diagram, and image-heavy layouts as applicable.

## Create a Reusable Style Package

Create a package only when the user explicitly asks to reuse the style later. Use a short lowercase hyphenated name:

```text
styles/<style-name>/
|-- STYLE.md
|-- template-169.tex          Optional but recommended
`-- assets/                   Optional, only for real reusable assets
```

The package must be self-contained and English-language:

- `STYLE.md` defines the style contract and explains when to use the package.
- The template demonstrates the contract without domain-specific content.
- Assets must have a clear role in generated slides; do not add decorative placeholders.
- Do not copy user logos, licensed fonts, or proprietary assets into a global package without explicit authorization.

Update the main skill's style routing only when the new package is meant to become discoverable as a standard choice. Do not make it the default unless the user explicitly requests that change.

## Validate a New Package

- Compile the template twice with its declared engine.
- Render it at `180–220 dpi` and inspect the title region, ordinary text, multiline text, cards, separators, and diagrams represented by the template.
- Confirm that required fonts and assets are either available or have documented fallbacks.
- Check all links from `STYLE.md` and remove unfinished placeholders.
- The package still follows [review-loop.md](review-loop.md) and the main skill's draft-ready gate.
