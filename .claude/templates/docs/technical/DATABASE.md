<!--
DOCUMENT METADATA
Owner: @database-expert
Update trigger: Any schema change, migration, index addition, or significant query pattern decision
Update scope: Full document
Read by: @backend-developer (to write queries), @systems-architect (for scaling and architecture decisions)
-->

# Database Reference

> **Engine**: [PostgreSQL 15]
> **ORM / Query layer**: [e.g., Prisma / Drizzle / raw SQL]
> **Connection**: Via `DATABASE_URL` environment variable (see `.env.example`)
> **Last updated**: [YYYY-MM-DD]

---

## Schema Overview

[Entity-relationship description. Describe the main entities and how they relate to each other.]

```
[ASCII ERD]

users ──< sessions
  │
  └──< [resource] ──< [child resource]
```

**Key relationships**:
- `users` → `sessions`: one user can have many sessions
- `users` → `[resource]`: [description]

---

## Tables

---

### users

**Purpose**: Stores all user accounts. Core authentication entity.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | uuid | PK, NOT NULL, DEFAULT gen_random_uuid() | Primary key |
| email | text | NOT NULL, UNIQUE | User's email address (login identifier) |
| password_hash | text | NOT NULL | bcrypt hash of the password — never store plaintext |
| name | text | NOT NULL | Display name |
| role | text | NOT NULL, DEFAULT 'user' | User role: 'user' or 'admin' |
| email_verified_at | timestamptz | NULL | NULL until email is verified |
| created_at | timestamptz | NOT NULL, DEFAULT now() | Record creation time |
| updated_at | timestamptz | NOT NULL, DEFAULT now() | Last modification time |

**Indexes**:
- `idx_users_email` on `(email)` — frequent lookup by email at login

**Notes**: Soft deletes not used — accounts are hard-deleted. Ensure all related records are cascade-deleted.

---

### sessions

**Purpose**: Active authentication sessions for logged-in users.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | uuid | PK, NOT NULL, DEFAULT gen_random_uuid() | Session token (used as Bearer token) |
| user_id | uuid | NOT NULL, FK → users.id ON DELETE CASCADE | The authenticated user |
| expires_at | timestamptz | NOT NULL | Session expiry time |
| created_at | timestamptz | NOT NULL, DEFAULT now() | Session creation time |
| user_agent | text | NULL | Browser/client identifier |
| ip_address | inet | NULL | Client IP at session creation |

**Indexes**:
- `idx_sessions_user_id` on `(user_id)` — list sessions per user
- `idx_sessions_expires_at` on `(expires_at)` — efficient cleanup of expired sessions

**Relationships**:
- `user_id` → `users.id` (ON DELETE CASCADE — deleting a user removes all their sessions)

---

### [table_name]

**Purpose**: [What this table stores and why]

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | uuid | PK, NOT NULL, DEFAULT gen_random_uuid() | Primary key |
| [column] | [type] | [constraints] | [description] |
| created_at | timestamptz | NOT NULL, DEFAULT now() | |
| updated_at | timestamptz | NOT NULL, DEFAULT now() | |

**Indexes**: [None / list with reason for each]

**Relationships**: [None / list FK relationships]

**Notes**: [Denormalization decisions, soft-delete patterns, business rules in constraints]

---

## Migrations Log

| Migration File | Date | Description | Reversible | Deployment Risk |
|----------------|------|-------------|------------|-----------------|
| `001_create_users.sql` | [YYYY-MM-DD] | Create users table | Yes | None |
| `002_create_sessions.sql` | [YYYY-MM-DD] | Create sessions table | Yes | None |

---

## Query Patterns

### Common Patterns

**Get user by email (login)**:
```sql
SELECT id, email, password_hash, role
FROM users
WHERE email = $1
LIMIT 1;
```
Uses `idx_users_email` index — fast.

**Validate session token**:
```sql
SELECT s.user_id, u.email, u.role
FROM sessions s
JOIN users u ON u.id = s.user_id
WHERE s.id = $1
  AND s.expires_at > now();
```

**Cleanup expired sessions** (run as scheduled job):
```sql
DELETE FROM sessions
WHERE expires_at < now();
```

---

## Known Issues & Tech Debt

| Issue | Impact | Plan |
|-------|--------|------|
| [e.g., No soft deletes on users] | [Hard deletes lose audit trail] | [Consider adding `deleted_at` in v2] |
