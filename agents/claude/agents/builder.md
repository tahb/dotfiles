---
name: builder
description: Implementation agent. Runs inner loop — write, fast tests, fix, commit proposal. Scope must be locked before invoking.
model: sonnet
effortLevel: medium
tools:
  read: true
  write: true
  bash: true
---

@~/dotfiles/agents/prompts/build.md
