#!/usr/bin/env bash
# PreToolUse hook — blocks destructive shell commands before they execute.
# Reads the tool input JSON from stdin, inspects the command, and denies
# patterns that are irreversible or dangerous in a shared codebase.
#
# Exit behaviour:
#   exit 0          — allow the command
#   JSON + exit 2   — block the command and show the reason to Claude

set -euo pipefail

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // ""')

deny() {
  local reason="$1"
  jq -n \
    --arg reason "$reason" \
    '{
      hookSpecificOutput: {
        hookEventName: "PreToolUse",
        permissionDecision: "deny",
        permissionDecisionReason: $reason
      }
    }'
  exit 2
}

# ── Destructive filesystem operations ────────────────────────────────────────
if echo "$COMMAND" | grep -qE '(^|[;&|])\s*rm\s+-[a-zA-Z]*r[a-zA-Z]*f|rm\s+-[a-zA-Z]*f[a-zA-Z]*r'; then
  deny "Blocked: 'rm -rf' is irreversible. Use targeted 'rm' with explicit paths, or ask the human to confirm first."
fi

# ── Dangerous git operations ──────────────────────────────────────────────────
if echo "$COMMAND" | grep -qE 'git\s+push\s+.*--force|git\s+push\s+.*-f\b'; then
  deny "Blocked: 'git push --force' is not allowed. The orchestrator pushes branches; force-pushing risks overwriting shared history."
fi

if echo "$COMMAND" | grep -qE 'git\s+reset\s+--hard'; then
  deny "Blocked: 'git reset --hard' discards uncommitted work irreversibly. Use 'git stash' or commit before resetting."
fi

if echo "$COMMAND" | grep -qE 'git\s+clean\s+.*-f'; then
  deny "Blocked: 'git clean -f' permanently deletes untracked files. Ask the human to confirm before running this."
fi

# Direct pushes to main/master are handled by branch protection, but block at hook level too.
if echo "$COMMAND" | grep -qE 'git\s+push\s+(origin\s+)?(main|master)\b'; then
  deny "Blocked: direct push to main/master. Create a feature branch and open a PR instead."
fi

# ── Destructive SQL operations ────────────────────────────────────────────────
if echo "$COMMAND" | grep -qiE '\b(DROP\s+(TABLE|DATABASE|SCHEMA)|TRUNCATE\s+TABLE)\b'; then
  deny "Blocked: destructive SQL (DROP TABLE / TRUNCATE) detected. Database migrations must be reversible. Use ALTER/soft-delete patterns and ask the human to confirm schema drops."
fi

# ── Dangerous package operations ─────────────────────────────────────────────
if echo "$COMMAND" | grep -qE 'npm\s+publish|yarn\s+publish|pnpm\s+publish'; then
  deny "Blocked: publishing to npm requires explicit human approval. Ask the human to run this command manually."
fi

# Allow everything else
exit 0
