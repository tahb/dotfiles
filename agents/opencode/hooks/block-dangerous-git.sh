#!/bin/bash
# Shell wrapper for opencode: blocks dangerous git commands.
# Replaces /bin/bash via opencode.json "shell" config.
# Called as: wrapper.sh -c "command"
# If command matches dangerous pattern -> blocked.
# Otherwise -> exec real shell.

REAL_SHELL="/bin/bash"

if [ "$1" = "-c" ]; then
  COMMAND="$2"

  DANGEROUS_PATTERNS=(
    "git push"
    "git reset --hard"
    "git clean -fd"
    "git clean -f"
    "git branch -D"
    "git checkout \."
    "git restore \."
    "push --force"
    "reset --hard"
  )

  for pattern in "${DANGEROUS_PATTERNS[@]}"; do
    if echo "$COMMAND" | grep -qE "$pattern"; then
      echo "BLOCKED: '$COMMAND' matches dangerous pattern '$pattern'. The user has prevented you from doing this." >&2
      exit 2
    fi
  done
fi

exec "$REAL_SHELL" "$@"
