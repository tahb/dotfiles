---
name: scout
description: Read-only codebase exploration agent. Finds relevant files, patterns, dependencies, and risks before planning.
model: haiku
effortLevel: medium
mode: subagent
tools:
  read: true
  write: false
  bash: true
---

@~/dotfiles/agents/prompts/scout.md
