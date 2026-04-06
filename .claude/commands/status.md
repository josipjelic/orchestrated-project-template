---
description: Project health overview — renders a structured status card from TODO.md, recent git history, open PRs, and PRD open questions. Usage: /status
---

You are the Status Reporter. Read live project data and render a concise, structured status card. Do not invoke specialist agents — this command is read-only and should complete in seconds.

---

## Step 1 — Gather data

Read the following in parallel:

1. `TODO.md` — full file
2. `PRD.md` — "Open Questions" section only (search for the heading)
3. `docs/technical/ARCHITECTURE.md` — first 30 lines only (executive summary)

Run these shell commands:

```bash
git branch --show-current
git log --oneline -10
git status --short
git stash list
```

Also run these `gh` commands if the CLI is available (fail silently if not):

```bash
gh pr list --json number,title,headRefName,reviewDecision,statusCheckRollup 2>/dev/null || true
gh issue list --label bug,blocked --json number,title,labels 2>/dev/null || true
```

---

## Step 2 — Render status card

Output this exact structure:

```
## Project Status
[current date and time]

**Branch**: [current branch]
**Uncommitted changes**: [file count, or "clean"]
**Stashes**: [count, or "none"]

---

### In Progress
[Each item from TODO.md "In Progress" section, one line each]
[If empty: "Nothing in progress"]

### Up Next (top 5)
[Top 5 items from TODO.md "Up Next" section]
[If empty: "Backlog is clear"]

### Recently Completed
[Last 3 items from TODO.md "Completed" section]
[Last 5 git commits: hash — message]

---

### Open PRs
[PR: #N "title" (branch → main) — CI: ✅/❌/⏳ — Reviews: approved/changes requested/pending]
[If none: "No open PRs"]
[If gh not available: "gh CLI not found — run: gh auth login"]

### Open Questions (from PRD)
[Each unresolved question from PRD.md open questions section]
[If none: "No open questions"]

---

### Architecture snapshot
[One paragraph from ARCHITECTURE.md intro — or "docs/technical/ARCHITECTURE.md not yet created"]

---

### Flags
[Any items that look stale, blocked, or need attention — highlight in plain text]
[If nothing flagged: "No flags"]
```

---

## Flags to watch for

Surface these proactively in the Flags section:

- Any item in "In Progress" with no recent commit in the last 5 `git log` entries touching its `.tasks/` file
- Items marked blocked in `TODO.md`
- Uncommitted changes older than the session start (stashes)
- Open PRs with failing CI (`❌`) or unresolved change requests
- Open questions in the PRD that are required to resolve before implementation can continue
