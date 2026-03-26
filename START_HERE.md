# START HERE — Project Template Setup

> **This is a template, not a real project.**
> All placeholder values (wrapped in `[square brackets]`) must be replaced with real project information before development begins.
> Do not start writing code until onboarding is complete and the user has confirmed the documentation.

---

## For Claude: Onboarding Protocol

When the user says **"START!"**, execute this onboarding sequence in full. Do not wait for further instructions — begin immediately. Do not skip phases or merge them.

---

### Phase 1: Gather Project Information

Ask the user questions in conversational groups — 3 to 4 at a time. Wait for answers before continuing to the next group. Do not present all questions at once.

**Group 1 — Project basics:**
1. What is the name of this project?
2. What does it do in one sentence?
3. Who are the primary users? (e.g., "small business owners", "internal ops team", "developers")
4. What problem does it solve — what are users doing today without it?

**Group 2 — Tech stack:**
5. What is the frontend technology? (e.g., Next.js, React + Vite, Vue, none)
6. What is the backend? (e.g., Next.js API routes, Express, FastAPI, Django)
7. What database? (e.g., PostgreSQL, MySQL, SQLite, MongoDB)
8. What ORM or query layer? (e.g., Prisma, Drizzle, SQLAlchemy, raw SQL)
9. What is the hosting/deployment target? (e.g., Railway, Vercel, Fly.io, AWS)
10. What package manager? (npm / pnpm / yarn)
11. What Node version, if applicable? (check `.nvmrc` if it exists)

**Group 3 — Conventions:**
12. What formatter and linter? (e.g., Prettier + ESLint, Biome)
13. What test runner for unit tests? (e.g., Vitest, Jest)
14. What are the dev / build / test commands? (e.g., `npm run dev`, `npm run build`, `npm test`)

**Group 4 — Product requirements:**
15. What are the main features this product must have in v1? List them — you'll turn these into FR-XXX requirements in the PRD.
16. Are there any non-functional requirements? (e.g., performance targets, accessibility level, browser support)
17. What is explicitly out of scope for v1? (important for keeping the backlog focused)
18. Who is the product owner / decision maker?

**Group 5 — Content & SEO (skip if this is an internal tool with no public-facing pages):**
19. Does the product have a public-facing website, landing pages, or marketing content?
20. Do you have a defined brand voice or tone? (e.g., "professional and direct", "friendly and conversational") Any written examples or a style guide?
21. Are there SEO goals? (e.g., organic traffic targets, specific keywords you want to rank for, competitor pages you want to outrank)
22. Do you already have copy for any pages, or are all pages starting from scratch?

**Group 6 — Goals and open questions:**
23. What does success look like? Any specific metrics? (e.g., "100 users in first month", "onboarding under 5 minutes")
24. Are there any open decisions not yet made? (e.g., auth provider, payment processor, third-party integrations)

---

### Phase 2: Fill in the Documentation

#### 2.0 — Copy templates into place

Before filling in any documentation, copy the blank templates from `.claude/templates/` to their project locations:

```
.claude/templates/docs/technical/ARCHITECTURE.md  →  docs/technical/ARCHITECTURE.md
.claude/templates/docs/technical/DECISIONS.md     →  docs/technical/DECISIONS.md
.claude/templates/docs/technical/API.md           →  docs/technical/API.md
.claude/templates/docs/technical/DATABASE.md      →  docs/technical/DATABASE.md
.claude/templates/docs/user/USER_GUIDE.md         →  docs/user/USER_GUIDE.md
.claude/templates/docs/content/CONTENT_STRATEGY.md → docs/content/CONTENT_STRATEGY.md
.claude/templates/README.md                       →  README.md  (the project README — replaces the template's own)
```

Create parent directories as needed. Do not modify the files inside `.claude/templates/` — they are the upstream originals.

`CLAUDE.md` and `PRD.md` are already present at the project root and do not need copying.

Using the answers collected in Phase 1, update the following files in order. Replace every `[placeholder]` with real content. If the user doesn't know an answer yet, use `[TBD]` — never leave the original template placeholder text.

**2.1 — `CLAUDE.md`**

- Project name (heading and context paragraph)
- 2–3 sentence project context description
- Tech stack summary line
- Code style section: formatter, linter, import style
- Testing conventions: runner, file pattern, commands
- Environment commands: dev, build, test, lint, typecheck
- Stack line in the header

**2.2 — `README.md`** *(copied from `.claude/templates/README.template.md` in step 2.0)*

- Project name and one-sentence description
- Overview paragraphs (what it does, who it's for, why it exists)
- Tech stack table: fill in all layers
- Getting Started: prerequisites, install steps, run commands
- Environment variables table: list all known required vars with descriptions (no values)

**2.3 — `PRD.md`**

- Executive summary (3–5 sentences from the project description and goals)
- Problem statement: current situation, the problem, why now
- User personas: one section per user type mentioned — include role, goals, pain points, technical level
- Functional requirements: convert the feature list into numbered `FR-001`, `FR-002`, ... items. Group them by feature area. Be specific — each FR should be a testable statement.
- Non-functional requirements: fill in performance, security, accessibility, browser support
- Out of scope: list everything the user said is not v1
- Open questions: list any unresolved decisions from Group 5
- Revision history: add a first entry with today's date

**2.4 — `docs/technical/ARCHITECTURE.md`**

- Tech stack table: fill in all layers with versions and brief rationale
- Infrastructure environments table: at minimum, Production and Local rows
- Leave the Design System, Frontend Architecture, Backend Architecture, and Data Flow sections as templates — they will be filled in as implementation progresses

**2.5 — `docs/technical/DECISIONS.md`**

Fill in ADR-001 with the initial tech stack decision:
- Context: the project type, team size/familiarity, deployment constraints
- Options considered: list 2–3 realistic alternatives that were evaluated (or could have been)
- Decision: the chosen stack and the primary reason
- Consequences: what this makes easy, what trade-offs are accepted

Update the Decision Index table with the ADR-001 row.

**2.6 — `docs/content/CONTENT_STRATEGY.md`** *(skip if the project has no public-facing pages — mark file as `[N/A — internal tool]` in that case)*

Using the answers from Group 5:
- Overview and primary value proposition: the one sentence that all copy must reinforce
- Brand Voice table: fill in the four voice dimensions (formality, energy, personality, authority) based on the tone the user described; if no tone was defined, leave as `[TBD — define with @copywriter-seo]`
- Tone-by-context matrix: fill in the marketing headline and error message rows at minimum; leave others as `[TBD]`
- Target personas: one entry per persona from PRD.md — summarise their job-to-be-done and biggest objection in copy terms
- Keyword strategy: list any specific keywords the user mentioned; mark volume and difficulty as `[verify]`; leave the table otherwise populated with `[TBD]` rows
- Canonical domain: fill in the primary domain and chosen www/non-www preference if known; otherwise `[TBD]`
- Leave the Page Copy Library, CTA Library, and Redirect Map as blank templates — they will be filled in by @copywriter-seo as pages are written

---

### Phase 3: Build the Initial Backlog

This is a critical step. **The TODO.md must not be left with placeholder items.** The backlog is the team's work queue — it must reflect real, actionable tasks before development begins.

#### 3.1 — Derive tasks from the PRD

Read through the functional requirements in `PRD.md` and break them down into concrete, implementable tasks. For each feature area, think through what needs to happen end-to-end:

- Does it need a database schema? → task tagged `[area: database]`
- Does it need an API endpoint? → task tagged `[area: backend]`
- Does it need a UI? → task tagged `[area: frontend]`
- Does it need UX design first? → task tagged `[area: design]`
- Will it need E2E tests? → task tagged `[area: qa]`
- Is it a public-facing page that needs copy and SEO? → task tagged `[area: content]` — copy and keyword work must precede the frontend task for that page

#### 3.2 — Task sizing and ordering rules

- Each task should represent a meaningful, independently completable unit of work — something a specialist agent can finish in one focused session
- Do not create tasks so large they contain multiple concerns ("build the whole auth system") — break them down
- Do not create tasks so small they're trivial ("add a button") — roll them up
- Order by dependency: tasks that block others go to "Up Next" first
- The typical first tasks for a new project are: initial schema design (`database`), then core API endpoints (`backend`), then core UI (`frontend`)
- If any feature requires a design spec before implementation, create a design task that precedes the frontend task

#### 3.3 — Write the tasks

For each task:

**Step A — Add to `TODO.md`** using this format:
```
- [ ] #NNN — Clear, outcome-focused description [area: tag] → [.tasks/NNN-short-title.md](.tasks/NNN-short-title.md)
```

Place it in the correct section:
- **Up Next**: the first 3–5 tasks that are ready to start immediately, ordered by dependency and priority
- **Backlog**: everything else, roughly ordered by when it will be needed

**Step B — Create `.tasks/NNN-short-title.md`** by copying `.tasks/TASK_TEMPLATE.md`:
- Rename the file to match the task number and a short kebab-case title (e.g., `003-user-auth-schema.md`)
- Fill in all frontmatter fields:
  - `id`, `title`, `status: "todo"`, `area`, `agent` (the specialist agent that will do this work)
  - `created_at` (today's date)
  - `prd_refs` — list the FR-XXX numbers this task satisfies
  - `blocks` and `blocked_by` — identify dependencies between tasks
  - `priority`: "high" for Up Next items, "normal" or "low" for Backlog
- Write a detailed `## Description` — 2–5 sentences explaining what needs to be done and why
- Write specific `## Acceptance Criteria` — testable statements that define "done"
- Add any known `## Technical Notes` (relevant ADRs, schema dependencies, API contracts needed)
- Add the creation entry to the `## History` table

**Step C — Remove all remaining placeholder items** from `TODO.md` (the `#001` through `#008` entries that shipped with the template). Replace them entirely with the real tasks derived from the PRD. Do not keep placeholder entries.

#### 3.4 — Mark #000 as the foundation

Task `#000` (initial project setup) is already completed. Keep it in the Completed section. The next task number begins at `#001`.

---

### Phase 4: Review with the User

After completing all documentation and the initial backlog, present a structured summary:

**Summary format:**

```
## Onboarding Complete — Here's what was set up:

### Project
[Name] — [one-sentence description]

### Documentation filled in
- CLAUDE.md — stack, conventions, commands
- README.md — overview, getting started, env vars
- PRD.md — [X] functional requirements across [Y] feature areas, [Z] personas
- ARCHITECTURE.md — tech stack and infrastructure
- DECISIONS.md — ADR-001: [tech stack decision title]
- CONTENT_STRATEGY.md — [brand voice / keyword targets filled in | marked N/A for internal tool]

### Initial Backlog
Up Next ([N] tasks):
  #001 — [title] [area]
  #002 — [title] [area]
  ...

Backlog ([N] tasks):
  #NNN — [title] [area]
  ...

### Open items needing decisions
- [Any [TBD] items or open questions from the PRD]

Does everything look correct? Any changes before we start building?
```

Make any corrections the user requests. Re-run any affected file updates.

---

### Phase 5: Delete This File

Once the user explicitly confirms they are satisfied:

1. Delete `START_HERE.md`
2. Confirm: "Setup complete. START_HERE.md has been removed. Say 'what's next?' and I'll walk you through the first task."

Do not delete this file before the user says they're happy. "Looks good" or "yes" counts as confirmation.

---

## Onboarding Checklist

Use this to verify everything is done before asking for confirmation in Phase 4.

**Documentation**
- [ ] Templates copied from `.claude/templates/` to `docs/` and `README.md` (step 2.0)
- [ ] `CLAUDE.md` — all placeholders replaced, no `[square brackets]` remaining (or explicitly marked `[TBD]`)
- [ ] `README.md` — all placeholders replaced (copied from `.claude/templates/README.md`)
- [ ] `PRD.md` — executive summary, personas, numbered FR-XXX requirements, NFRs, out of scope, open questions
- [ ] `docs/technical/ARCHITECTURE.md` — tech stack table and infrastructure environments filled in
- [ ] `docs/technical/DECISIONS.md` — ADR-001 filled in with real tech stack rationale
- [ ] `docs/content/CONTENT_STRATEGY.md` — brand voice and personas filled in (or marked `[N/A]` if internal tool with no public-facing pages)

**Backlog**
- [ ] `TODO.md` contains only real tasks — no placeholder `#001`–`#008` entries remain
- [ ] Every TODO item has a corresponding `.tasks/NNN-*.md` file
- [ ] Every `.tasks/NNN-*.md` file has: description, acceptance criteria, `prd_refs`, `agent`, `created_at`
- [ ] `blocks` / `blocked_by` dependencies are set correctly where tasks depend on each other
- [ ] "Up Next" contains the first tasks that are ready to start, ordered by dependency
- [ ] Task #000 remains in Completed

**Sign-off**
- [ ] Summary presented to user (Phase 4)
- [ ] User confirmed satisfaction
- [ ] This file deleted
