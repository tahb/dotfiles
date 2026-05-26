## Pipeline

All steps are mandatory. Cannot skip a step  under any scenario.

Scout > Plan > Plan gate >  Worktree  > Make E2E test > Implement (TDD) > Local code review  > Full code review > Check E2E pass >  Document > Propose > Cleanup

### 0. Scout

If task involves unfamiliar code, large scope, or needs codebase exploration, delegate to scout first.

Use task tool with subagent_type="scout". Pass: task description.

Scout returns structured research context. Feed it to Plan step.

### 1. Plan

Load @skills/plan.md. Use scout context if available. Execute plan step. Ask clarifying questions if underspecified. Save ordered task list to `./.agents/plans/`.

### 2. Plan Gate

Present the plan to the user. Summarise: what will be done, which files touched, risks, order.
Wait for explicit approval before continuing.

- User approves → proceed to Worktree (step 3)
- User rejects → stop
- User wants changes → loop back to step 1, incorporate feedback, re-present

Do NOT skip this step. Zero exceptions.

### 3. Worktree

Open a new git worktree before ANY code changes:

```bash
git worktree add -b task/{slug} ./.agents/worktrees/{slug}
cd ./.agents/worktrees/{slug}
```

All work happens inside it. Zero exceptions.

### 4. E2E Test

Write an e2e / integration test that covers the goal end-to-end before implementing.

### 5. Implement

Load @skills/test-driven-development.md. Load @skills/build.md coding rules. Implement per plan using TDD (red → green → refactor). Run tests after every logical change. ALL tests must pass.

After all tests pass, commit on task branch. Save the commit SHA for the reviewer.

### 6. Local Pre-Review (fast, free)

Run a fast local pre-review before spending tokens on the expensive reviewer.
Use task tool with subagent_type="local-reviewer". Pass: commit SHA.

Local reviewer returns PASS or specific critical issues.

- PASS → proceed to Review (step 7)
- Issues → loop back to Implement (step 5), fix, re-commit, re-run pre-review

### 7. Review

Delegate full review to the reviewer subagent. Use task tool with subagent_type="reviewer".
Pass: commit SHA, plan path.

Reviewer returns structured report. Present to user. Ask: approve or rework?

- User approves → proceed to Document (step 8)
- User wants rework → loop back to Implement (step 5), fix, re-commit, re-run pre-review (step 6)

### 8. Check e2e tests pass

You should have already added a failing spec before starting. Does this pass?

Does all other e2e tests pass? Prevent regressions.

### 9. Document

Delegate documentation to the scribe subagent. Use task tool with subagent_type="scribe".
Pass: commit SHA.

Scribe returns doc update summary.

### 10. Propose

Present commit proposal to user. Show: commit message, diff summary, review findings, test results.

Wait for explicit approval before cherry-picking to main.

- User approves → cherry-pick commit from task branch to main
- User rejects → loop back to Implement (step 5) with feedback

### 11. Cleanup

After cherry-pick to main, delete task branch, prune worktree: `git worktree prune`.
