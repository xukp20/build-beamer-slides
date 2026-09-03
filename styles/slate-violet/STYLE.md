# Slate Violet Light Style

Use this optional style when a technical, architectural, or planning deck needs a light visual system that is distinct from the default blue without becoming decorative. It keeps the same restrained hierarchy and review requirements as the default style, but uses a low-saturation slate-violet primary color.

The reusable starter is [template-169.tex](template-169.tex), and the shared macros are in [theme.tex](theme.tex).

## Identity

The style is formal, calm, and suited to software systems, research infrastructure, migration plans, and design reviews. Violet is used for hierarchy rather than ornament. Pale lavender, sage, and sand distinguish a small number of semantic roles.

## Canvas and Page Chrome

- Use a 16:9 white canvas.
- Keep meaningful content approximately `0.75–1.05 cm` from the page edge.
- Use the standard title band with a thin neutral rule and a short violet rule.
- Keep section labels and page numbers quiet; they should not compete with the title.
- Covers may use one narrow violet bar and one pale geometric field. Avoid full-page saturated color.

## Palette

| Role | Value |
| --- | --- |
| Primary / title | `#4F496B` |
| Body text | `#44464F` |
| Muted text | `#7D7D89` |
| Rules / borders | `#D0CED8` |
| Neutral panel | `#F5F4F7` |
| Pale lavender | `#EEEBF4` |
| Pale sage | `#EAF1ED` |
| Pale sand | `#F4EEE6` |
| Background | `#FFFFFF` |
| Primary connector | `#5C5872` |
| Return connector | `#738F84` |
| Optional connector | `#92909A` |

Do not use color alone to distinguish a decision, state, or connector class. Pair color with shape, labels, or line style.

## Typography

- Use TeX Gyre Heros for Latin text, with a compatible CJK sans-serif face when needed.
- Use sentence case for titles and headings.
- Use `15–18 pt` slide titles, `7–9 pt` panel titles, `6.5–8.5 pt` body text, and `5.6–7 pt` labels.
- Keep prose ragged-right with natural word spacing. Do not justify narrow columns.
- Use bold for titles and compact labels only.

## Containers and Diagrams

- Use pale, large-radius group containers; white or softly tinted rounded action cards; compact capsule tags; diamonds only for real decisions; cylinders for stored evidence; and low-height capsules for terminal states.
- Use the same explicit midpoint-port and routing-corridor rules as the shared diagram guide.
- Use `slate/flow` for primary progress, `slate/return` for revision or evidence returns, `slate/optional` for optional inputs, and `slate/evidence` for artifact production.
- Use inline knockout labels only on isolated straight segments. Place longer route descriptions beside an open segment.
- Keep card padding between roughly `0.18–0.28 cm`, with a visible title-to-body gap and bottom clearance.

## Density and Validation

- Keep body text at or above `6.5 pt` unless a clearly documented exception is unavoidable.
- Split content before shrinking a dense diagram until its labels become nominal.
- Compile twice and inspect every changed page at `180–220 dpi`.
- For complex workflows, inspect `400–600 dpi` crops of decision ports, return-loop bends, inline labels, multi-connector areas, group-boundary entries, and tightly placed outermost nodes.
- Apply the shared review loop and page audit checklist without exceptions.
