---
description: Database migration standards — applied to all SQL files and files in any migrations/ directory
globs: ["**/*.sql", "**/migrations/**", "**/migrate/**"]
---

# Database Migration Standards

## Core Rule: All Migrations Must Be Reversible

Every migration must have both an `up` and a `down` path. If you cannot write a safe `down`, you must explain why in a comment and get explicit human approval before proceeding.

## Naming Convention

```
YYYYMMDD_NNN_short_description.sql
```

Examples:
- `20240315_001_create_users_table.sql`
- `20240315_002_add_email_index_to_users.sql`
- `20240320_001_add_stripe_customer_id_to_users.sql`

`NNN` is a three-digit sequence scoped to the day. Reset to `001` each new day.

## Safety Rules

**Never in production migrations:**
- `DROP TABLE` without a preceding rename/archive step
- `DROP COLUMN` — add to a deprecation schedule, soft-remove first
- `TRUNCATE` — never in a migration
- Removing a `NOT NULL` constraint from a column with existing data without a data migration step
- Renaming a column or table without a compatibility window (add new, migrate data, deprecate old, then remove in a later migration)

**Always:**
- Wrap DDL in a transaction where the database supports transactional DDL (PostgreSQL does; MySQL does not)
- Add an index before enforcing a foreign key on a large table
- Use `IF NOT EXISTS` / `IF EXISTS` guards to make migrations idempotent
- Annotate non-obvious choices with SQL comments

## Index Guidelines

- Every foreign key column needs an index (unless it is the primary key)
- Compound indexes: most-selective column first
- `CREATE INDEX CONCURRENTLY` for indexes on tables with existing data in production (PostgreSQL)
- Name indexes explicitly: `idx_<table>_<columns>` — e.g., `idx_users_email`, `idx_orders_user_id_created_at`

## Data Migrations

Keep data migrations separate from schema migrations. A schema migration changes structure; a data migration backfills or transforms data. Running them separately makes rollback safer.

## Review Requirement

All migration files must be reviewed by `@database-expert` before merge. Schema changes are irreversible in production once data has been written — there is no "undo" in prod.
