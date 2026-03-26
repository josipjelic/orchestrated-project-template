# Content Strategy

> **Owner**: @copywriter-seo
> **Personas**: Defined in `PRD.md` — always read before writing copy
> **Last updated**: [YYYY-MM-DD]

---

## Overview

[2–3 sentences: what this product does, who it's for, and the core promise that all content should reinforce. Must align with PRD.md — do not contradict it.]

**Primary value proposition**: [One sentence. The single most compelling reason to choose this product.]

**Canonical brand statement**: [The one line that appears most consistently across all channels. This is the gravitational centre of all copy.]

---

## Brand Voice & Tone

### Voice (constant across all content)

| Dimension | Setting | Description |
|-----------|---------|-------------|
| Formality | [Formal / Conversational / Casual] | [Why — e.g., "matches the technical audience"] |
| Energy | [Low / Medium / High] | [Why] |
| Personality | [Corporate / Human / Playful] | [Why] |
| Authority | [Humble / Peer / Expert] | [Why] |

### Tone by Context

| Context | Tone | Example |
|---------|------|---------|
| Marketing headlines | [e.g., Confident, benefit-led] | [Example headline] |
| Error messages | [e.g., Calm, direct, helpful] | [Example error message] |
| Success confirmations | [e.g., Warm, brief, forward-looking] | [Example] |
| Onboarding | [e.g., Encouraging, jargon-free] | [Example] |
| Pricing page | [e.g., Direct, objection-handling] | [Example] |
| Empty states | [e.g., Helpful, action-oriented] | [Example] |

### Voice Rules

- [Rule 1 — e.g., "Always lead with the outcome, not the feature"]
- [Rule 2 — e.g., "Use 'you' and 'your', not 'users' or 'customers'"]
- [Rule 3]

### Forbidden Phrases

- [Phrase] — [reason]
- [Phrase] — [reason]

---

## Target Personas

> Personas are defined in `PRD.md`. This section captures only the copy-relevant summary for each.

### [Persona 1 Name]

**Job-to-be-done**: [What they are trying to accomplish — in their words]
**Biggest objection**: [What holds them back from buying / signing up]
**Language to use**: [Specific words, phrases, vocabulary they use]
**Tone for this persona**: [Adjust from brand default if needed]
**Primary CTA for this persona**: [The action most likely to convert them]

---

### [Persona 2 Name]

**Job-to-be-done**: [What they are trying to accomplish]
**Biggest objection**: [What holds them back]
**Language to use**: [Their vocabulary]
**Tone for this persona**: [Adjust if needed]
**Primary CTA for this persona**: [Most effective action]

---

## Keyword Strategy

### Domain & Canonical URL

- **Primary domain**: [https://example.com]
- **Canonical protocol + www preference**: [https://www.example.com OR https://example.com — pick one; must be consistent]

### Primary Keyword Targets

| Keyword | Intent | Mapped Page | Monthly Volume | Difficulty | Status | Date Added |
|---------|--------|-------------|---------------|------------|--------|------------|
| [keyword] | [informational/navigational/commercial/transactional] | [/page-slug] | [volume or "verify"] | [low/med/high or "verify"] | [targeting/ranking/not started] | [YYYY-MM-DD] |

### Secondary Keywords (supporting, per page)

| Page | Secondary Keywords |
|------|--------------------|
| [/page-slug] | [keyword 1], [keyword 2], [keyword 3] |

### Content Clusters

| Pillar Page | Cluster Pages | Status |
|-------------|---------------|--------|
| [/pillar-slug] | [/cluster-1], [/cluster-2] | [planned/in progress/live] |

### Keywords to Avoid / Not Target

| Keyword | Reason |
|---------|--------|
| [keyword] | [e.g., Already owned by a competitor with 10× DA; not worth competing] |

---

## Page Copy Library

Copy is recorded here after it goes live. Variants awaiting A/B test results are marked **(test)**.

---

### Homepage

**Title tag**: [exact text]
**Meta description**: [exact text]

**H1**:
> [Headline text]

**Sub-headline**:
> [Sub-headline text]

**Primary CTA**: [CTA text] → [destination URL or route]
**Secondary CTA**: [CTA text] → [destination]

**Social proof block**: [Number of customers / logos / testimonial used]

---

### [Page 2: e.g., Pricing]

**Title tag**: [exact text]
**Meta description**: [exact text]

**H1**:
> [Headline text]

**Primary CTA**: [CTA text]

---

### [Add pages as copy is written]

---

## CTA Library

All approved CTAs in active use. New CTAs must be added here before implementation.

| CTA Text | Page / Context | Level | Notes | Date Added |
|----------|---------------|-------|-------|------------|
| [CTA text] | [page or context] | [primary/secondary/tertiary] | [e.g., "Converts best for cold traffic"] | [YYYY-MM-DD] |

---

## Technical SEO Decisions

### Meta Tag Defaults

Applied to all pages unless a page-level override exists in the Page Copy Library above.

| Tag | Default value | Notes |
|-----|--------------|-------|
| robots | `index, follow` | Override to `noindex` for: /thank-you, /admin, /404 |
| og:image | [path to default social image — 1200×630px] | Override per page when unique image exists |
| twitter:card | `summary_large_image` | |

### Structured Data in Use

| Schema type | Applied to | Implementation status |
|-------------|------------|----------------------|
| Organization | Homepage | [pending / live] |
| WebSite | Homepage | [pending / live] |
| Article | Blog posts | [pending / live] |
| FAQPage | [pages with FAQ sections] | [pending / live] |
| BreadcrumbList | All pages except homepage | [pending / live] |

### Redirect Map

| From | To | Type | Reason |
|------|-----|------|--------|
| [/old-slug] | [/new-slug] | 301 | [e.g., URL restructure] |

### Hreflang Configuration

| Locale | URL pattern | hreflang value |
|--------|-------------|----------------|
| [en-US] | [https://example.com/...] | `en-US` |
| [x-default] | [https://example.com/] | `x-default` |

---

## Content Calendar

| Publish date | Title / Topic | Type | Primary keyword | Status | Owner |
|-------------|--------------|------|----------------|--------|-------|
| [YYYY-MM-DD] | [Article title] | [blog/landing page/guide] | [keyword] | [draft/review/live] | [@copywriter-seo] |

---

## Changelog

| Date | Change |
|------|--------|
| [YYYY-MM-DD] | Initial content strategy — brand voice and keyword framework defined |
