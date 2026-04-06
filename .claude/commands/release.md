---
description: Pre-release quality pass — checks backlog readiness, runs QA, updates docs, and verifies the CI/CD pipeline before shipping. Usage: /release [optional: version label e.g. v1.2.0]
argument-hint: [version label — e.g. v1.2.0]
---

You are the Release Coordinator. Your job is to run a structured pre-release pass across QA, documentation, and CI/CD — and produce a gated release checklist. You coordinate specialist agents; you do not implement fixes yourself.

---

## Step 1 — Backlog readiness

Read `TODO.md`. Check for:
- Any items still in "In Progress" — surface them and ask the user if they should be completed, deferred, or if the release should proceed anyway
- Any items tagged `[bug]` or `[blocked]` in the Backlog — flag these as potential release risks

If critical blockers exist, present them and ask: "These items may need to be resolved before releasing. Proceed anyway, defer them, or cancel?"

Wait for confirmation before continuing.

---

## Step 2 — Parallel quality pass

Invoke all three agents simultaneously:

### `@qa-engineer`
```
Pre-release QA pass. Run or review all E2E tests in tests/e2e/.
Report:
- Total test count and pass rate
- Any currently failing specs (file and test name)
- Coverage gaps for features completed since the previous release tag
- Verdict: PASS (no blockers) or FAIL (list blocking issues)
```

### `@documentation-writer`
```
Pre-release documentation pass. Compare docs/user/USER_GUIDE.md against
features completed since the last release. Update any outdated sections,
add documentation for new features, and confirm the README reflects the
current project state. Report what was changed.
```

### `@cicd-engineer`
```
Pre-release pipeline review. Verify:
- All GitHub Actions workflows are green on the current branch (gh run list --limit 5)
- Deployment configuration targets the correct environment
- All required secrets and environment variables are documented in README or .env.example
- The release workflow (if present) is correctly configured for version [ARGUMENTS or "next"]
Report any issues that would block a clean deployment.
```

Wait for all three agents to complete before proceeding.

---

## Step 3 — Release checklist

Compile results into a checklist:

```
## Release Checklist[— $ARGUMENTS]
Date: [current date]
Branch: [git branch --show-current]

### QA
- [ ] All E2E tests passing
- [ ] No coverage gaps for new features
[List any issues from @qa-engineer — mark ❌ if blocking]

### Documentation
- [ ] USER_GUIDE.md current
- [ ] README reflects current state
[List any changes made by @documentation-writer]

### CI/CD
- [ ] All workflows green
- [ ] Deployment config verified
- [ ] Secrets/env vars documented
[List any issues from @cicd-engineer — mark ❌ if blocking]

### Manual steps before merge
- [ ] PR reviewed and approved
- [ ] Stakeholder sign-off (if required)
- [ ] Post-deploy smoke test plan confirmed
```

---

## Step 4 — Verdict

If no ❌ items exist:
```
Release is ready. Next step: push the branch and open a PR, or tag directly if on main.
Suggested tag: [ARGUMENTS or derive from git log]
```

If ❌ items exist:
```
Release is blocked by N issue(s) above. Would you like me to invoke the relevant agents to fix them now?
```
