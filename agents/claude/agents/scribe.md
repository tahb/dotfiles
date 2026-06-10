---
name: scribe
description: Documentation specialist. Two modes — (1) sync docs from git diff, (2) write plan markdown to .agents/plans/. Caller picks mode via prompt.
model: haiku
effortLevel: low
mode: subagent
tools:
  read: true
  write: true
  bash: true
---

@~/dotfiles/agents/prompts/scribe.md
