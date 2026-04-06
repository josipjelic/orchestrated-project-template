---
description: Test file standards — applied to all spec and test files
globs: ["**/*.spec.ts", "**/*.spec.tsx", "**/*.test.ts", "**/*.test.tsx", "**/tests/**"]
---

# Test Standards

## E2E Tests (Playwright)

**Page Object Model** — every page or significant component gets a Page Object class in `tests/e2e/pages/`. Tests interact with the page through the Page Object, never with raw selectors.

```typescript
// Good
const loginPage = new LoginPage(page);
await loginPage.login(email, password);

// Bad
await page.fill('[data-testid="email-input"]', email);
await page.fill('[data-testid="password-input"]', password);
await page.click('[data-testid="login-button"]');
```

**Selectors** — always use `data-testid` attributes. Never select by CSS class, element type, or visible text (these break when design changes).

```typescript
// Good
page.getByTestId('submit-button')

// Bad
page.locator('.btn-primary')
page.locator('button:has-text("Submit")')
```

**Test isolation** — each test must be fully independent. Use `beforeEach` to set up state, never rely on test execution order.

## Unit Tests (Vitest)

- Tests are colocated with source files: `src/lib/utils.ts` → `src/lib/utils.test.ts`
- One `describe` block per function or class being tested
- Test names follow: `"[function name] [condition] [expected result]"` — e.g., `"formatPrice with zero returns '$0.00'"`
- Mock at the boundary — mock external services and I/O, not internal implementation details

## Rules That Apply to All Test Files

**No `test.only` or `describe.only`** — these silently skip all other tests in CI. This is a blocking issue in code review.

**No `// eslint-disable`** in test files — if you need to bypass a rule in a test, the test is probably structured incorrectly.

**Assertions must be explicit** — `expect(value).toBe(true)` tells you nothing when it fails. Use specific matchers: `expect(value).toEqual(expectedObject)`, `expect(fn).toThrow(SpecificError)`.

**Coverage target: 80%** for new features. Below 80% on a new feature is a review blocker. Existing files below 80% are tracked in TODO.md — do not reduce coverage further.

## Test Data

- Use factory functions or fixtures, never hardcode test user IDs or magic strings across test files.
- Prefix test-only email addresses with `test+` to make them identifiable in logs.
- Never use real production data, even anonymised, in test fixtures.
