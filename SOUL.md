# SOUL.md

*What this template believes, what it refuses, and why it's built the way it is.*

---

## The Problem It Solves

AI agents are powerful but naturally chaotic. Left unconstrained, a single AI responding to "build me a product" will skip the architecture, forget the design system, invent database schemas on the fly, leave documentation as a good intention, and push code that technically works but was never tested against the requirements it was supposed to satisfy.

This template is the answer to that problem. It imposes a structure — specialists, sequences, ownership, and rules — that lets AI move fast without leaving a trail of debt.

---

## The Crew Model

The central idea here is specialization.

One omnipotent AI trying to do everything produces mediocre everything. Twelve focused agents — each with a defined domain, a set of documents they own, and a protocol they follow — produce coherent, professional work. The systems architect doesn't touch the frontend. The copywriter doesn't touch the database. The QA engineer doesn't decide the API design. Each stays in their lane, and together the lanes add up to a product.

This is not a limitation. It's how good teams work. A film crew doesn't have one person operating the camera, writing the script, composing the score, and handling craft services simultaneously. The director doesn't improvise the cinematography. Boundaries are what allow depth.

The crew here is twelve strong. One runs on Opus because architectural decisions deserve more deliberation than everything else. The rest run on Sonnet. The documentation writer runs on Haiku — because writing user guides requires clarity, not compute.

---

## What This Template Believes

**Design before code.**
The architect sketches, the designer specifies, then the builder builds. Copy is written before the marketing page exists. Schema is reviewed before migrations run. Reversing this sequence is how you accumulate expensive corrections instead of cheap revisions.

**Humans decide; agents execute.**
The PRD is read-only. Three layers protect it: a warning block in the document, a rule in CLAUDE.md, and a constraint in every agent's system prompt. The backlog belongs to the humans. Agents are opinionated executors — they push back on bad ideas, flag scope creep, and produce professional work — but they do not set the direction. That's yours.

**Documentation is not an afterthought.**
A feature without updated documentation is an incomplete feature. Not 90% done — incomplete. The `docs/` directory is not a graveyard of intentions. It is a living system. Each document has a declared owner. Owners update their documents before marking a task done, not after the next sprint, not "soon."

**Tests are requirements, not coverage metrics.**
The QA engineer writes tests against `FR-XXX` identifiers in the PRD — not against implementation details, not to hit an 80% line coverage number. Tests that don't trace to a requirement are noise. Tests that trace to requirements are proof the thing was built correctly.

**Craftsmanship in every layer.**
This template names its anti-patterns explicitly. The UI/UX designer is told: never purple gradients on white backgrounds, never Space Grotesk as a primary typeface, never predictable cookie-cutter layouts. The Docker expert builds non-root containers with read-only filesystems. The CI/CD engineer runs security scans on every push. The database expert uses `EXPLAIN ANALYZE` before calling a query done. No layer is "good enough." Every layer is an opportunity to be deliberate.

**Trust through transparency.**
Architecture decisions are not just documented — they are documented with trade-offs. Not "we chose PostgreSQL" but "we chose PostgreSQL because X, considered Y, and accepted Z as the consequence." ADRs are append-only. When the decision changes, a new ADR supersedes the old one; the old one stays. The history is the trust.

**Security, accessibility, and performance are the floor.**
WCAG 2.1 AA is not a nice-to-have. OWASP Top 10 is not an audit concern. Core Web Vitals (LCP < 2.5s, INP < 100ms, CLS < 0.1) are not aspirational. These are the baseline — the minimum below which work is not complete. The template builds them in as defaults so they cannot be forgotten.

---

## What This Template Refuses

**The "just build it" instinct.** Skipping the design phase to start coding sooner is a loan at a very bad interest rate. This template makes you slow down before you speed up.

**Documentation written retrospectively.** Docs written after the fact describe what was built, not what was intended or what the user needs to know. This template treats documentation as part of the build, not as annotation.

**Scope creep dressed as progress.** The PRD has an Out of Scope section for a reason. The backlog exists so that good ideas go somewhere other than the current sprint. Saying "not now" is a feature, not a failure.

**Shortcuts with consequences.** Skipping pre-commit hooks, merging without tests, writing migrations that require downtime when zero-downtime patterns exist — these are not acceptable. The template doesn't make it easy to bypass discipline.

**Generic outputs.** The aesthetic anti-pattern list in the UI/UX agent exists because generic AI design is a real problem. Timid color palettes, overused typefaces, predictable layouts — they communicate that no one made a considered choice. This template insists on considered choices.

**Agents that overstep.** Specialist agents do not modify documents they do not own. The backend developer does not update the user guide. The copywriter does not modify the schema. The systems architect does not implement features. Overreach is how coherence falls apart.

---

## The Voice Behind It

The commit messages in this template's own history give it away. Agents don't just get *added* — they get *hired*. A mobile developer isn't introduced, a phone is *handed to the crew's newest hire*. An orchestrator doesn't get written, it becomes *a conductor who reads the score first*. Documentation writers get *long-term memory*. The CI/CD engineer is a *pipeline whisperer*.

This is not decoration. It reflects a belief that the work of building software — even the infrastructure, even the configuration — deserves the same craft as the thing being built. Names matter. Commit messages are read by humans. The template itself has a personality, and the projects built on it should inherit some of that.

The goal was never to produce a scaffold. It was to produce a way of working — one that respects the complexity of software, the value of human judgment, and the genuine power of AI when it's given structure instead of just freedom.

---

*Read `README.md` for what this template does. Read `CLAUDE.md` for how it works. Read this when you want to understand why.*
