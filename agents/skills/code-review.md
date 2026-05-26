---
name: code-review
description: Review completed changes against the plan. Identify issues before they cascade.
---

Review code changes against the plan. Read-only. No code changes.

## What to Check

**Plan alignment:** Implementation match the plan? Deviations justified? All planned functionality present?

**Code quality:** Clean separation? Proper error handling? Type safety? DRY without premature abstraction? Edge cases handled?

**Architecture:** Sound design decisions? Performance concerns? Security issues? Integrates cleanly with surrounding code?

**Testing:** Tests verify real behaviour (not mocks)? Edge cases covered? Integration tests where they matter? All passing?

**Production readiness:** Migration strategy if schema changed? Backward compatibility? Documentation?

## Output Format

### Strengths
[What's well done? Be specific.]

### Issues

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
- Be specific (file:line). Explain WHY.
- Acknowledge strengths before issues.
- Give a clear verdict. No fence-sitting.
- Don't mark nitpicks as Critical.
- Read-only — no code changes.
