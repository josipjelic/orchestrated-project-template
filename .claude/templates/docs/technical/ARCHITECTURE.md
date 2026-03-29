<!--
DOCUMENT METADATA
Owner: @systems-architect
Update trigger: System architecture changes, new integrations, component additions
Update scope:
  @systems-architect: Entire document
  @frontend-developer: May append to "Frontend Architecture" (never overwrite)
  @backend-developer: May append to "Backend Architecture" (never overwrite)
Read by: All agents. Always read before making implementation decisions.
For design tokens, component specs, and UX flows see DESIGN_SYSTEM.md (@ui-ux-designer).
-->

# System Architecture

> Last updated: [YYYY-MM-DD]
> Version: [x.x.x]

---

## Overview

[2–3 paragraph description of the system — what it does, how the main components relate, and the key architectural choices that define it.]

```
[ASCII diagram of system components and their relationships]

  [Client]
     │
     ▼
[Frontend App] ──── [API Layer] ──── [Database]
                        │
                   [External Services]
```

---

## Tech Stack

| Layer | Technology | Version | Why Chosen |
|-------|-----------|---------|------------|
| Frontend | [e.g., Next.js] | [14.x] | [e.g., SSR, App Router, strong ecosystem] |
| Styling | [e.g., Tailwind CSS] | [3.x] | |
| Backend | [e.g., Node.js / Fastify] | [x.x] | |
| Database | [e.g., PostgreSQL] | [15] | |
| ORM | [e.g., Prisma] | [x.x] | |
| Auth | [e.g., NextAuth.js] | [x.x] | |
| Hosting | [e.g., Railway] | | |
| CI/CD | [e.g., GitHub Actions] | | |

---

## System Components

### Frontend Architecture

[Describe the frontend component hierarchy, routing approach, and state management strategy.]

**Routing**: [e.g., Next.js App Router — pages defined in `src/app/`]

**State management**: [e.g., React Query for server state, Zustand for client state]

**Component structure**:
```
src/components/
  ui/           # Primitive UI elements (Button, Input, Modal, etc.)
  features/     # Feature-specific composite components
  layouts/      # Page layout wrappers
```

**Data fetching pattern**: [e.g., Server Components for initial data, React Query for client-side mutations]

---

### Backend Architecture

[Describe the server-side structure — routing, middleware, service layers, and key patterns.]

**API style**: [e.g., REST, route handlers in Next.js `src/app/api/`]

**Middleware stack**:
1. [e.g., Authentication — validates JWT/session on protected routes]
2. [e.g., Request validation — validates body against Zod schemas]
3. [e.g., Error handler — formats errors before sending to client]

**Service layer pattern**: [How business logic is organized — e.g., thin controllers, service files in `src/lib/services/`]

---

### Infrastructure

**Environments**:
| Environment | URL | Branch | Notes |
|-------------|-----|--------|-------|
| Production | [URL] | `main` | Auto-deploys on merge |
| Staging | [URL] | `staging` | Auto-deploys on merge |
| Local | `localhost:3000` | any | `npm run dev` |

**CI/CD**: [e.g., GitHub Actions — runs lint, typecheck, unit tests, and E2E tests on every PR. Deploys on merge to main.]

---

## Data Flow

### [Key Flow 1: e.g., User Authentication]

```
1. User submits credentials
2. [Auth handler] validates input
3. [Auth service] checks credentials against database
4. On success: session token created and stored
5. Client receives session cookie
6. Subsequent requests include cookie — middleware validates on each request
```

### [Key Flow 2: e.g., Main Feature Flow]

```
[Describe the data flow for the core feature]
```

---

## Design system and UX

The canonical **design system** (tokens, typography, spacing, component inventory, interaction patterns) and **UX flow summaries** live in [`DESIGN_SYSTEM.md`](./DESIGN_SYSTEM.md). That file is owned by @ui-ux-designer. Other agents: read-only — do not edit it unless you are @ui-ux-designer.

---

## Security Architecture

**Authentication model**: [e.g., JWT session tokens stored in httpOnly cookies]

**Authorization**: [e.g., Role-based — roles stored in user table. Middleware checks role on protected routes.]

**Data protection**:
- [e.g., Passwords hashed with bcrypt (cost factor 12)]
- [e.g., PII encrypted at rest using AES-256]

**Key security decisions**: See `docs/technical/DECISIONS.md` for rationale behind auth choices.

---

## Performance Considerations

- [e.g., React Query caches API responses — stale time 5 minutes for reference data]
- [e.g., Images served via CDN with automatic optimization]
- [e.g., Database queries use indexes on all FK columns — see DATABASE.md]

---

## Known Constraints and Technical Debt

| Item | Impact | Plan |
|------|--------|------|
| [e.g., No background job queue yet] | [Scheduled tasks run inline] | [Planned: add BullMQ in v2] |
| [Tech debt item] | [Impact] | [Resolution plan] |
