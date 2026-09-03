# Restrained Light Style

This is the default style package for `build-beamer-slides`. Use it when the user has not supplied an existing deck or requested another visual identity. Adapt exact dimensions to the deck, but preserve the visual relationships below.

The reusable starter is [template-169.tex](template-169.tex), and the shared macros are in [theme.tex](theme.tex).

## Identity

The style is formal, quiet, and information-first. It uses dark low-saturation text, pale surfaces, thin rules, restrained accents, and generous whitespace. It avoids saturated fills, strong gradients, deep shadows, decorative texture, and abrupt contrast.

## Canvas and Hierarchy

- Use a 16:9 canvas.
- Keep the outer safe area approximately `0.7–1.1 cm` from the page edge. Decorative rules may approach the safe-area boundary; text and meaningful graphics may not.
- Reserve a stable title band. A practical content start is around `1.3–1.5 cm` below the top edge, with the footer rule at least `0.4 cm` above the bottom edge.
- Give each slide one dominant reading path. Prefer left-to-right for processes and comparisons, top-to-bottom for explanation or progression.
- Use whitespace to separate semantic groups. Do not fill unused space merely to make the page look busy.

## Palette

| Role | Default |
| --- | --- |
| Primary / title | `#17324D` |
| Body text | `#3F4A54` |
| Muted text | `#78838D` |
| Rules / borders | `#C9D0D5` |
| Neutral panel | `#F4F6F7` |
| Soft blue | `#E9EFF3` |
| Soft green | `#EAF3EE` |
| Soft orange | `#F5EEE6` |
| Background | `#FFFFFF` |

Use pale blue, green, and orange to distinguish a small number of semantic groups. Do not encode meaning through color alone.

## Typography

The following ranges work well for a 16:9 Beamer page and should be calibrated against the actual font:

| Element | Typical size |
| --- | --- |
| Slide title | `15–18 pt` |
| Major panel title | `8–10 pt` |
| Card or subsection title | `7–9 pt` |
| Body text | `6.5–8.5 pt` |
| Labels and legends | `5.8–7 pt` |
| Page number | `8–10 pt` |

- Use a sans-serif family with a compatible CJK face when needed.
- Keep body leading around `1.2–1.35 ×` the font size. Dense CJK or mixed-language text usually needs more leading than short English labels.
- Set short slide prose and narrow text panels ragged-right. Do not fully justify them, and do not allow automatic hyphenation in headings.
- If a key word still cannot fit without a forced split, rewrite the text or reallocate width before reducing the font.
- Use bold for titles and short labels, not entire paragraphs.
- Avoid body text below `6.5 pt`. If it seems necessary, shorten the text, widen the region, change the layout, or split the slide first.
- Check actual rendered glyphs. A nominal size is not evidence that the text is readable or properly spaced.

## Containers and Text Spacing

- Use consistent horizontal inner padding of roughly `0.18–0.30 cm` and vertical padding of `0.14–0.24 cm` for compact cards. Increase it for larger panels.
- Leave visible clearance between the last baseline and the container bottom. A paragraph that technically fits but sits against the border is a layout failure.
- Place a card title and its description on separate lines when both are nontrivial. Do not force them onto one baseline to save height.
- A useful title-to-body gap is `0.12–0.24 cm`; a useful paragraph-to-paragraph gap is `0.18–0.32 cm`. Adjust for the font, but use the same value for peer cards.
- Separators need whitespace on both sides. Never let a title or paragraph touch, cross, or visually merge with a rule.
- Set `inner sep` deliberately for TikZ nodes. Default node padding often causes subtle title/body collisions or inconsistent alignment.
- Use fixed text widths for columns and repeated cards. Do not align content with manual spaces.
- Align related elements by a shared edge or baseline. Centering every item independently often creates a ragged page.

## Layout Patterns

- Use two columns for a primary visual plus explanation, with the visual receiving roughly `65–78%` of the width when it is the main evidence.
- Use three equal or near-equal columns only when the three objects carry comparable weight and similar text volume.
- Use horizontal rows when descriptions are longer than labels; CJK paragraphs generally wrap more cleanly in rows than in narrow columns.
- Keep repeated cards identical in padding, title position, body start, and row gap. Vary size only when the hierarchy is intentional and immediately visible.
- For a dense graph, let the graph dominate the page and move interpretation to a short caption or a separate slide.

## Diagrams, Images, and Graphs

- Use the shared [diagram guidance](../../references/diagram-design.md).
- Use pale, large-radius subsystem containers; white or lightly tinted rounded cards; and compact role tags inside agent or action cards. Keep group, card, and tag radii visibly distinct.
- Use `light/flow` for the primary path, `light/return` for callbacks or evidence returns, and `light/optional` for planned or conditional paths. Use `light/edge label` for a short inline knockout label and `light/adjacent label` beside a curved or descriptive path.
- Indicate the current graph state with a soft node fill, outline, or separated tag. Do not attach a dot to the node outline.
- Prefer PDF or SVG for diagrams and dependency graphs. Use raster images only when the source is raster or conversion is unreliable.
- Crop excessive whitespace before sizing an image.
- Preserve aspect ratio; never stretch a diagram to fill a box.
- Render raster assets at a resolution appropriate to their final size. A slide preview at `180–220 dpi` is a useful inspection baseline.
- If labels are not readable at presentation scale, simplify the graphic, enlarge it, or explicitly frame it as a scale overview rather than pretending it is readable detail.

## Validation

Follow the shared [render and review loop](../../references/review-loop.md) and [page audit checklist](../../references/page-audit-checklist.md). The light palette does not justify faint text, crowded cards, insufficient group padding, or unclear connector endpoints.
