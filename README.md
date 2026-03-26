# Claude Development Template

![Claude Development Template](.assets/cover.png)

A bootstrapping template for software projects built with [Claude Code](https://claude.com/product/claude-code). Use it as a GitHub template, run **`/start`**, and Claude walks you through setting up all the documentation before a single line of code is written.

---

## What This Is

This repository is an opinionated project scaffold that gives Claude everything it needs to act as a coherent development team from day one:

- **Specialized agents** for each discipline (architecture, frontend, backend, design, database, QA, CI/CD, Docker, docs, copywriting & SEO)
- **Living documentation** that agents keep up to date as the project evolves
- **Git conventions** enforced through commit format, branch naming, and PR templates
- **A product requirements document** that serves as the authoritative source of truth — protected from accidental edits
- **A backlog** agents can reference when you ask "what should we work on next?"

---

## How to Use

### 1. Create a new repository from this template

Click **"Use this template"** → **"Create a new repository"** on GitHub.

Or with the GitHub CLI:

```bash
gh repo create my-project --template https://github.com/josipjelic/orchestrated-project-template --private --clone && cd my-project
```

### 2. Open it in Claude Code and run `/start`

Claude will read `START_HERE.md` and begin the onboarding sequence — asking questions about your project and filling in all the documentation placeholders automatically.

### 3. Start building

Once onboarding is complete, `START_HERE.md` is deleted and the project is ready. Use `TODO.md` to see what to work on first.

---

## Keeping Up to Date

As the template evolves — new agents, refined commands, improved conventions — you can pull those improvements into any existing project with a single command.

### Run `/sync-template`

Open your project in Claude Code and run:

```
/sync-template
```

Claude will:
1. Fetch the latest `.claude/` directory from the upstream template repository
2. Show you a diff — new files, modified files, and local-only files it will leave untouched
3. Ask for confirmation before changing anything
4. Apply the updates and report what changed

**What gets synced**: everything in `.claude/` — agent definitions, commands, and settings.

**What is preserved**: any files you've added locally that don't exist in the upstream template are never deleted. Project-specific customisations stay intact.

---

## What's Inside

```
├── CLAUDE.md                     # Master Claude instructions (auto-loaded every session)
├── PRD.md                        # Product Requirements Document — agents read, never modify
├── TODO.md                       # Prioritized backlog — humans curate, agents consult
├── README.template.md            # README template filled in during onboarding
├── START_HERE.md                 # Onboarding protocol — deleted after setup
├── .gitignore
│
├── .claude/
│   ├── agents/                   # Specialist sub-agents
│   │   ├── project-manager.md    # Backlog governance & agent coordination
│   │   ├── systems-architect.md  # Architecture decisions & ADRs (Claude Opus)
│   │   ├── frontend-developer.md # UI components & pages
│   │   ├── backend-developer.md  # API endpoints & business logic
│   │   ├── ui-ux-designer.md     # UX flows & design system specs
│   │   ├── database-expert.md    # Schema design & migrations
│   │   ├── qa-engineer.md        # Playwright E2E tests
│   │   ├── documentation-writer.md # User guide & project docs
│   │   ├── cicd-engineer.md      # GitHub Actions workflows & deployment pipelines
│   │   ├── docker-expert.md      # Dockerfiles, Compose, image optimization
│   │   └── copywriter-seo.md     # Conversion copy, brand voice, keyword strategy, technical SEO
│   ├── commands/
│   │   ├── start.md              # /start — runs the onboarding protocol
│   │   └── sync-template.md      # /sync-template — pulls latest .claude/ from upstream
│   └── templates/                # Blank doc templates — synced from upstream via /sync-template
│       ├── CLAUDE.md             # Master Claude instructions template
│       ├── PRD.md                # Product requirements template
│       ├── README.md             # Project README template
│       ├── docs/
│       │   ├── technical/        # ARCHITECTURE.md, DECISIONS.md, API.md, DATABASE.md
│       │   ├── user/             # USER_GUIDE.md
│       │   └── content/          # CONTENT_STRATEGY.md
│       └── .tasks/
│           └── TASK_TEMPLATE.md  # Task file template
│
├── .github/
│   └── PULL_REQUEST_TEMPLATE.md  # Enforces consistent PR descriptions
│
├── .tasks/                       # Detailed task files — one per TODO item
│   └── TASK_TEMPLATE.md          # Copy this when creating new tasks
│
└── docs/                         # Created during onboarding from .claude/templates/
    ├── user/USER_GUIDE.md        # How the system is used (user perspective)
    ├── technical/
    │   ├── ARCHITECTURE.md       # System design & component overview
    │   ├── API.md                # API reference (updated after every endpoint)
    │   ├── DATABASE.md           # Schema, migrations, query patterns
    │   └── DECISIONS.md          # Architecture Decision Records (ADR log)
    └── content/
        └── CONTENT_STRATEGY.md   # Brand voice, keyword targets, copy library, technical SEO specs
```

---

## Agents

Each agent is a specialist Claude sub-agent with a defined role, document ownership, and working protocol.

| Agent | Model | Responsibility | Owns |
|-------|-------|----------------|------|
| `project-manager` | Sonnet | Backlog governance, sprint planning, agent coordination | `TODO.md` |
| `systems-architect` | Opus | High-level design, tech decisions, ADRs | `ARCHITECTURE.md`, `DECISIONS.md` |
| `frontend-developer` | Sonnet | UI components, pages, client-side logic | Frontend section of `ARCHITECTURE.md` |
| `backend-developer` | Sonnet | API endpoints, business logic, integrations | `API.md` |
| `ui-ux-designer` | Sonnet | UX flows, design system, accessibility specs | Design System section of `ARCHITECTURE.md` |
| `database-expert` | Sonnet | Schema design, migrations, query optimization | `DATABASE.md` |
| `qa-engineer` | Sonnet | Playwright E2E tests, test strategy | `tests/e2e/` |
| `documentation-writer` | Haiku | User guide, README updates | `USER_GUIDE.md` |
| `cicd-engineer` | Sonnet | GitHub Actions workflows, deployments, branch protection, release automation | `.github/workflows/`, `CICD.md` |
| `docker-expert` | Sonnet | Dockerfiles, docker-compose, image optimization, container networking | `Dockerfile*`, `docker-compose*.yml`, `DOCKER.md` |
| `copywriter-seo` | Sonnet | Conversion copy, brand voice, keyword strategy, on-page SEO, structured data specs | `docs/content/CONTENT_STRATEGY.md` |

Claude selects agents automatically based on context, or you can invoke them directly.

---

## Key Conventions

**Commits** — [Conventional Commits](https://www.conventionalcommits.org/):
```
feat(auth): add OAuth2 login with Google
fix(api): handle null response from payment provider
```

**Branches**:
```
feature/<ticket-id>-short-description
fix/<ticket-id>-short-description
```

**PRD is read-only** — `PRD.md` is protected by a three-layer mechanism (warning block, CLAUDE.md rule, and agent system prompts). Agents will refuse to modify it without explicit human instruction.

**Documentation stays current** — Agents are required to update the relevant `docs/` file before marking any implementation task complete.

---

## Design Principles

- **Design before code** — the Systems Architect agent produces specs and ADRs; specialists implement
- **Copy before implementation** — the Copywriter & SEO agent defines page copy, CTAs, and keyword targets before @frontend-developer builds marketing pages
- **Document ownership** — every `docs/` file has a declared owner agent; others don't overwrite
- **Append-only ADRs** — architectural decisions are never silently revised; a new ADR supersedes an old one
- **Tests map to requirements** — QA writes tests against FR-XXX items in the PRD, not implementation details
- **TODO.md is human territory** — agents read the backlog to suggest work; they never auto-modify it

---

## License

[MIT](LICENSE)
