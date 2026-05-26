---
name: review-branch
description: Automate branch review in isolated worktree.
---
# Workflow

1. Get `<branch_name>` from user.
2. Run: `git worktree add ./tmp/review-<branch_name> <branch_name>`.
3. Change directory to `./tmp/review-<branch_name>`.
4. Call `requesting-code-review` skill.
5. Review done? Run:
   - `git worktree remove ./tmp/review-<branch_name>`
   - `git branch -d review-<branch_name>`
6. Deliver feedback to primary agent
