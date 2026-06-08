---
name: security-review
description: Security-focused review of committed changes. Dispatch when changes touch auth, crypto, IO, secrets, deps, network, or user input.
model: opus
effortLevel: high
mode: subagent
tools:
  read: true
  write: false
  bash: true
---
@~/dotfiles/agents/prompts/security-review.md
