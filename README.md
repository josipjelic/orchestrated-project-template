# Claude Development Template

![Claude Development Template](.assets/cover.png)

A bootstrapping template for software projects built with [Claude Code](https://claude.com/product/claude-code). Use it as a GitHub template, run **`/start`**, and Claude walks you through setting up all the documentation before a single line of code is written.

Conventions in this template are enforced — not just advisory. Lifecycle hooks, file-scoped rules, and MCP server configuration mean Claude follows the standards 100% of the time, not ~80%.

---

## What This Is

This repository is an opinionated project scaffold that gives Claude everything it needs to act as a coherent development team from day one:

- **Specialized agents** for each discipline (architecture, frontend, mobile/React Native, backend, design, database, QA, CI/CD, Docker, docs, copywriting & SEO)
- **Lifecycle hooks** that fire automatically — blocking destructive commands, auto-formatting on save, and warning when docs fall out of sync with implementation
- **MCP servers** pre-configured for live library documentation and structured reasoning — shared across the whole team via a committed `.mcp.json`
- **File-scoped rules** that inject TypeScript, migration, and test standards only when the relevant file type is being edited
- **Slash commands** for every common workflow: `/orchestrate`, `/review`, `/release`, `/checkpoint`, `/status`
- **Living documentation** that agents keep up to date as the project evolves
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

### 2. Authenticate the GitHub CLI (optional)

```bash
gh auth login
```

Agents use `gh` directly for GitHub operations (issues, PRs, CI status). One-time setup — persists across all sessions automatically. Skip if you don't need GitHub integration.

### 3. Open it in Claude Code and run `/start`

Claude will read `START_HERE.md` and begin the onboarding sequence — asking questions about your project and filling in all the documentation placeholders automatically.

### 4. Start building

Once onboarding is complete, `START_HERE.md` is deleted and the project is ready. Use `TODO.md` to see what to work on first, or run `/status` for a full project health overview.

---

## Commands

### `/start`

Run once after creating a new project. Claude reads `START_HERE.md` and walks you through the full onboarding sequence — gathering project details, copying documentation templates into place, filling in every placeholder, and building the initial backlog from your requirements.

### `/orchestrate <task description>`

Hand off a multi-agent task and let Claude coordinate the execution. The orchestrator analyzes your task, identifies which specialists are needed, determines the correct execution order (parallel where safe, sequential where dependencies require it), registers the work in the backlog, creates a feature branch, and runs the agents wave by wave.

```
/orchestrate add user authentication with email and password
```

Presents a wave plan for your approval before anything runs. Stops and asks if a wave fails — never silently continues.

### `/review [branch or file]`

Triggers a structured multi-agent code review scoped to the current branch diff (or a specific file/branch if provided). The `systems-architect` checks for architectural drift, the `qa-engineer` audits test coverage, and the relevant implementation agent checks code quality. Outputs a tiered report: required fixes, suggestions, and nice-to-haves.

### `/release [version]`

Pre-release quality gate. Checks that the backlog is clear, then runs `@qa-engineer`, `@documentation-writer`, and `@cicd-engineer` in parallel. Compiles their results into a signed-off release checklist — and asks before proceeding if any blockers are found.

### `/checkpoint [description]`

Safe-save before pausing a session. Verifies docs are current, runs available lint/tests, then commits all changes as `chore(checkpoint): WIP — [description]`. Useful before closing Claude or handing off to another session.

### `/status`

Renders a live project health card: current branch, in-progress tasks, recent commits, open PRs (via `gh pr list`), blockers, and open PRD questions. Read-only — completes in seconds.

### `/sync-template`

Pull the latest `.claude/` directory from the upstream template repository into your project. Useful when agents are improved, new commands are added, or documentation templates are updated.

Shows a diff and asks for confirmation before changing anything. Local-only files are never deleted.

---

## What's Inside

```
├── CLAUDE.md                     # Master Claude instructions (auto-loaded every session)
├── PRD.md                        # Product Requirements Document — agents read, never modify
├── TODO.md                       # Prioritized backlog — humans curate, agents consult
├── START_HERE.md                 # Onboarding protocol — deleted after setup
├── .mcp.json                     # MCP server config (github, sequential-thinking, context7)
├── .gitignore
│
├── .claude/
│   ├── settings.json             # Lifecycle hook configuration
│   ├── agents/                   # Specialist sub-agents
│   │   ├── project-manager.md    # Backlog governance & agent coordination
│   │   ├── systems-architect.md  # Architecture decisions & ADRs (Claude Opus)
│   │   ├── frontend-developer.md # UI components & pages
│   │   ├── react-native-developer.md # Mobile screens, navigation & native modules
│   │   ├── backend-developer.md  # API endpoints & business logic
│   │   ├── ui-ux-designer.md     # UX flows & design system specs
│   │   ├── database-expert.md    # Schema design & migrations
│   │   ├── qa-engineer.md        # Playwright E2E tests
│   │   ├── documentation-writer.md # User guide & project docs
│   │   ├── cicd-engineer.md      # GitHub Actions workflows & deployment pipelines
│   │   ├── docker-expert.md      # Dockerfiles, Compose, image optimization
│   │   └── copywriter-seo.md     # Conversion copy, brand voice, keyword strategy, technical SEO
│   ├── commands/
│   │   ├── orchestrate.md        # /orchestrate — multi-agent task execution
│   │   ├── review.md             # /review — multi-agent code review
│   │   ├── release.md            # /release — pre-release QA + docs + CI/CD pass
│   │   ├── checkpoint.md         # /checkpoint — save, verify docs, commit WIP
│   │   ├── status.md             # /status — live project health card
│   │   ├── start.md              # /start — runs the onboarding protocol
│   │   └── sync-template.md      # /sync-template — pulls latest .claude/ from upstream
│   ├── hooks/                    # Lifecycle hook scripts (chmod +x, called by settings.json)
│   │   ├── guard-destructive.sh  # PreToolUse: blocks rm -rf, force push, DROP TABLE, etc.
│   │   ├── format-on-write.sh    # PostToolUse: auto-formats saved files (prettier, ruff, gofmt…)
│   │   ├── validate-completion.sh # Stop: warns if docs/TODO weren't updated with code changes
│   │   └── log-agent.sh          # SubagentStart: audit trail → .claude/agent-log.txt
│   ├── rules/                    # File-scoped rules — injected only when matching files are open
│   │   ├── typescript.md         # *.ts, *.tsx — no any, strict null, explicit returns
│   │   ├── migrations.md         # *.sql, migrations/** — reversible, naming convention
│   │   └── tests.md              # *.spec.ts, *.test.ts — POM, data-testid, no test.only
│   └── templates/                # Blank doc templates — synced from upstream via /sync-template
│       ├── CLAUDE.md             # Master Claude instructions template
│       ├── PRD.md                # Product requirements template
│       ├── README.md             # Project README template
│       ├── docs/
│       │   ├── technical/        # ARCHITECTURE.md, DESIGN_SYSTEM.md, DECISIONS.md, API.md, DATABASE.md
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
    │   ├── DESIGN_SYSTEM.md      # Design tokens, UX specs, component inventory (@ui-ux-designer)
    │   ├── API.md                # API reference (updated after every endpoint)
    │   ├── DATABASE.md           # Schema, migrations, query patterns
    │   └── DECISIONS.md          # Architecture Decision Records (ADR log)
    └── content/
        └── CONTENT_STRATEGY.md   # Brand voice, keyword targets, copy library, technical SEO specs
```

---

## Agents

Each agent is a specialist Claude sub-agent with a defined role, document ownership, working protocol, and scoped MCP access.

| Agent | Model | Responsibility | Owns | MCP access |
|-------|-------|----------------|------|------------|
| `project-manager` | Sonnet | Backlog governance, sprint planning, agent coordination | `TODO.md` | `gh` CLI |
| `systems-architect` | Opus | High-level design, tech decisions, ADRs | `ARCHITECTURE.md`, `DECISIONS.md` | `sequential-thinking` |
| `frontend-developer` | Sonnet | UI components, pages, client-side logic | Frontend section of `ARCHITECTURE.md` | `context7` |
| `react-native-developer` | Sonnet | Mobile screens, navigation, native modules, platform-specific code | Mobile section of `ARCHITECTURE.md` | `context7` |
| `backend-developer` | Sonnet | API endpoints, business logic, integrations | `API.md` | `context7`, `gh` CLI |
| `ui-ux-designer` | Sonnet | UX flows, design system, accessibility specs | `docs/technical/DESIGN_SYSTEM.md` | — |
| `database-expert` | Sonnet | Schema design, migrations, query optimization | `DATABASE.md` | `context7` |
| `qa-engineer` | Sonnet | Playwright E2E tests, test strategy | `tests/e2e/` | `gh` CLI |
| `documentation-writer` | Haiku | User guide, README updates | `USER_GUIDE.md` | — |
| `cicd-engineer` | Sonnet | GitHub Actions workflows, deployments, branch protection, release automation | `.github/workflows/`, `CICD.md` | `gh` CLI |
| `docker-expert` | Sonnet | Dockerfiles, docker-compose, image optimization, container networking | `Dockerfile*`, `docker-compose*.yml`, `DOCKER.md` | `context7` |
| `copywriter-seo` | Sonnet | Conversion copy, brand voice, keyword strategy, on-page SEO, structured data specs | `docs/content/CONTENT_STRATEGY.md` | — |

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

**Documentation stays current** — Agents are required to update the relevant `docs/` file before marking any implementation task complete. The `validate-completion.sh` hook warns at the end of every turn if this hasn't happened.

**Conventions are enforced, not advisory** — The `guard-destructive.sh` hook blocks dangerous commands at the tool call level (100% enforcement), and `format-on-write.sh` runs the project formatter automatically on every save. File-scoped rules in `.claude/rules/` inject TypeScript, migration, and test standards only when the matching file type is active — keeping context tight and standards precise.

---

## Design Principles

- **Design before code** — the Systems Architect agent produces specs and ADRs; specialists implement
- **Copy before implementation** — the Copywriter & SEO agent defines page copy, CTAs, and keyword targets before @frontend-developer builds marketing pages
- **Document ownership** — every `docs/` file has a declared owner agent; others don't overwrite
- **Append-only ADRs** — architectural decisions are never silently revised; a new ADR supersedes an old one
- **Tests map to requirements** — QA writes tests against FR-XXX items in the PRD, not implementation details
- **TODO.md is human territory** — agents read the backlog to suggest work; they never auto-modify it
- **Hooks over instructions** — destructive command blocking, auto-formatting, and completion checks are implemented as shell scripts that fire 100% of the time, not as text instructions that agents can overlook
- **Scoped context** — rules and MCP tools are granted per-agent and per-file, not globally; `database-expert` gets database docs, `systems-architect` gets structured reasoning, and TypeScript rules only appear when a `.ts` file is open

---

## License

[MIT](LICENSE)
