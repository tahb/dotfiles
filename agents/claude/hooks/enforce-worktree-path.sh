#!/usr/bin/env bash
# PreToolUse hook: reject `git worktree add` when target path is not under .agents/worktrees/

INPUT=$(cat)
CMD=$(printf '%s' "$INPUT" | jq -r '.tool_input.command // empty')

if [ -z "$CMD" ]; then
  exit 0
fi

if ! printf '%s' "$CMD" | grep -qE '(^|[[:space:]])(rtk[[:space:]]+)?git[[:space:]]+worktree[[:space:]]+add([[:space:]]|$)'; then
  exit 0
fi

if printf '%s' "$CMD" | grep -qE '\.agents/worktrees/'; then
  exit 0
fi

cat <<'EOF'
{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"Worktrees must live under .agents/worktrees/<slug>. Use: git worktree add .agents/worktrees/<TS>-<slug> -b task/<TS>-<slug>"}}
EOF
exit 0
