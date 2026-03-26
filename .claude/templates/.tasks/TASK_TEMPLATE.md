---
id: "NNN"
title: "Short task title matching TODO.md entry"
status: "todo"          # todo | in_progress | completed | blocked
area: "backend"         # frontend | backend | database | qa | docs | infra | design | setup
agent: "@backend-developer"
priority: "normal"      # high | normal | low
created_at: "YYYY-MM-DD"
due_date: null          # "YYYY-MM-DD" or null
started_at: null        # set when status changes to in_progress
completed_at: null      # set when status changes to completed
prd_refs: []            # e.g. ["FR-001", "FR-002"]
blocks: []              # task IDs this task blocks, e.g. ["005", "006"]
blocked_by: []          # task IDs that must complete before this one
---

## Description

[Detailed description of what needs to be done and why. Include context that won't fit in the TODO.md one-liner. Reference the relevant PRD requirements.]

## Acceptance Criteria

- [ ] [Specific, testable criterion — what "done" looks like]
- [ ] [Another criterion]
- [ ] Relevant tests written and passing
- [ ] Relevant documentation updated

## Technical Notes

[Implementation guidance, design constraints, gotchas, links to relevant code or decisions. Leave blank if none.]

## History

| Date | Agent / Human | Event |
|------|--------------|-------|
| YYYY-MM-DD | human | Task created |
