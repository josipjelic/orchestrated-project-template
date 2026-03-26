# Product Requirements Document

> [!WARNING]
> **READ-ONLY FOR ALL AGENTS**
> This document is the source of truth for what we are building.
> Claude agents must READ this document to understand requirements.
> **Do not edit, rewrite, or "update to reflect current state" without explicit human instruction.**
> When in doubt, leave it unchanged and ask the human.

---

**Version**: 1.0
**Status**: Draft
**Last updated by human**: [YYYY-MM-DD]
**Product owner**: [Name]

---

## 1. Executive Summary

[3–5 sentences. What is this product? What core problem does it solve? Who are the primary users? What is the intended outcome after using it?]

---

## 2. Problem Statement

### 2.1 Current Situation

[Describe the world as it is today — what are users doing now without this product? What tools, workarounds, or manual processes do they rely on?]

### 2.2 The Problem

[Precisely define the problem. What friction, inefficiency, or unmet need exists? Be specific.]

### 2.3 Why Now

[Why is this the right time to build this? Market conditions, user demand, technology availability, business opportunity.]

---

## 3. Goals & Success Metrics

### 3.1 Business Goals

- [Goal 1: e.g., "Reduce customer support tickets related to onboarding by 40%"]
- [Goal 2]
- [Goal 3]

### 3.2 Success Metrics

| Metric | Baseline | Target | How Measured |
|--------|----------|--------|--------------|
| [e.g., Onboarding completion rate] | [0%] | [80%] | [Analytics event] |
| [e.g., Time to first value] | [N/A] | [< 5 min] | [Session recording] |
| [e.g., Weekly active users] | [0] | [500 in 3 months] | [Analytics] |

---

## 4. User Personas

### Persona: [Name, e.g., "Alex the Admin"]

- **Role**: [Job title or user type]
- **Goals**: [What they want to accomplish]
- **Pain points**: [Current frustrations this product addresses]
- **Technical level**: [Non-technical / Moderate / Developer]
- **Usage frequency**: [Daily / Weekly / Occasional]

### Persona: [Name, e.g., "Sam the End User"]

- **Role**: [Job title or user type]
- **Goals**: [What they want to accomplish]
- **Pain points**: [Current frustrations]
- **Technical level**: [Non-technical / Moderate / Developer]
- **Usage frequency**: [Daily / Weekly / Occasional]

---

## 5. Functional Requirements

> Requirements are numbered FR-XXX for unambiguous cross-referencing by agents and in tests.

### 5.1 [Feature Area: e.g., Authentication]

- **FR-001**: [Users must be able to register with email and password]
- **FR-002**: [Users must be able to log in with existing credentials]
- **FR-003**: [Users must be able to reset their password via email]
- **FR-004**: [Sessions must expire after 30 days of inactivity]

### 5.2 [Feature Area: e.g., Dashboard]

- **FR-010**: [...]
- **FR-011**: [...]

### 5.3 [Feature Area: e.g., Settings]

- **FR-020**: [...]

---

## 6. Non-Functional Requirements

### Performance
- [e.g., API response time < 200ms at p95 under normal load]
- [e.g., Page initial load < 3s on 4G connection]

### Security
- [e.g., Authentication required for all non-public endpoints]
- [e.g., All user data encrypted at rest]
- [e.g., OWASP Top 10 mitigations in place]

### Scalability
- [e.g., System must support up to 10,000 concurrent users without degradation]

### Accessibility
- [e.g., WCAG 2.1 AA compliance for all user-facing interfaces]

### Browser / Platform Support
- [e.g., Modern browsers: Chrome 110+, Firefox 110+, Safari 16+, Edge 110+]
- [e.g., Mobile-responsive down to 375px width]

### Reliability
- [e.g., 99.5% uptime SLA]
- [e.g., Automated backups every 24 hours]

---

## 7. Out of Scope (v1.0)

The following will **not** be built in the initial version. This list prevents scope creep and helps agents avoid building features that aren't required yet.

- [Feature A — reason: too complex for v1, planned for v2]
- [Feature B — reason: requires third-party integration not yet evaluated]
- [Feature C — reason: low user demand, deprioritized]

---

## 8. Open Questions

> These are unresolved decisions that require human input before implementation can proceed.

| # | Question | Owner | Status |
|---|----------|-------|--------|
| 1 | [e.g., Which payment provider: Stripe or Paddle?] | [Product Owner] | Open |
| 2 | [e.g., Will we support SSO in v1?] | [CTO] | Open |

---

## 9. Revision History

> Human entries only. Agents do not modify this section.

| Date | Author | Change Description |
|------|--------|--------------------|
| [YYYY-MM-DD] | [Name] | Initial draft |
