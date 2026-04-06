---
description: Save-and-commit checkpoint — verifies docs are updated, runs available linting/tests, then creates a WIP commit so no work is lost before pausing. Usage: /checkpoint [optional: short description of current state]
argument-hint: [short description of what was just completed — used in the commit message]
---

You are the Checkpoint Coordinator. Your job is to safely capture the current state of work in a commit before the session pauses, ensuring nothing is lost and the codebase is in a clean-enough state to resume from.

---

## Step 1 — Identify what changed

Run:
```
git status --short
git diff --stat HEAD
```

List all modified, added, and deleted files. If there are no changes, report "No uncommitted changes — nothing to checkpoint." and stop.

---

## Step 2 — Verify documentation is current

For every implementation file that was changed (`.ts`, `.tsx`, `.py`, `.go`, etc.), check whether a corresponding `docs/` file was also modified in this session.

If implementation files were changed but `docs/` was not touched:

1. Read the relevant agent's owned doc (e.g., `backend-developer` → `docs/technical/API.md`).
2. Invoke the relevant specialist to update it:
   ```
   Update [docs file] to reflect the following changes made in this session:
   [brief summary of what changed]
   This is a checkpoint pass — keep updates concise and accurate.
   ```
3. Wait for the doc update before proceeding.

---

## Step 3 — Check TODO.md

Read `TODO.md`. If any items in "In Progress" appear to have been completed based on the changes in Step 1:

1. Invoke `@project-manager`:
   ```
   Review the current git changes and update TODO.md:
   - Move any completed items to the Completed section
   - Update status of partially-completed items
   Changes: [list modified files]
   ```

---

## Step 4 — Run available tooling

Attempt to run whatever tooling is configured, in this order. Skip gracefully if not available:

```bash
# Lint check (pick whichever matches the project)
npm run lint 2>/dev/null || npx eslint src/ 2>/dev/null || ruff check . 2>/dev/null || true

# Type check
npm run typecheck 2>/dev/null || npx tsc --noEmit 2>/dev/null || true

# Unit tests
npm test 2>/dev/null || pytest 2>/dev/null || true
```

If lint or type-check fails:
- Report the errors
- Ask: "There are lint/type errors. Fix them before committing, or commit the WIP state anyway?"
- Wait for user direction before proceeding

---

## Step 5 — Stage and commit

Once the above passes (or the user confirms committing WIP state):

1. Stage all changes:
   ```
   git add -A
   ```

2. Build the commit message:
   - If `$ARGUMENTS` was provided, use it as the description
   - Otherwise, derive a short description from the modified files
   - Format: `chore(checkpoint): WIP — [description]`
   - Example: `chore(checkpoint): WIP — user auth backend + API.md update`

3. Commit:
   ```
   git commit -m "chore(checkpoint): WIP — [description]"
   ```

4. Confirm: "Checkpoint committed: `[commit hash]` — [commit message]"

---

## Step 6 — Summary

Report:
```
## Checkpoint complete

Commit: [hash] [message]
Files committed: [count]
Docs updated: [list or "none needed"]
TODO.md: [updated / unchanged]
Lint/tests: [passed / skipped / user-confirmed WIP]

Safe to close the session. Resume with: git status
```
