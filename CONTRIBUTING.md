# Contributing to AVIL

Thank you for your interest! AVIL is an open research artifact, and contributions of every size are welcome — typo fixes, diagram improvements, bibliography additions, reference implementations, empirical evaluations, or critical pushback on the formal model.

We practice what we preach: **every change to this repo is itself an AVIL iteration.**

## How to Propose a Change

### 1. Open an issue first (for non-trivial changes)

If your change is larger than a typo fix, please open an issue using the relevant template so we can agree on scope before code moves. This prevents scope drift (cf. `α(I)` in the paper).

### 2. Fork, branch, and iterate

```bash
git checkout -b ix-short-description
```

Use a short iteration label (`i22`, `i23`, …) that continues the series in the paper header.

### 3. Frame your PR as an iteration

Open a PR with a description in this shape:

```markdown
### Iteration
- **ID:** I<n>
- **Title:** <concise title>
- **Type:** user_visible | structural
- **Ships:**
  - <artifact 1>
  - <artifact 2>
- **Out of scope:**
  - <explicit non-goals>
- **Acceptance criteria:**
  1. <checkable outcome 1>
  2. <checkable outcome 2>
- **Risks:** <what could go wrong, how it is mitigated>
```

This isn't bureaucracy — it's a 60-second contract that makes reviews fast and reversible.

### 4. Verify locally

Before pushing, rebuild the PDF and visually inspect the affected page(s):

```bash
tectonic -X compile avil.tex --outdir build
```

No new warnings should be introduced, and all cross-references should still resolve.

## What Makes a Good Contribution?

- **Thin vertical slices.** One idea per PR. If your change touches more than one section of the paper, consider splitting.
- **Explicit acceptance criteria.** "Fixes wording" is fine; "improves the paper" is not.
- **Out-of-scope declarations.** Tell reviewers what you are *not* changing.
- **Reproducibility.** If you add a graph or a number, include the data or the source.

## Style Guide

- **LaTeX:** 80-column soft wrap, two-space sentence breaks, one `\paragraph{}` per sub-idea.
- **Math:** prefer `\eqref{}` over hard-coded equation numbers.
- **Figures:** TikZ or pgfplots only — no external binary assets unless strictly necessary.
- **References:** add BibTeX entries to [`avil.bib`](avil.bib); use the existing key style (`authorYYYYtopic`).

## Areas Where Help is Especially Welcome

- **Reference implementation.** An open-source AVIL loop wrapping an existing coding agent.
- **Empirical evaluation.** Real SWE-bench-style results replacing the simulation in §13.
- **Formal extensions.** Non-stationary learning, adversarial multi-agent settings, richer internal models `M`.
- **Translations / accessibility.** Plain-language summaries, screen-reader-friendly figure alts.

## Code of Conduct

By participating, you agree to abide by our [Code of Conduct](CODE_OF_CONDUCT.md). Be kind. Disagree about ideas, not people.

## License

By contributing, you agree that your contributions will be licensed under the same [MIT License](LICENSE) that covers the rest of the project.
