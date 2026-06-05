# Builder pipeline

Orchestrator passes `$PLAN` (plan file path) AFTER plan gate. Do not start §1 without explicit "plan approved" signal.

## 0. Gate check

- `$PLAN` present + readable.
- Orchestrator confirms user approval.
- Missing → abort, ask orchestrator.

## 1. Worktree

```bash
SLUG="..."  # short kebab task name
CALLER=$(git rev-parse --abbrev-ref HEAD)
TS=$(date +%Y%m%d-%H%M%S)
WT="$(pwd)/.agents/worktrees/${TS}-${SLUG}"
git worktree prune
git worktree add -b "task/${TS}-${SLUG}" "$WT"
echo "***************"
echo "worktree: $WT"
echo "***************"
```

Store `$WT`, `$CALLER`, `$TS`, `$SLUG`. Absolute paths or `git -C "$WT"`. No `cd`.

## 2. E2E test (red)

Add failing e2e/integration test in `$WT` for new/fixed behaviour. Confirm fails. Stays red until §7.

## 3. Build (TDD units)

- Invoke Skill `test-driven-development` for unit red → green → refactor.
- Implement per `$PLAN`.
- Report fast test results.

## 4. Commit (task branch)

Show proposed commit message + diff summary. Wait for approval.

Commit format: `<type>: <description>` — no scope. Pick type:
- `feat:` — new user-visible feature
- `fix:` — bug fix
- `refactor:` — no behaviour change
- `test:` — test-only change
- `chore:` — build, deps, config
- `docs:` — documentation only

- Reject → loop §3.
- Approve →

```bash
git -C "$WT" add -A
git -C "$WT" commit -m "<type>: <description>"
SHA=$(git -C "$WT" rev-parse HEAD)
```

Commit lands on `task/${TS}-${SLUG}`, not `$CALLER`.

## 5. Fast code review

`subagent_type="local-reviewer"`, pass `$WT`, `$PLAN`, `$SHA`. Reviewer reads `git -C "$WT" show $SHA`.

- PASS → §6.
- Issues → loop §3 (atomic fix commit, new `$SHA`, re-run §5).

## 6. Deep review

`subagent_type="reviewer"`, pass `$WT`, `$PLAN`, latest `$SHA`. Present full report to user.

### 6a. Critical — auto-fix

If Critical issues present: loop §3 fixing Critical only. Atomic fix commit, new `$SHA`. Re-run §5, §6. Repeat until no Critical.

### 6b. Important — STOP, ask user

After no Critical, if Important issues remain:

- Ask: "Important issues:\n[list]\nFix? (all / selected <nums> / skip / abort)".
- **all** → loop §3 fixing all Important. Re-run §5, §6.
- **selected N,M** → loop §3 fixing only listed. Append unfixed to `./.agents/followups/${TS}-${SLUG}.md`. Re-run §5, §6.
- **skip** → append all Important to followups file. Proceed §7.
- **abort** → stop pipeline. Leave worktree.

### 6c. Minor — always defer

Append all Minor issues to `./.agents/followups/${TS}-${SLUG}.md`. Never auto-fix. Never ask.

### 6d. Clean exit

No Critical + no Important (or all resolved) → §7.

## 7. E2E pass check

Run project E2E suite in `$WT`. Show result.

- Pass → §8.
- Fail → loop §3.

## 8. Document

`subagent_type="scribe"`, pass `$WT` + `$CALLER`. Scribe runs `git -C "$WT" diff $CALLER..HEAD`. No-op if no doc changes. New commit on task branch if updates.

## 9. Cherry-pick to caller

```bash
git checkout "$CALLER"
git -C "$(git rev-parse --show-toplevel)" cherry-pick "task/${TS}-${SLUG}"
```

Conflict → `git cherry-pick --abort`, report, stop. No auto-resolve. No force.

## 10. Cleanup

Only after §9 clean.

```bash
git worktree remove "$WT"
git branch -D "task/${TS}-${SLUG}"
git worktree prune
```
