---
description: TypeScript coding standards — applied to all .ts and .tsx files
globs: ["**/*.ts", "**/*.tsx"]
---

# TypeScript Standards

## Type Safety

- **No `any`** — use `unknown` and narrow it, or define an explicit type. `any` is a type bug waiting to happen.
- **No type assertions (`as Foo`)** unless you have verified the shape at runtime. If you must assert, add a comment explaining why the assertion is safe.
- **Strict null checks are on** — never assume a value is non-null without a guard. Use optional chaining (`?.`) and nullish coalescing (`??`), not `!` (non-null assertion).
- **Explicit return types** on exported functions — this documents contracts and catches drift early.

## Imports

- Use absolute imports from `src/` (configured in `tsconfig.json` paths).
- Group imports: external packages first, then internal `src/` imports, then relative imports. Separate each group with a blank line.
- No barrel files (`index.ts` re-exports) that create circular dependencies.

## Functions and Components

- Functions do one thing. If the function name contains "and", split it.
- No functions longer than 40 lines — extract helpers.
- React components: prefer named exports over default exports (named exports are easier to refactor and import).
- **No `console.log`** in production code — use the project logger utility. `console.error` in error boundaries only.

## Error Handling

- Never swallow errors silently (`catch (e) {}`). Either handle, rethrow, or log with context.
- Async functions that can fail must either return `Result<T, E>` or throw with a typed error class — not raw strings.
- Use `try/catch` at service boundaries, not inside tight loops.

## No Commented-Out Code

Delete unused code — don't comment it out. If it might be needed, track it in TODO.md. Commented-out code creates noise and false confidence.
