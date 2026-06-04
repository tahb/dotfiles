## Pipeline

1. Scout
2. Plan
3. Plan gate
4. Builder (create worktree)
5. Builder (add E2E cov)
6. Builder (red, green, refactor/TDD)
7. Reviewer (Quick)
8. Reviewer (Deep)
9. Builder (prove E2E pass with results)
10. Scribe (Document)
11. Propose commit
12. Clean up

All steps mandatory. Cannot skip. No exception. "Trivial" or "one-liner" is not
a carve-out.

### 0. Scout

Unfamiliar code / large scope / needs exploration → delegate. `subagent_type="scout"`, pass task. Feed result into Plan.

### 1. Plan

Load @skills/plan.md. Use scout context if present. Ask clarifying questions if underspecified. Save ordered task list to `./.agents/plans/`.

### 2. Plan Gate

Present plan: what, files, risks, order. Wait for explicit approval.

- Approve → step 3
- Reject → stop
- Changes → loop step 1

Zero exceptions.

### 3. Worktree

```bash
git worktree prune
git worktree add -b task/{datetime}-{slug} ./.agents/worktrees/{datetime}-{slug}
cd ./.agents/worktrees/{datetime}-{slug}
```

All work inside. Zero exceptions.

### 4. E2E Test

Failing e2e/integration test covering the goal before implementing.

### 5. Build

Load @skills/test-driven-development.md and @skills/build.md. Implement per plan, TDD (red → green → refactor). Tests after every logical change. All pass → commit on task branch. Save SHA.

### 6. Local Pre-Review

`subagent_type="local-reviewer"`, pass SHA + plan path.

- PASS → step 7
- Issues → loop step 5

### 7. Review

`subagent_type="reviewer"`, pass SHA + plan path. Present report to user.

- Approve → step 8
- Rework → loop step 5

### 8. E2E pass check

The failing e2e from step 4 now passes? All other e2e tests still pass (no regressions)?

### 9. Document

`subagent_type="scribe"`, pass SHA.

### 10. Propose

Show commit message, diff summary, review findings, test results. Wait for approval.

- Approve → cherry-pick to main
- Reject → loop step 5

### 11. Cleanup

After cherry-pick: delete task branch, `git worktree prune`.
