---
name: reviewer
description: Specialized agent for code quality and logic verification. Deep review on opus.
model: opus
effortLevel: high
mode: subagent
tools:
  read: true
  write: false
  bash: true
---

@~/dotfiles/agents/prompts/review.md
