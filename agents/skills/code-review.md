---
name: code-review
description: Review completed changes against the plan. Identify issues before they cascade.
---

Review code changes against the plan. Read-only. No code changes.

## Inputs

Use only:

- Plan / inline plan
- `git diff --stat BASE..HEAD`
- `git diff --find-renames BASE..HEAD`
- Relevant Scout artifact, if provided

Do not reread unchanged files unless needed to verify behavior. If you do, state why.

## Budget

- Output <=1200 tokens.
- Findings only. No praise.
- Prefer concrete file:line issues over broad commentary.

## What to Check

**Plan alignment:** Implementation match the plan? Deviations justified? All planned functionality present?

**Correctness:** Edge cases, error handling, type safety, async/race behavior, data integrity.

**Architecture:** Sound design decisions? Performance concerns? Security issues? Integrates cleanly with surrounding code?

**Testing:** Tests verify real behaviour? Edge cases covered? Integration tests where they matter? Relevant tests passing?

**Production readiness:** Migration strategy if schema changed? Backward compatibility? Documentation?

## Output Format

### Findings

#### Critical (Must Fix)
[Bugs, security, data loss — file:line, what's wrong, why it matters, how to fix]

#### Important (Should Fix)
[Architecture, missing features, poor error handling, test gaps]

#### Minor (Nice to Have)
[Style, optimisation, docs polish]

### Assessment
**Verdict:** [Ready | Needs fixes]
**Reasoning:** [1-2 sentences]

## Rules

- Categorise by actual severity. Not everything is Critical.
- Be specific: file:line, why, fix.
- No strengths section.
- Give a clear verdict. No fence-sitting.
- Don't mark nitpicks as Critical.
- Read-only — no code changes.
