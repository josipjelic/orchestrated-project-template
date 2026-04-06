#!/usr/bin/env bash
# PostToolUse hook — runs the project formatter/linter on the file that was
# just written or edited. Gracefully no-ops when tooling is not yet installed.
#
# Supported toolchains (detected from project root):
#   prettier   — .prettierrc / .prettierrc.json / .prettierrc.js / prettier.config.*
#   eslint     — .eslintrc* / eslint.config.*
#   ruff       — ruff.toml / pyproject.toml with [tool.ruff]
#   black      — pyproject.toml with [tool.black]
#   gofmt      — *.go files (gofmt is always available in Go projects)
#
# Exit 0 always — formatting failures are advisory, not blockers.

set -uo pipefail

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.path // ""')

# No file path in the event — nothing to format.
[[ -z "$FILE_PATH" ]] && exit 0

# File must exist and be a regular file.
[[ ! -f "$FILE_PATH" ]] && exit 0

PROJECT_ROOT="${CLAUDE_PROJECT_DIR:-$(git -C "$(dirname "$FILE_PATH")" rev-parse --show-toplevel 2>/dev/null || pwd)}"
EXT="${FILE_PATH##*.}"

run_if_available() {
  local cmd="$1"
  shift
  if command -v "$cmd" &>/dev/null; then
    "$cmd" "$@" 2>/dev/null || true
  fi
}

# ── JavaScript / TypeScript ───────────────────────────────────────────────────
if [[ "$EXT" =~ ^(js|jsx|ts|tsx|mjs|cjs|json|css|scss|md|mdx|html|yaml|yml)$ ]]; then
  # Prettier (format first, then lint)
  if [[ -f "$PROJECT_ROOT/.prettierrc" || \
        -f "$PROJECT_ROOT/.prettierrc.json" || \
        -f "$PROJECT_ROOT/.prettierrc.js" || \
        -f "$PROJECT_ROOT/.prettierrc.yaml" || \
        -f "$PROJECT_ROOT/.prettierrc.yml" || \
        -f "$PROJECT_ROOT/prettier.config.js" || \
        -f "$PROJECT_ROOT/prettier.config.mjs" || \
        -f "$PROJECT_ROOT/prettier.config.ts" ]]; then
    run_if_available npx prettier --write "$FILE_PATH"
  fi

  # ESLint (fix auto-fixable issues)
  if [[ "$EXT" =~ ^(js|jsx|ts|tsx|mjs|cjs)$ ]]; then
    if [[ -f "$PROJECT_ROOT/.eslintrc" || \
          -f "$PROJECT_ROOT/.eslintrc.json" || \
          -f "$PROJECT_ROOT/.eslintrc.js" || \
          -f "$PROJECT_ROOT/.eslintrc.yaml" || \
          -f "$PROJECT_ROOT/.eslintrc.yml" || \
          -f "$PROJECT_ROOT/eslint.config.js" || \
          -f "$PROJECT_ROOT/eslint.config.mjs" || \
          -f "$PROJECT_ROOT/eslint.config.ts" ]]; then
      run_if_available npx eslint --fix "$FILE_PATH"
    fi
  fi
fi

# ── Python ────────────────────────────────────────────────────────────────────
if [[ "$EXT" == "py" ]]; then
  HAS_RUFF=false
  HAS_BLACK=false

  if [[ -f "$PROJECT_ROOT/ruff.toml" ]]; then
    HAS_RUFF=true
  elif [[ -f "$PROJECT_ROOT/pyproject.toml" ]] && grep -q '\[tool\.ruff\]' "$PROJECT_ROOT/pyproject.toml" 2>/dev/null; then
    HAS_RUFF=true
  fi

  if [[ -f "$PROJECT_ROOT/pyproject.toml" ]] && grep -q '\[tool\.black\]' "$PROJECT_ROOT/pyproject.toml" 2>/dev/null; then
    HAS_BLACK=true
  fi

  if [[ "$HAS_RUFF" == "true" ]]; then
    run_if_available ruff check --fix "$FILE_PATH"
    run_if_available ruff format "$FILE_PATH"
  elif [[ "$HAS_BLACK" == "true" ]]; then
    run_if_available black "$FILE_PATH"
  fi
fi

# ── Go ────────────────────────────────────────────────────────────────────────
if [[ "$EXT" == "go" ]]; then
  run_if_available gofmt -w "$FILE_PATH"
fi

# ── Rust ─────────────────────────────────────────────────────────────────────
if [[ "$EXT" == "rs" ]]; then
  run_if_available rustfmt "$FILE_PATH"
fi

exit 0
