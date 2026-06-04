# Builder pipeline

Orchestrator passes `$PLAN` (plan file path).

## 1. Worktree

```bash
# SLUG = short kebab task name
SLUG="..."
CALLER=$(git rev-parse --abbrev-ref HEAD)
TS=$(date +%Y%m%d-%H%M%S)
WT="$(pwd)/.agents/worktrees/${TS}-${SLUG}"
git worktree prune
git worktree add -b "task/${TS}-${SLUG}" "$WT"
```

Store `$WT`, `$CALLER`, `$TS`, `$SLUG`. Use absolute paths or `git -C "$WT"`. No `cd`.

## 2. E2E test (red)

Add failing e2e/integration test in `$WT` for new/fixed behaviour. Confirm fails. Stays red until §6.

## 3. Build (TDD units)

- Invoke Skill `test-driven-development` for unit-level red → green → refactor.
- Implement per `$PLAN`.
- Report fast test results.
- Do NOT commit. Reviews run on uncommitted diff in `$WT`.

## 4. Fast code review

`subagent_type="local-reviewer"`, pass `$WT` + `$PLAN`. Reviewer reads `git -C "$WT" diff HEAD`.

- PASS → §5
- Issues → loop §3 (then re-run §4)

## 5. Review

`subagent_type="reviewer"`, pass `$WT` + `$PLAN`. Reviewer reads `git -C "$WT" diff HEAD`. Present report.

- Approve → §6
- Rework → loop §3 (then re-run §4, §5)

## 6. E2E pass check

Run project E2E suite in `$WT`. Show result.

- Pass → §7
- Fail → loop §3

## 7. Document

`subagent_type="scribe"`, pass `$WT`. No-ops if no doc changes.

## 8. Propose

Show proposed commit message + diff summary. Wait for approval.

- Reject → loop §3
- Approve → run:

```bash
git -C "$WT" add -A
git -C "$WT" commit -m "<plan title>"
SHA=$(git -C "$WT" rev-parse HEAD)
git checkout "$CALLER"
git cherry-pick "$SHA"
```

On conflict: `git cherry-pick --abort`, report to user, stop. Do not auto-resolve. Do not force.

## 9. Cleanup

Only after §8 cherry-pick clean.

```bash
git worktree remove "$WT"
git branch -D "task/${TS}-${SLUG}"
git worktree prune
```
