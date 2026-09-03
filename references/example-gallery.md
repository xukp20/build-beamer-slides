# Worked Examples

Read this reference when a user wants a complete example, when a new deck needs a tested layout pattern, or when a style or review change should be forward-tested against realistic slides. Treat the examples as design references, not as required deck narratives.

## Research System Architecture

Source: [examples/research-system-architecture/deck.tex](../examples/research-system-architecture/deck.tex)

Use it to inspect:

- a restrained-light cover and a six-slide visual sequence;
- a system overview with a main path and a separate feedback corridor;
- rounded action cards with internal role tags, explicit connection ports, and distinct primary/return paths;
- both inline knockout labels on open straight segments and adjacent labels beside descriptive paths;
- a dense multi-path stress page with two groups, three agent cards, a decision, an artifact cylinder, an optional input, a checkpoint, and an external retry loop;
- layer ownership, repeated agents, and recovery-state diagrams;
- visual consistency between overview, detail, and review-summary pages.

## Experimental Results Review

Source: [examples/experimental-results-review/deck.tex](../examples/experimental-results-review/deck.tex)

Use it to inspect:

- research question and metric cards;
- a compact experimental matrix;
- manually drawn bar and scatter plots with direct labels;
- separation of observations, interpretation, limitations, and next tests.

All values in this deck are explicitly synthetic. Reuse its layout patterns, not its findings.

## Random Walks on Graphs

Source: [examples/random-walks-on-graphs/deck.tex](../examples/random-walks-on-graphs/deck.tex)

Use it to inspect:

- the optional Warm Editorial style;
- graph drawings, mathematical definitions, matrices, and schematic curves;
- a two-region bottleneck graph with highlighted movement and a directly labelled multi-series convergence chart;
- a current-state node encoded by fill, outline, and a separated tag rather than a border marker;
- a curved movement arrow that starts and ends at explicit node anchors, with its description placed beside the path;
- serif display hierarchy with sans-serif explanations;
- Pagella text and math fonts used as one coordinated mathematical type system;
- a mathematical narrative that separates formal rules, consequences, and assumptions.

## Same-Content Style Comparison

Sources:

- [restrained light](../examples/style-comparison/light.tex)
- [warm editorial](../examples/style-comparison/warm.tex)

The two one-slide decks communicate the same graph and transition rule. Compare them when evaluating whether a style package changes visual identity while preserving content hierarchy, safe areas, legibility, and the review gate.

## Software System Migration

Source: [examples/software-system-migration/deck.tex](../examples/software-system-migration/deck.tex)

Use it to inspect:

- the optional Slate Violet Light style on a five-slide technical narrative;
- a restrained cover, layered target architecture, qualitative risk matrix, and gated roadmap;
- a dense component-migration workflow with more than six nodes, role tags, a decision, optional policy input, artifact cylinders, an inline knockout label, and an adjacent return-path label;
- midpoint ports, an outer revision corridor, small consistent arrowheads, and high-resolution connector review targets;
- concise architecture and migration language without generic claims or decorative closing statements.

## Reuse Boundaries

- Copy geometry or macros only after checking the target deck's canvas, fonts, and actual text length.
- Do not copy coordinates blindly when labels, formulas, or language change.
- Re-run the full compile, render, and screenshot review after adapting any example.
- Verify semantic consistency across diagrams, formulas, tables, labels, and explanatory prose. A visually clean slide can still be factually inconsistent.
