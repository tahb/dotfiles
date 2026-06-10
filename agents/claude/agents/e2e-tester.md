---
name: e2e-tester
description: E2E test subagent. Runs the project full E2E suite in the worktree and reports pass/fail counts and percentage.
model: haiku
effortLevel: medium
mode: subagent
tools:
  read: true
  write: false
  bash: true
---

@~/dotfiles/agents/prompts/e2e-tester.md
