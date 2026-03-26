# [Project Name]

> [One-sentence description of what this project does and who it's for.]

---

## Overview

[2–3 paragraphs describing the project in detail. What problem does it solve? Who uses it? Why does it exist? What makes it different from alternatives?]

---

## Tech Stack

| Layer | Technology | Notes |
|-------|-----------|-------|
| Frontend | [e.g., Next.js 14, React 18, TypeScript] | [e.g., App Router] |
| Styling | [e.g., Tailwind CSS, shadcn/ui] | |
| Backend | [e.g., Node.js, Fastify] | |
| Database | [e.g., PostgreSQL 15] | |
| ORM | [e.g., Prisma] | |
| Auth | [e.g., NextAuth.js] | |
| Hosting | [e.g., Railway, Vercel, Fly.io] | |
| CI/CD | [e.g., GitHub Actions] | |

---

## Getting Started

### Prerequisites

- Node.js [x.x.x]+ (see `.nvmrc`)
- [Package manager: npm / pnpm / yarn]
- [e.g., PostgreSQL 15 running locally, or Docker]
- [Any other prerequisites]

### Installation

```bash
# Clone the repository
git clone https://github.com/[org]/[repo].git
cd [repo]

# Install dependencies
[npm install]

# Copy environment variables
cp .env.example .env.local
# Edit .env.local and fill in required values
```

### Running Locally

```bash
# Start the development server
[npm run dev]
```

Open [http://localhost:3000](http://localhost:3000) in your browser.

### Running Tests

```bash
# Unit tests
[npm test]

# E2E tests (requires dev server running)
[npm run test:e2e]

# Type checking
[npm run typecheck]
```

---

## Project Structure

```
[project-root]/
├── src/
│   ├── app/              # [e.g., Next.js App Router pages and layouts]
│   ├── components/       # Shared UI components
│   └── lib/              # Utilities, helpers, shared logic
├── tests/
│   └── e2e/              # Playwright E2E tests
├── docs/
│   ├── user/             # User-facing documentation
│   └── technical/        # Architecture, API, database docs
├── .claude/agents/       # Claude Code specialist agents
├── public/               # Static assets
├── PRD.md                # Product requirements (source of truth)
├── TODO.md               # Project backlog
└── CLAUDE.md             # Claude AI instructions
```

---

## Environment Variables

| Variable | Required | Description |
|----------|----------|-------------|
| `DATABASE_URL` | Yes | PostgreSQL connection string |
| `[NEXTAUTH_SECRET]` | Yes | [Auth secret] |
| `[NEXTAUTH_URL]` | Yes | [App base URL] |
| `[OTHER_VAR]` | No | [Description] |

See `.env.example` for all available variables.

---

## Deployment

[Describe the deployment process. E.g.:]

The application deploys automatically via GitHub Actions on merge to `main`.

- **Production**: [URL]
- **Staging**: [URL]

Manual deployment:
```bash
[npm run build]
[deployment command]
```

---

## License

[MIT / proprietary / other] — see [LICENSE](LICENSE)
