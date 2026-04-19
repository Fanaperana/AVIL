<div align="center">

# 🧭 AVIL — Adaptive Verified Iteration Loop

### *A Self-Improving Software Development Lifecycle for Agentic AI Systems*

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Paper](https://img.shields.io/badge/paper-PDF-c75725)](build/avil.pdf)
[![Made with LaTeX](https://img.shields.io/badge/made%20with-LaTeX-1b4787)](https://www.latex-project.org/)
[![Tectonic](https://img.shields.io/badge/compiler-tectonic-1b4787)](https://tectonic-typesetting.github.io/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-2e7d32.svg)](CONTRIBUTING.md)
[![Code of Conduct](https://img.shields.io/badge/Code%20of%20Conduct-2.1-ff69b4.svg)](CODE_OF_CONDUCT.md)

*Turn one-shot, hallucinated AI code into a verified, measured, self-improving lifecycle.*

[📄 Read the Paper](build/avil.pdf) · [🧩 The Model](#-the-formal-model-in-one-minute) · [🚀 Quick Start](#-quick-start) · [🤝 Contribute](CONTRIBUTING.md)

</div>

---

## ✨ Why AVIL?

LLM coding agents are powerful — and **brittle**. They silently regress, inflate scope, hallucinate APIs, and discard partial progress when a single step fails. The culprit isn't only model capacity; it's the **absence of a lifecycle** that forces each unit of work to be small, verified, scored, and fed back into the agent's own strategy.

**AVIL** (Adaptive Verified Iteration Loop) is that lifecycle.

It combines three classical ideas — **Agile iterations**, **Test-Driven Development**, and **Reinforcement Learning** — into a single, formal, verification-first control loop designed specifically for **agentic AI systems**. Every iteration is a thin vertical slice. Every slice is layered-verified. Every outcome is scored. Every score rewrites the agent's next move.

> **In one sentence:** *AVIL is a software development lifecycle where AI agents plan in typed iterations, verify in layered stacks, score their work quantitatively, and self-improve from their own history.*

---

## 🎯 What's in this Repository?

This repo contains the **full research paper** on AVIL — LaTeX source, BibTeX, and a publication-styled PDF you can hand to a teammate or drop into a reading group tomorrow.

| File | What it is |
|------|------------|
| [`avil.tex`](avil.tex) | Full LaTeX source — every section, diagram, algorithm |
| [`avil.bib`](avil.bib) | Bibliography (Agile, TDD, RL, agentic AI, formal methods) |
| [`build/avil.pdf`](build/avil.pdf) | **11-page publication-ready PDF** (arXiv-style) |
| [`CONTRIBUTING.md`](CONTRIBUTING.md) | How to propose changes via AVIL's own iteration style |
| [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md) | Contributor Covenant 2.1 |
| [`SECURITY.md`](SECURITY.md) | How to report issues privately |

---

## 🧠 The Big Idea

AVIL formalizes agentic software work as a **closed control loop** of seven components:

```
      ┌─────────┐     ┌─────────┐     ┌─────────┐     ┌─────────┐
      │ Planner │ ──► │Executor │ ──► │Verifier │ ──► │ Scorer  │
      └────▲────┘     └─────────┘     └─────────┘     └────┬────┘
           │                                               │ S(I)
           │ π                                             ▼
      ┌────┴────┐                                    ┌─────────┐
      │ Adapter │◄───────────────────── θ ──────────│ Learner │
      └─────────┘                                    └─────────┘
                       │                                │
                       └──── shared Memory: H, θ, π, M ─┘
```

- **Planner** produces typed iterations `I` under **Progressive Vertical Slicing (PVS)**
- **Executor** realizes the change set `Δ`
- **Verifier** runs a 5-layer stack: *syntactic · semantic · behavioral · contract · acceptance*
- **Scorer** reduces everything to a scalar `S(I)`
- **Learner** `L(H)` updates heuristics from history
- **Adapter** `A(M)` revises the planning strategy

→ See [`build/avil.pdf`](build/avil.pdf) Figure 1 for the real (color) version.

---

## 📐 The Formal Model in One Minute

**Iteration (Def. 3.1).** `I = ⟨id, τ, ships, oos, ac, ρ⟩` — a typed unit of work with explicit acceptance criteria and out-of-scope declarations.

**Scoring function.**

$$
S(I) \;=\; w_\sigma\sigma - w_\delta\phi(\delta) - w_\kappa\kappa + w_\alpha\alpha - w_\tau\psi(\tau/\tau^\star)
$$

Rewards success and scope adherence; penalizes defects with diminishing severity and time only beyond budget.

**Learning function.**

$$
\theta_{t+1} = L(H_t, \theta_t) = \theta_t + \eta\,\widehat{\nabla}_\theta\,\overline{S}(H_t)
$$

Stochastic ascent on the mean iteration score.

**Adaptation function.**

$$
\pi_{t+1} = A(M_t) = \arg\max_{\pi}\;\mathbb{E}[\,S(I) - \lambda\,\mathcal{C}(\pi)\,]
$$

Structural strategy revision with a complexity regularizer.

---

## 📊 Simulated Evaluation (n = 1000 tasks)

AVIL vs. Agile vs. TDD vs. naive one-shot AI generation:

| Regime | Defect rate ↓ | Efficiency ↑ | Traceability ↑ | Recovery ↑ |
|---|---|---|---|---|
| Naive AI generation | 7.8 ± 0.4 | 0.41 | 0.12 | 0.18 |
| Agile | 4.6 ± 0.3 | 0.58 | 0.47 | 0.44 |
| TDD | 3.9 ± 0.3 | 0.62 | 0.55 | 0.51 |
| **AVIL** | **2.3 ± 0.2** | **0.74** | **0.88** | **0.72** |

> *Simulated results exercise the formal model under controlled conditions; they are not empirical claims on real codebases. See §Limitations in the paper.*

---

## 🚀 Quick Start

### Read the paper
Just open [`build/avil.pdf`](build/avil.pdf).

### Build from source
You need either [Tectonic](https://tectonic-typesetting.github.io/) (recommended, zero-config) or a full TeX Live installation.

```bash
# with tectonic (auto-downloads any missing packages)
tectonic -X compile avil.tex --outdir build

# or with latexmk
latexmk -pdf -output-directory=build avil.tex
```

The result is `build/avil.pdf`.

---

## 🧩 Applying AVIL to Your Own Agent

AVIL is a **lifecycle**, not a library. To apply it to an existing coding agent:

1. **Define the iteration schema.** Every task produces an `Iteration` record with `ships`, `oos`, `acceptance criteria`, `risk`.
2. **Wire a verifier stack.** Start with lint + unit tests. Add behavioral / contract / acceptance layers as the project matures.
3. **Compute `S(I)` per iteration.** Begin with unit weights; tune later via `L(H)`.
4. **Log everything into `H`.** The history is the substrate for all learning and adaptation.
5. **Enforce PVS.** Reject iterations whose `ships` set is not a thin end-to-end vertical slice.
6. **Split on risk.** Use Algorithm 12.2 from the paper when `ρ(I) > ρ★`.

The paper gives you the math, the pseudocode, and the multi-agent extension. The rest is engineering.

---

## 🗺️ Iteration History (This Paper Was Built With AVIL)

This repository is itself a vertical-sliced artifact. Every section of the paper was shipped in a single, scoped iteration:

<details>
<summary><b>Click to expand the full iteration log</b></summary>

| ID | Title | Type |
|---|---|---|
| I1 | Paper skeleton | structural |
| I2 | Abstract + keywords | user_visible |
| I3 | Introduction | user_visible |
| I3a | Related Work | user_visible |
| I4 | Problem statement + terminology | user_visible |
| I5 | AVIL architecture | user_visible |
| I6 | Iteration model / PVS integration | user_visible |
| I7 | Verification system | user_visible |
| I8 | Scoring function `S(I)` | formal |
| I9 | Learning function `L(H)` | formal |
| I10 | Adaptation function `A(M)` | formal |
| I10a | Multi-agent extension | user_visible |
| I11 | Formal model | formal |
| I12 | Algorithms (pseudocode) | formal |
| I13 | Diagrams (TikZ) | user_visible |
| I14 | Simulated evaluation | user_visible |
| I15 | Discussion | user_visible |
| I16 | Limitations | user_visible |
| I17 | Future work | user_visible |
| I18 | Conclusion | user_visible |
| I19 | References (BibTeX) | structural |
| I20 | Formatting cleanup + first compile | structural |
| I21 | Visual polish (arXiv / HF look) | user_visible |

</details>

---

## 📚 Citation

If AVIL is useful in your research or agent design, please cite the paper:

```bibtex
@misc{avil2026,
  title        = {Adaptive Verified Iteration Loop ({AVIL}):
                  A Self-Improving Software Development Lifecycle
                  for Agentic {AI} Systems},
  author       = {Fanaperana},
  year         = {2026},
  howpublished = {\url{https://github.com/Fanaperana/AVIL}},
  note         = {Preprint}
}
```

---

## 🛠️ Tech Stack

- **LaTeX** (article class) — document source
- **TikZ + pgfplots** — diagrams and graphs
- **tcolorbox** — colored definition and abstract callouts
- **Tectonic** — zero-config compilation
- **BibTeX** (`plain` style) — references

---

## 🤝 Contributing

Contributions are very welcome — typo fixes, bibliography additions, new diagrams, empirical results, language translations, **or an open-source reference implementation of the AVIL loop**.

Please read [`CONTRIBUTING.md`](CONTRIBUTING.md) before opening a PR. Every change to this repo is itself an AVIL iteration: declare `ships`, declare `oos`, include acceptance criteria.

By participating, you agree to abide by our [Code of Conduct](CODE_OF_CONDUCT.md).

---

## 🔒 Security

Found a problem that shouldn't be public (e.g. a compiled-PDF exploit, a leaked credential in history)? See [`SECURITY.md`](SECURITY.md).

---

## ⭐ Support the Project

If AVIL sparks ideas for your own agent, **a star is the best thank-you** — it helps the work find other researchers and practitioners working on reliable agentic AI.

<p align="center">
  <a href="https://github.com/Fanaperana/AVIL/stargazers">
    <img src="https://img.shields.io/github/stars/Fanaperana/AVIL?style=social" alt="Star on GitHub"/>
  </a>
</p>

---

## 📜 License

Released under the [MIT License](LICENSE) — use it, remix it, publish on top of it. The paper itself is intended to be freely redistributable; attribution is appreciated.

---

<div align="center">

*Built iteration by iteration.* 🧭

</div>
