<!--
DOCUMENT METADATA
Owner: @ui-ux-designer
Update trigger: Design tokens, component specs, interaction patterns, key user flows, or accessibility baseline changes
Update scope:
  @ui-ux-designer: Entire document
  Other agents: read-only. Do not modify design decisions or specifications.
Read by: All agents implementing or testing UI. Always read before visual or UX work.
-->

# Design system and UX specifications

> Last updated: [YYYY-MM-DD]
> Version: [x.x.x]

Canonical design language, component inventory, interaction patterns, and summaries of major user journeys. Detailed feature specs may also live in `.tasks/` files; this document is the single source of truth for reusable design decisions.

---

## Key user flows

<!--
Summaries only — link to task files or PRD sections for full specs when helpful.
-->

| Flow | Goal | Primary entry | Notes |
|------|------|---------------|-------|
| [e.g., Onboarding] | [User outcome in one line] | [Route or trigger] | [Link to FR-XXX or task file] |
| [Flow name] | | | |

---

## Color tokens

| Token | Value | Usage |
|-------|-------|-------|
| `color-primary-500` | [#XXXXXX] | Primary actions, links |
| `color-primary-600` | [#XXXXXX] | Primary hover states |
| `color-neutral-100` | [#XXXXXX] | Background surfaces |
| `color-neutral-900` | [#XXXXXX] | Body text |
| `color-error-500` | [#XXXXXX] | Error states |
| `color-success-500` | [#XXXXXX] | Success states |

---

## Typography scale

| Token | Size | Weight | Usage |
|-------|------|--------|-------|
| `text-heading-1` | [32px] | [700] | Page headings |
| `text-heading-2` | [24px] | [600] | Section headings |
| `text-body` | [16px] | [400] | Body copy |
| `text-small` | [14px] | [400] | Labels, captions |

---

## Spacing system

[e.g., 4px base unit — all spacing is multiples of 4: 4, 8, 12, 16, 24, 32, 48, 64]

---

## Component inventory

| Component | Location | Status | Notes |
|-----------|----------|--------|-------|
| Button | `src/components/ui/Button` | [Stable] | Primary, secondary, ghost variants |
| Input | `src/components/ui/Input` | [Stable] | |
| Modal | `src/components/ui/Modal` | [Stable] | |
| [Component] | | [Draft/Stable/Deprecated] | |

---

## Interaction patterns

- **Loading states**: [e.g., skeleton screens for content, spinner for actions]
- **Error states**: [e.g., inline error messages below form fields, toast for async errors]
- **Empty states**: [e.g., illustrated empty state with CTA for first-use scenarios]
- **Confirmation dialogs**: [e.g., required for destructive actions, not for saves]
