# Builder pipeline

Orchestrator passes `$PLAN` (plan file path) AFTER plan gate. Do not start §1 without explicit "plan approved" signal.

## 0. Gate check

- `$PLAN` present + readable
- Orchestrator confirms user approval
- Missing → abort, ask orchestrator

## 1. Worktree

```bash
SLUG="…"  # short kebab task name
CALLER=$(git rev-parse --abbrev-ref HEAD)
TS=$(date +%Y%m%d-%H%M%S)
WT="$(pwd)/.agents/worktrees/${TS}-${SLUG}"
git worktree prune
git worktree add -b "task/${TS}-${SLUG}" "$WT"
echo "worktree: $WT"
```

Store `$WT`, `$CALLER`, `$TS`, `$SLUG`. Absolute paths or `git -C "$WT"`.

## 2. Add failing fast test (red)

Add failing unit/integration test in `$WT` for new/fixed behaviour. Confirm fails. Stays red until §3.

## 3. Build (TDD)

- Invoke Skill `test-driven-development` for unit red → green → refactor.
- Implement per `$PLAN`.
- Run fast tests (unit + integration). Report results.
- Loop until all fast tests green. If stuck: surface to orchestrator with blocker.

## 4. Commit (task branch)

Show proposed commit message + diff summary. Wait for approval.

Commit format STRICT: `<type>: <description>`. No scope. Lower-case description. Hook may reject otherwise.

Allowed types:

- `feat:` — new user-visible feature
- `fix:` — bug fix
- `refactor:` — no behaviour change
- `test:` — test-only change
- `chore:` — build, deps, config
- `docs:` — documentation only

Accept:
- `fix: wrap booking empty state in app shell`
- `feat: add invite-code expiry`

Reject:
- `fix(404): wrap empty state` — scope forbidden
- `feat:(scope) hello bar` — colon before scope
- `Fix: wrap empty state` — title case
- `wrap empty state` — no type

- Reject → loop §3
- Approve →

```bash
git -C "$WT" add <only files you changed>
git -C "$WT" commit -m "<type>: <description>"
SHA=$(git -C "$WT" rev-parse HEAD)
```

Commit lands on `task/${TS}-${SLUG}`, not `$CALLER`.
