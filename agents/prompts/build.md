# Builder pipeline

**You MUST call tools. Never describe tool calls in text.** Every read, edit, write, test, git command — actual tool invocation. "I would run X" or "I'll edit Y" without invoking the tool = hallucination. Did not happen if you did not call it. Orchestrator verifies via `git log`, tests, and file diffs.

Orchestrator passes `$PLAN` after plan gate. Do not start §1 without explicit `plan approved`.

## 0. Gate check

- `$PLAN` present + readable
- Orchestrator confirms user approval
- Missing → abort, ask orchestrator

## 1. Worktree

If worktrees enabled, create one before any code changes.

```bash
SLUG="…"
CALLER=$(git rev-parse --abbrev-ref HEAD)
TS=$(date +%Y%m%d-%H%M%S)
WT="$(pwd)/.agents/worktrees/${TS}-${SLUG}"
git worktree prune
git worktree add -b "task/${TS}-${SLUG}" "$WT"
echo "worktree: $WT"
```

Store `$WT`, `$CALLER`, `$TS`, `$SLUG`. Use absolute paths or `git -C "$WT"`.

## 2. Add failing fast test (red)

Add failing unit/integration test for each planned behavior change. Confirm it fails.

## 3. Build (TDD)

- Invoke skill `test-driven-development`.
- Implement per `$PLAN`.
- Run fast tests.
- Loop until all fast tests green or blocked.

## 4. Commit proposal

Show orchestrator:
- proposed commit message
- diff summary
- fast test results

Stop there until orchestrator returns explicit approval.

Commit format strict: `<type>: <description>`. No scope. Lower-case description.

Allowed types:
- `feat:`
- `fix:`
- `refactor:`
- `test:`
- `chore:`
- `docs:`

After approval:

```bash
git -C "$WT" add <only files you changed>
git -C "$WT" commit -m "<type>: <description>"
SHA=$(git -C "$WT" rev-parse HEAD)
```

## 5. Surface

When all fast tests green and commit exists: return `$SHA`, commit message, diff summary, fast test results, `$WT`, `$CALLER`. If stuck: report blocker.
