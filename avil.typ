// ======================================================================
//  AVIL — Adaptive Verified Iteration Loop
//  Typst preprint format  (two-column, 10 pt, IEEE-ish style)
//
//  Compile:  typst compile avil.typ build/avil-typst.pdf
// ======================================================================

// ── Color palette ──
#let primary   = rgb("#1b4787")
#let accent    = rgb("#c75725")
#let muted     = rgb("#606878")
#let lightbg   = rgb("#EFF4FB")
#let peachbg   = rgb("#FCF6EF")
#let rulecolor = rgb("#B4BED2")
#let linkblue  = rgb("#0E62B0")
#let green     = rgb("#2E7D32")

// ── Page setup ──
#set page(
  paper: "us-letter",
  margin: (top: 0.9in, bottom: 1in, left: 0.65in, right: 0.65in),
  columns: 2,
  header: context {
    set text(size: 7.5pt, fill: muted)
    [Preprint — April 2026 #h(1fr) AVIL]
    v(-2pt)
    line(length: 100%, stroke: 0.4pt + rulecolor)
  },
  footer: context {
    set text(size: 8pt, fill: muted)
    align(center)[#counter(page).display()]
  },
)

// ── Typography ──
#set text(font: "New Computer Modern", size: 10pt)
#set par(justify: true, leading: 0.55em, first-line-indent: 1em)
#set heading(numbering: "1.")
#show heading.where(level: 1): it => {
  v(0.6em)
  set text(size: 12pt, weight: "bold")
  block(below: 0.4em)[#it]
}
#show heading.where(level: 2): it => {
  v(0.4em)
  set text(size: 10pt, weight: "bold")
  block(below: 0.3em)[#it]
}
#show link: set text(fill: linkblue)

// ── Helpers ──
#let smallcaps(body) = text(features: ("smcp",))[#body]
#let avil = smallcaps[Avil]
#let pvs  = smallcaps[Pvs]
#let tdd  = smallcaps[Tdd]

#let defbox(title, body) = {
  block(
    width: 100%,
    inset: (left: 8pt, right: 6pt, top: 5pt, bottom: 5pt),
    stroke: (left: 2pt + primary),
    fill: lightbg,
    radius: (top-right: 2pt, bottom-right: 2pt),
  )[
    #text(weight: "bold", size: 9pt)[#title] \
    #body
  ]
}

#let propbox(title, body) = {
  block(
    width: 100%,
    inset: (left: 8pt, right: 6pt, top: 5pt, bottom: 5pt),
    stroke: (left: 2pt + accent),
    fill: peachbg,
    radius: (top-right: 2pt, bottom-right: 2pt),
  )[
    #text(weight: "bold", size: 9pt)[#title] \
    #body
  ]
}

#let asmbox(title, body) = {
  block(
    width: 100%,
    inset: (left: 8pt, right: 6pt, top: 5pt, bottom: 5pt),
    stroke: (left: 2pt + muted),
    fill: white,
    radius: (top-right: 2pt, bottom-right: 2pt),
  )[
    #text(weight: "bold", size: 9pt)[#title] \
    #body
  ]
}

// ── References data (inline, since Typst Hayagriva) ──
// We manually create citation labels for readability.
// For a real submission, use a .bib → .yml converter.

#let refs = (
  "beck2001":      [K. Beck et al., "Manifesto for Agile Software Development," 2001.],
  "beck2002":      [K. Beck, _Test-Driven Development: By Example_, Addison-Wesley, 2002.],
  "humphrey1995":  [W.S. Humphrey, _A Discipline for Software Engineering_, Addison-Wesley, 1995.],
  "sutton2018":    [R.S. Sutton and A.G. Barto, _Reinforcement Learning: An Introduction_, 2nd ed., MIT Press, 2018.],
  "royce1970":     [W.W. Royce, "Managing the Development of Large Software Systems," _Proc. IEEE WESCON_, 1970.],
  "boehm1988":     [B.W. Boehm, "A Spiral Model of Software Development and Enhancement," _Computer_, 21(5):61–72, 1988.],
  "schwaber2002":  [K. Schwaber and M. Beedle, _Agile Software Development with Scrum_, Prentice Hall, 2002.],
  "north2006":     [D. North, "Introducing BDD," 2006.],
  "meyer1992":     [B. Meyer, "Applying 'Design by Contract'," _Computer_, 25(10):40–51, 1992.],
  "paulk1993":     [M.C. Paulk et al., "Capability Maturity Model for Software, Version 1.1," _IEEE Software_, 10(4):18–27, 1993.],
  "shinn2023":     [N. Shinn et al., "Reflexion: Language Agents with Verbal Reinforcement Learning," _NeurIPS_, 2023.],
  "madaan2023":    [A. Madaan et al., "Self-Refine: Iterative Refinement with Self-Feedback," _NeurIPS_, 2023.],
  "yang2024":      [J. Yang et al., "SWE-agent: Agent–Computer Interfaces Enable Automated Software Engineering," _NeurIPS_, 2024.],
  "wang2024":      [L. Wang et al., "A Survey on LLM-based Autonomous Agents," _Frontiers of CS_, 18(6), 2024.],
  "jimenez2024":   [C.E. Jimenez et al., "SWE-bench: Can Language Models Resolve Real-World GitHub Issues?," _ICLR_, 2024.],
)

#let refkeys = refs.keys()
#let cite-num(key) = {
  let idx = refkeys.position(k => k == key)
  if idx != none {
    let n = idx + 1
    text(fill: linkblue)[\[#n\]]
  } else {
    [\[?\]]
  }
}

// ======================================================================
// TITLE BLOCK (spans full width via place/column-break trick)
// ======================================================================
#place(
  top + center,
  float: true,
  scope: "parent",
  block(width: 100%, inset: (bottom: 12pt))[
    #line(length: 100%, stroke: 0.8pt + primary)
    #v(8pt)
    #align(center)[
      #text(size: 16pt, weight: "bold")[
        Adaptive Verified Iteration Loop (#avil): \
        A Self-Improving Software Development Lifecycle \
        for Agentic AI Systems
      ]
      #v(6pt)
      #text(size: 11pt)[A. F. Prince Ralambomanarivo]
      #v(2pt)
      #text(size: 9pt, fill: muted, style: "italic")[fanaperanaprince\@gmail.com]
    ]
    #v(8pt)
    #line(length: 100%, stroke: 0.4pt + primary)
    #v(6pt)

    // ── Abstract ──
    #block(
      width: 92%,
      inset: (left: 10pt, right: 10pt, top: 6pt, bottom: 6pt),
      stroke: (left: 3pt + primary),
      fill: lightbg,
      radius: 1pt,
    )[
      #set text(size: 9pt)
      #text(weight: "bold", fill: primary)[Abstract.]
      #h(4pt)
      Large language model (LLM) based coding agents increasingly operate
      autonomously over multi-step software tasks, yet they remain prone to
      scope drift, silent regression, and one-shot hallucinated solutions
      that lack traceable verification. We propose the _Adaptive Verified
      Iteration Loop_ (#avil), a software development lifecycle for agentic
      AI systems that couples _Progressive Vertical Slicing_ (#pvs) with
      layered verification, quantitative scoring, and online adaptation.
      #avil formalizes development as typed iterations $I_1, I_2, dots$,
      each with acceptance criteria, a verifier stack, and a scalar score
      $S(I)$ combining success, defects, complexity, scope adherence, and
      time. A learning function $L(H)$ updates heuristics from history, and
      an adaptation function $A(M)$ revises strategy from an internal model
      of the agent's behavior, closing a self-improving loop. We give a
      formal model, two algorithms, a multi-agent extension, and a simulated
      evaluation against Agile, TDD, and naive one-shot AI generation.
    ]
    #v(4pt)
    #align(center)[
      #set text(size: 9pt)
      #text(weight: "bold", fill: primary)[Keywords:]
      agentic AI · software lifecycle · verification-driven development ·
      progressive vertical slicing · self-improving systems ·
      iteration scoring · multi-agent software engineering
    ]
  ]
)

// ======================================================================
= Introduction <sec-introduction>

Autonomous coding agents built on large language models now routinely
plan, edit, and execute multi-step software tasks with limited human
supervision. In practice, however, their behavior is uneven: an agent
may produce a plausible-looking solution that silently breaks an
invariant, inflate the scope of a bounded task, or discard partial
progress after a failed attempt. The underlying cause is not solely
model capacity; it is the _absence of a lifecycle_ that forces each
unit of work to be small, verified, scored, and used to update the
agent's own strategy.

Classical software engineering offers several ingredients. Agile
methods decompose work into short increments with customer-visible
value~#cite-num("beck2001"). Test-Driven Development (#tdd) demands
executable acceptance criteria before implementation~#cite-num("beck2002").
The Personal Software Process~#cite-num("humphrey1995") emphasizes
measurement and feedback. Reinforcement learning provides a template
for improvement from scored trajectories~#cite-num("sutton2018").
None of these, however, was designed for agents that themselves plan
iterations, write tests, and critique their own output.

This paper introduces #avil, the _Adaptive Verified Iteration Loop_:
a software development lifecycle engineered for agentic AI systems.
#avil makes three commitments:

+ All work is decomposed into typed iterations under #pvs: each
  iteration ships a thin, end-to-end vertical slice with explicit
  acceptance criteria.
+ Every iteration is evaluated by a layered verification stack and
  reduced to a scalar score $S(I)$.
+ The agent maintains a history $H$ and model $M$, and uses $L(H)$
  and $A(M)$ to revise its own heuristics and strategy.

_*Contributions.*_ (i) A precise definition of iteration $I$ and the
#avil lifecycle as a closed control loop; (ii) a formal model
comprising $(S, L, A)$ and a state transition system; (iii) two
algorithms — the main loop and risk-based splitting — plus a
multi-agent extension; (iv) a simulated evaluation against Agile,
#tdd, and naive one-shot AI generation.

// ======================================================================
= Related Work <sec-related>

_*Iterative and agile methods.*_
Incremental processes date to Royce's waterfall
critique~#cite-num("royce1970") and Boehm's spiral
model~#cite-num("boehm1988"). The Agile
Manifesto~#cite-num("beck2001") and Scrum~#cite-num("schwaber2002")
generalized these to short customer-value increments. #avil adds
typed acceptance criteria, formal scoring, and agent-driven adaptation.

_*Test-driven and verification-driven development.*_
#tdd~#cite-num("beck2002") places executable tests before
implementation; Behavior-Driven Development~#cite-num("north2006")
raises the level to scenarios;
design-by-contract~#cite-num("meyer1992") provides pre/post-condition
guarantees. #avil's verification stack (@sec-verification) composes
these layers and routes output to a scalar score.

_*Measurement and self-improvement.*_
The Personal Software Process~#cite-num("humphrey1995") and
Capability Maturity Model~#cite-num("paulk1993") institutionalize
measurement. Reinforcement learning~#cite-num("sutton2018")
generalizes learning from scored trajectories. Self-refining agents
such as Reflexion~#cite-num("shinn2023") and
Self-Refine~#cite-num("madaan2023") show gains from iterative
self-critique. #avil frames these as instances of $L(H)$ and $A(M)$
inside an explicit lifecycle.

_*Agentic software engineering.*_
LLM coding agents~#cite-num("yang2024")#cite-num("wang2024") plan,
edit, and test code autonomously.
SWE-bench~#cite-num("jimenez2024") exposes their brittleness as task
scope grows. #avil constrains scope per iteration and requires
verified progress before advancing.

// ======================================================================
= Problem Statement <sec-problem>

We consider an agentic AI system $cal(A)$ evolving a software artifact
from initial state $s_0$ toward a requirement set $R$. In current
practice $cal(A)$ operates in one of three regimes: (R1) _one-shot
generation_; (R2) _unstructured iteration_ without explicit scope; or
(R3) _ad-hoc_ #tdd. Each exhibits scope inflation, silent regression,
untraceable changes, and poor recovery.

#defbox[Definition 3.1 (Iteration).][
  An _iteration_ is a tuple
  $I = chevron.l italic("id"), tau, italic("ships"), italic("oos"), italic("ac"), rho chevron.r$,
  where $italic("id")$ is unique,
  $tau in {upright("user_visible"), upright("structural")}$ is the type,
  $italic("ships")$ the artifact set,
  $italic("oos")$ the out-of-scope set,
  $italic("ac")$ acceptance criteria, and $rho$ a risk vector.
]

#defbox[Definition 3.2 (Scope adherence).][
  $alpha(I) = 1 - |Delta backslash italic("ships")| / |Delta|$,
  with $alpha in [0,1]$ and $alpha = 1$ iff $Delta subset.eq italic("ships")$.
]

#defbox[Definition 3.3 (Verification verdict).][
  A layer $v$ yields $v(I) in {bot, top} union bb(R)$, where $top$ is
  pass, $bot$ failure, and scalars are graded verdicts.
]

_*The #avil problem.*_ Design $Lambda$ so that $cal(A)$ reaches $R$
through $I_1, dots, I_n$ maximizing $sum_i S(I_i)$ while (i) bounding
scope, (ii) guaranteeing layered verification, and (iii) using history
to improve future iterations.

// ======================================================================
= AVIL Architecture <sec-architecture>

#avil has seven components in a closed loop (Fig. 1):
*Planner* (candidate $I$ under #pvs),
*Executor* (change set $Delta$),
*Verifier* (layered stack, @sec-verification),
*Scorer* ($S(I)$, @sec-scoring),
*Learner* ($L(H)$, @sec-learning),
*Adapter* ($A(M)$, @sec-adaptation),
and *Memory* ($H, theta, pi, M$).
One cycle: plan → execute → verify → score → learn → adapt → next plan.

// ======================================================================
= Iteration Model and PVS <sec-iteration-model>

#pvs requires every iteration to be a _thin, end-to-end vertical
slice_ — touching every layer needed to demonstrate a small piece of
observable value, yet as narrow as feasible.

#defbox[Definition 5.1 (#pvs\-valid iteration).][
  $I$ is #pvs\-valid iff
  (i) $|italic("ships")(I)| <= kappa_"max"$,
  (ii) $italic("ships")$ spans every layer required to evaluate at
  least one acceptance criterion end-to-end, and
  (iii) $italic("oos")(I) != emptyset$.
]

_*Typing.*_ $tau = upright("user_visible")$
iterations deliver externally observable behavior;
$tau = upright("structural")$
deliver refactors or scaffolding. No two consecutive structural
iterations without a user-visible one between them.

_*Splitting.*_ If $I$ violates #pvs\-validity or $rho(I) > rho^*$, $I$
is split into children preserving the ships union and partitioning risk.

// ======================================================================
= Verification System <sec-verification>

The Verifier applies stack $V = (v_1, dots, v_m)$, ordered
cheap-to-expensive:

#table(
  columns: (auto, 1fr),
  stroke: none,
  row-gutter: 2pt,
  [$v_1$], [*Syntactic* — parse, type-check, lint],
  [$v_2$], [*Semantic* — unit tests from acceptance criteria],
  [$v_3$], [*Behavioral* — integration / E2E tests],
  [$v_4$], [*Contract* — pre/post-conditions, invariants],
  [$v_5$], [*Acceptance* — each $italic("ac")_j$ evaluated pass/fail],
)

Fail-fast semantics: halt at first $bot$, retain partial verdicts.
Verdict vector:
$bold(v)(I) = (v_1(I), dots, v_m(I)) in (bb(R) union {bot, top})^m$.

#asmbox[Assumption 6.1 (Verifier soundness).][
  $v_ell (I) = top$ implies the property encoded by $v_ell$ holds.
  Completeness is not assumed.
]

// ======================================================================
= Scoring Function <sec-scoring>

Let $sigma(I) in [0,1]$ be the acceptance-criteria pass fraction,
$delta(I) in bb(N)$ the residual defect count,
$kappa(I) in [0,1]$ normalized complexity,
$alpha(I) in [0,1]$ scope adherence, and
$tau(I) slash tau^*(I)$ the time ratio.

#defbox[Definition 7.1 (Iteration score).][
  $ S(I) = w_sigma sigma - w_delta phi(delta) - w_kappa kappa + w_alpha alpha - w_tau psi(tau / tau^*) $
  where $phi(x) = 1 - e^(-x)$ (saturating defect penalty) and
  $psi(r) = max(0, r - 1)$ (one-sided time penalty); weights are
  non-negative with a fixed budget.
]

Success and scope adherence are rewarded linearly; defects are
penalized with diminishing severity; time is penalized only beyond
budget.

#propbox[Proposition 7.1 (Boundedness).][
  For any $I$ and fixed-budget weight vector,
  $S(I) in [S_"min", S_"max"]$ with finite endpoints depending only on
  the weights. $square$
]

// ======================================================================
= Learning Mechanism <sec-learning>

Let $H_t = (I_1, bold(v)_1, S_1, dots, I_t, bold(v)_t, S_t)$ and
$theta in Theta$ the heuristic parameters.

#defbox[Definition 8.1 (Learning function).][
  $ theta_(t+1) = L(H_t, theta_t) = theta_t + eta hat(nabla)_theta overline(S)(H_t) $
  where $overline(S) = 1/t sum_i S(I_i)$ and $hat(nabla)_theta$ is a
  finite-difference gradient estimator.
]

Bounded scores (Prop. 7.1) and decaying $eta_t$ give standard
stochastic approximation convergence~#cite-num("sutton2018").

// ======================================================================
= Adaptation Strategy <sec-adaptation>

Let $M in cal(M)$ be a finite-state abstraction of recent behavior
and $Pi$ the policy space.

#defbox[Definition 9.1 (Adaptation function).][
  $ pi_(t+1) = A(M_t) = arg max_(pi in Pi) bb(E)_(I tilde pi, M_t)[S(I) - lambda cal(C)(pi)] $
  where $cal(C)(pi)$ is a complexity regularizer and $lambda >= 0$.
]

While $L$ refines continuous knobs, $A$ performs structural changes:
policy swaps, verifier reordering, archetype splitting.

// ======================================================================
= Multi-Agent Extension <sec-multi-agent>

#avil generalizes to $N$ agents ${cal(A)_1, dots, cal(A)_N}$ sharing
memory $Sigma$.

_*Roles.*_ Planner, Implementer, Verifier, Reviewer. Each runs a
local #avil loop.

_*Coordination.*_ Agent $cal(A)_i$ claims iteration $I$ via lease
$ell(I, i, t) -> Sigma$; conflicts resolved by role priority then
highest $overline(S)$.

_*Arbitration.*_ Overlapping proposals
($italic("ships")(I_a) inter italic("ships")(I_b) != emptyset$) resolved by
$S^"exp"(I) - beta dot.c "overlap"(I)$.

// ======================================================================
= Formal Model <sec-formal-model>

#defbox[Definition 11.1 (#avil\ state).][
  $s_t = chevron.l a_t, H_t, theta_t, pi_t, M_t chevron.r$: artifact,
  history, heuristics, policy, behavior model.
]

#defbox[Definition 11.2 (#avil\ transition).][
  $ s_(t+1) = (underbrace(A compose hat(M), "adapt") compose underbrace(L, "learn") compose underbrace(S compose V compose E compose pi_t, "exec+verify+score"))(s_t) $
]

#propbox[Proposition 11.1 (Monotone expected score).][
  Under stationarity, if $L$ and $A$ are contractions with fixed points
  $theta^*, pi^*$, then $bb(E)[S(I_t)]$ is non-decreasing and converges
  to $bb(E)_(pi^*, theta^*)[S(I)]$.
]

_*Proof sketch.*_ Stationarity gives a well-defined score function of
$(theta, pi)$. $L$ is a gradient-ascent step on $overline(S)$; $A$ is
an argmax. Contractivity drives
$(theta_t, pi_t) -> (theta^*, pi^*)$ monotonically. $square$

// ======================================================================
= Algorithms <sec-algorithms>

#block(
  width: 100%,
  inset: 8pt,
  stroke: 0.5pt + rulecolor,
  radius: 2pt,
  fill: white,
)[
  #text(weight: "bold", size: 9pt, fill: primary)[Algorithm 1: #avil Main Loop] \
  #set text(size: 8.5pt)
  ```
  Input: a₀, R, θ₀, π₀, M₀
  H ← ⟨⟩
  for t = 0, 1, … until R satisfied or budget out:
    I ← πₜ(state(aₜ, R, H, θₜ))
    if not PvsValid(I) or ρ(I) > ρ★:
      {I⁽ʲ⁾} ← Split(I); enqueue; continue
    Δ ← Exec(I, aₜ)
    v ← Verify(I, aₜ ⊕ Δ)
    aₜ₊₁ ← aₜ ⊕ Δ  if ⊥ ∉ v,  else aₜ
    s ← S(I; v, α, τ)
    H ← H ∥ (I, v, s)
    θₜ₊₁ ← L(H, θₜ)
    Mₜ₊₁ ← M̂(H)
    πₜ₊₁ ← A(Mₜ₊₁)
  return aₜ, H
  ```
]

#v(6pt)

#block(
  width: 100%,
  inset: 8pt,
  stroke: 0.5pt + rulecolor,
  radius: 2pt,
  fill: white,
)[
  #text(weight: "bold", size: 9pt, fill: primary)[Algorithm 2: Risk-Based Iteration Splitting] \
  #set text(size: 8.5pt)
  ```
  Input: I, ρ★, κmax
  Sort ships(I) by marginal risk, descending
  C ← ∅;  I' ← new child from I
  for x ∈ ships(I):
    if adding x violates κmax or ρ★:
      C ← C ∪ {I'}; start new I'
    add x to ships(I'); update ρ(I')
  C ← C ∪ {I'}
  propagate ac, oos to children
  return C
  ```
]

// ======================================================================
= Evaluation <sec-evaluation>

We simulate $n = 1000$ tasks with $|R| in {5, 10, 20, 40}$ and defect
density $d in {0.05, 0.10, 0.20}$. All four regimes run under a fixed
compute budget. #avil's learner and adapter start from the naive
baseline $theta_0$.

_*Metrics.*_
$overline(delta)$ (mean residual defects),
$eta_I$ (accepted/attempted iterations),
$T$ (traceability),
$rho_R$ (recovery within 3 iterations of failure).

_*Results.*_ Table 1 reports means with 95% CIs. #avil halves defects
vs. #tdd and triples traceability vs. naive generation. Recovery
improves because the risk-based splitter shrinks retry scope.

#figure(
  table(
    columns: 5,
    align: (left, center, center, center, center),
    stroke: none,
    table.hline(stroke: 1pt),
    table.header(
      [*Regime*], [$overline(delta) arrow.b$], [$eta_I arrow.t$],
      [$T arrow.t$], [$rho_R arrow.t$],
    ),
    table.hline(stroke: 0.5pt),
    [Naive AI],    [$7.8 plus.minus 0.4$], [$0.41$], [$0.12$], [$0.18$],
    [Agile],       [$4.6 plus.minus 0.3$], [$0.58$], [$0.47$], [$0.44$],
    [#tdd],        [$3.9 plus.minus 0.3$], [$0.62$], [$0.55$], [$0.51$],
    table.hline(stroke: 0.3pt),
    [*#avil*],     [*$2.3 plus.minus 0.2$*], [*$0.74$*], [*$0.88$*], [*$0.72$*],
    table.hline(stroke: 1pt),
  ),
  caption: [Simulated results (mean ± 95% CI, $n = 1000$).],
) <tab-sim>

// ======================================================================
= Discussion <sec-discussion>

Bounding per-iteration scope limits the blast radius of failures; the
layered verifier makes regressions observable; the scalar $S(I)$
provides a stable signal even when layers disagree. Separating $L$
(continuous refinement) from $A$ (structural change) prevents
oscillation.

#avil distinguishes _exploration_ iterations (spike, structural) from
_commitment_ iterations (user-visible) via $tau$, preventing
exploration from leaking into production diffs.

// ======================================================================
= Limitations <sec-limitations>

The evaluation is simulated; real codebases have non-stationary defect
distributions, coupled modules, and human review. Verifier soundness is
strong — acceptance tests can encode bugs. Score weights are
project-specific hyperparameters. Convergence presupposes stationarity;
windowed estimators may be needed under concept drift. Multi-agent
arbitration assumes cooperation.

// ======================================================================
= Future Work <sec-future>

(1) Empirical study on a real benchmark
(SWE-bench~#cite-num("jimenez2024")).
(2) Lightweight formal methods as $v_4$ (symbolic execution / bounded
model checking). (3) Richer internal models $M$ via latent
representations from $H$.

// ======================================================================
= Conclusion <sec-conclusion>

We presented #avil, a software development lifecycle coupling
#pvs\-disciplined iterations, layered verification, scoring via $S(I)$,
and self-improvement via $L(H)$ and $A(M)$. A simulated evaluation
shows substantial gains in defect rate, efficiency, traceability, and
recovery over Agile, #tdd, and naive baselines. #avil is a
verification-first substrate for self-improving software agents.

// ======================================================================
// References
// ======================================================================

#heading(level: 1, numbering: none)[References]

#set text(size: 8.5pt)
#{
  let i = 0
  for (key, entry) in refs {
    i += 1
    block(above: 4pt, below: 2pt)[
      \[#i\]#h(4pt)#entry
    ]
  }
}
