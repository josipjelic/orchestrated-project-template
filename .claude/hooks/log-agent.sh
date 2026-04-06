#!/usr/bin/env bash
# SubagentStart hook — appends a timestamped entry to .claude/agent-log.txt
# every time a subagent is spawned. Provides an audit trail of which
# specialist agents ran during a session, useful for debugging orchestration
# issues and understanding what happened during a long multi-agent run.
#
# Log format (one line per agent invocation):
#   [YYYY-MM-DD HH:MM:SS] subagent_start  agent=<name>  session=<id>

set -uo pipefail

PROJECT_ROOT="${CLAUDE_PROJECT_DIR:-$(pwd)}"
LOG_FILE="$PROJECT_ROOT/.claude/agent-log.txt"

INPUT=$(cat)
AGENT_NAME=$(echo "$INPUT" | jq -r '.agent_name // .subagent_name // "unknown"' 2>/dev/null || echo "unknown")
SESSION_ID=$(echo "$INPUT"  | jq -r '.session_id // "unknown"' 2>/dev/null || echo "unknown")
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Ensure the log file exists (the .claude/ dir already exists by definition).
touch "$LOG_FILE"

echo "[$TIMESTAMP] subagent_start  agent=${AGENT_NAME}  session=${SESSION_ID}" >> "$LOG_FILE"

exit 0
