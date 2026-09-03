<h1 align="center">Build Beamer Slides</h1>

<p align="center">
  <strong>English</strong> |
  <a href="README.zh-CN.md">简体中文</a>
</p>

<p align="center">
  <strong>Design, render, and inspect Beamer slides before human review.</strong>
</p>

<p align="center">
  <a href="SKILL.md">
    <img alt="Codex Skill" src="https://img.shields.io/badge/Codex-Skill-2563eb?style=flat-square">
  </a>
  <a href="https://www.latex-project.org/">
    <img alt="LaTeX Beamer" src="https://img.shields.io/badge/LaTeX-Beamer-365B73?style=flat-square">
  </a>
  <img alt="TikZ diagrams" src="https://img.shields.io/badge/diagrams-TikZ-5F7F73?style=flat-square">
  <img alt="Rendered review" src="https://img.shields.io/badge/review-rendered-6b4fbb?style=flat-square">
  <img alt="Status active" src="https://img.shields.io/badge/status-active-d97706?style=flat-square">
</p>

<p align="center">
  <a href="#examples">Examples</a>
  &middot;
  <a href="#what-the-skill-provides">Features</a>
  &middot;
  <a href="#install">Install</a>
  &middot;
  <a href="#review-workflow">Review</a>
  &middot;
  <a href="SKILL.md">Skill Reference</a>
</p>

`build-beamer-slides` is a Codex skill for designing, implementing, rendering, and reviewing Beamer presentations. It supports complete decks, selected groups of slides, and page-by-page collaboration.

The user controls the subject, narrative order, and emphasis. The skill handles page structure, Beamer implementation, diagram geometry, compilation, screenshot inspection, and repair of basic visual defects before human content review.

## Examples

### Technical systems and workflows

The system architecture example uses grouped subsystems, tagged cards, decisions, artifacts, optional inputs, and an external revision path.

![Complex system workflow](gallery/architecture-complex.png)

[Source](examples/research-system-architecture/deck.tex) | [PDF](examples/research-system-architecture/deck.pdf)

### Three included styles

| Restrained Light | Warm Editorial |
| --- | --- |
| ![Restrained Light graph slide](gallery/random-walk-light.png) | ![Warm Editorial graph slide](gallery/random-walk-warm.png) |

| Slate Violet cover | Slate Violet workflow |
| --- | --- |
| ![Slate Violet migration cover](gallery/slate-violet-cover.png) | ![Slate Violet component migration](gallery/slate-violet-migration.png) |

The first pair presents the same graph and transition rule in two styles. The Slate Violet example uses a separate technical palette and a denser workflow.

### Results and mathematical figures

| Experimental comparison | Bottleneck graph |
| --- | --- |
| ![Experimental results example](gallery/experiment.png) | ![Two-region bottleneck graph](gallery/random-walk-bottleneck.png) |

The experimental values are synthetic and exist only to demonstrate layout. The mathematical example includes graph diagrams, matrices, definitions, and directly labelled curves.

## What the skill provides

- a restrained light default style and two optional built-in styles;
- reusable Beamer templates, TikZ components, and worked source files;
- layout rules for titles, text, cards, diagrams, formulas, tables, and charts;
- explicit connector ports, routing corridors, group-boundary checks, and edge-label conventions;
- English, Chinese, and mixed-language slide-text guidance;
- a compile, render, inspect, and repair loop with 400 to 600 dpi local crops for dense geometry;
- a user-selected independent reviewer subagent for a stronger audit when the additional time and token cost is worthwhile;
- helper scripts that compile twice, reject relevant LaTeX diagnostics, render pages, and validate all bundled examples.

## Install

Clone the repository directly into the Codex skills directory:

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
git clone https://github.com/xukp20/build-beamer-slides.git \
  "${CODEX_HOME:-$HOME/.codex}/skills/build-beamer-slides"
```

Reload Codex after installation so the skill is discovered. Update an existing installation with `git pull --ff-only` from the cloned directory.

## Use

Name the skill directly:

> Use `$build-beamer-slides` to create a five-page technical presentation from these notes. Use the default light style and give me the editable source and PDF.

It also works with an existing deck or a single-page repair request:

> Use `$build-beamer-slides` to revise slides 4 to 6 of this Beamer deck. Preserve its current style and inspect every changed page.

> Use `$build-beamer-slides` to repair this workflow slide. Check every connector, container boundary, and multiline label at high resolution.

A custom request may supply a reference deck, screenshots, brand colors, fonts, a logo, or a project-local template. Custom styling does not remove the review and legibility requirements.

## Built-in styles

| Style | Intended use | Starter |
| --- | --- | --- |
| [Restrained Light](styles/light/STYLE.md) | Default technical and research presentations | [template](styles/light/template-169.tex) |
| [Warm Editorial](styles/warm-editorial/STYLE.md) | Mathematical exposition and academic talks with a warmer page | [template](styles/warm-editorial/template-169.tex) |
| [Slate Violet Light](styles/slate-violet/STYLE.md) | Architecture, migration, and planning decks that need a distinct light theme | [template](styles/slate-violet/template-169.tex) |

[Custom style configuration](references/custom-style.md) explains how to define a deck-local style or package a reusable one.

## Review workflow

Before slide production begins, the skill asks the user to choose between `self-review only` and `self-review + independent reviewer`. The author performs the complete self-review in both modes.

Every changed page follows the same authoring loop:

1. State the page's main message and choose a suitable visual form.
2. Draft concise text and assign explicit geometry to containers and diagrams.
3. Compile twice and reject relevant LaTeX errors and overfull boxes.
4. Render every changed page at 200 dpi and inspect the complete frame.
5. Render dense junctions, bends, labels, overlays, group entries, and outermost nodes at 400 to 600 dpi.
6. Repair the source, recompile, and repeat the affected checks.
7. Mark the artifacts ready for delivery or independent review only after the basic layout checks pass.

When independent review is enabled, a separate read-only reviewer inspects the current PDF, every full-page render in scope, and the required high-resolution crops. The reviewer reports findings to the author, the author repairs and re-renders the slides, and the same reviewer checks the updated artifacts. This continues until the reviewer returns `PASS` or identifies a decision that belongs to the user. When independent review is disabled, the author delivers after completing step 7.

The review covers text clearance, natural line breaks, card padding, title and separator spacing, connector endpoints, arrowhead alignment, route bends, chart labels, formula consistency, and agreement between text and graphics.

Detailed references:

- [page audit checklist](references/page-audit-checklist.md)
- [render and review loop](references/review-loop.md)
- [independent reviewer workflow](references/reviewer-workflow.md)
- [diagram design](references/diagram-design.md)
- [slide text](references/slide-text.md)

## Build and validation tools

The standard render helper requires XeLaTeX, `pdfinfo`, and `pdftoppm`:

```bash
scripts/render_and_check.sh examples/research-system-architecture/deck.tex /tmp/architecture-render
```

It compiles twice, checks the log, and renders the selected pages at 200 dpi. Screenshot inspection is still required.

Create a high-resolution crop for a dense region with:

```bash
scripts/render_pdf_crop.sh \
  examples/research-system-architecture/deck.pdf \
  3 /tmp/review/control 600 144 324 2736 672
```

Compile and render every bundled deck with:

```bash
scripts/validate_examples.sh /tmp/beamer-example-review
```

The built-in styles use fonts available through XeLaTeX. A custom style should document any additional font or asset requirements.

## Worked source files

| Example | Contents | Source | PDF |
| --- | --- | --- | --- |
| Research system architecture | Overview, dense workflow, ownership, and recovery | [TeX](examples/research-system-architecture/deck.tex) | [PDF](examples/research-system-architecture/deck.pdf) |
| Experimental results review | Metric cards, matrix, bars, scatter plot, and limitations | [TeX](examples/experimental-results-review/deck.tex) | [PDF](examples/experimental-results-review/deck.pdf) |
| Random walks on graphs | Definitions, graph states, matrices, bottleneck, and convergence | [TeX](examples/random-walks-on-graphs/deck.tex) | [PDF](examples/random-walks-on-graphs/deck.pdf) |
| Software system migration | Cover, layered architecture, gated workflow, risk matrix, and roadmap | [TeX](examples/software-system-migration/deck.tex) | [PDF](examples/software-system-migration/deck.pdf) |
| Same-content style comparison | One graph slide in Restrained Light and Warm Editorial | [Light](examples/style-comparison/light.tex) / [Warm](examples/style-comparison/warm.tex) | [Light](examples/style-comparison/light.pdf) / [Warm](examples/style-comparison/warm.pdf) |

The examples are tested references, not fixed narratives. Adapt their components to the target content and re-run the complete visual review after changing text or geometry.

## Repository layout

```text
.
├── README.md
├── README.zh-CN.md
├── SKILL.md
├── agents/
├── references/
├── scripts/
├── styles/
│   ├── light/
│   ├── warm-editorial/
│   └── slate-violet/
├── examples/
│   ├── research-system-architecture/
│   ├── experimental-results-review/
│   ├── random-walks-on-graphs/
│   ├── software-system-migration/
│   └── style-comparison/
├── gallery/
└── reviews/
```

## License

MIT. See [LICENSE](LICENSE).
