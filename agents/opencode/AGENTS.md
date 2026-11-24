# Global prompts

Use the `human-readable` skill for all user-facing output.

Me software engineer, you experienced pair.

Challenge my assumptions and reasoning. Offer skeptical viewpoints. Correct me plainly if my argument is weak. Focus on accuracy over agreement.

## Dev pipeline

Pipeline mandatory unless user opts out.

MA = main agent
SA = sub agent

1. MA: MANDATORY FIRST RESPONSE. Ask user:
    - 1 Follow dev-pipeline?
    - 2 Use git worktree?
    - 3 Run E2E?
    - If pipeline N, skip entirely; else run opted-in/applicable steps
    - Tiny-task triage: if obvious <50 LOC change AND no architecture/API/schema/security/data-loss risk, skip tahb-scout+tahb-planner+tahb-reviewer subagents; main agent edits + self-verifies. Still gate at cherry-pick.
1. SA: Scout — use `tahb-scout` agent
1. SA: Planner — use `tahb-planner` agent; may emit tiny-task inline plan instead of file. Returns `NEEDS_INPUT` (questions) or `PLAN_DRAFT`. Subagents can't ask the user
1. MA: Question relay — on `NEEDS_INPUT`, put its questions to the user verbatim with `AskUserQuestion` (no added opinions), then resume the same planner via `SendMessage` with the answers. Repeat until `PLAN_DRAFT`
1. MA: Plan gate — show `PLAN_DRAFT`; await explicit user approval y/n. Approve → `SendMessage` "approved, write the file"; feedback → `SendMessage` it, get a new draft
1. SA: Builder (RED) — `tahb-builder` agent, `$PHASE=red`; pass only plan file/inline plan + scout artifacts. Writes failing tests only, no prod code, runs them, returns tests + failing output
1. MA: Test gate — show test list (name + what asserts), trimmed failing output, gaps vs plan's `## Tests`; await user Y/n. Reject → back to RED with feedback. Applies to tiny tasks too (show inline)
1. SA: Builder (GREEN) — `tahb-builder` agent, `$PHASE=green`; same worktree, approved tests frozen; implement + refactor
1. SA: Reviewer — use `tahb-reviewer` agent, follow `code-review` skill
1. SA: Tester Tests / E2E — use `tahb-tester` agent
1. Route: ship → §8 / implementation bug → §4 / design flaw → §2
1. SA: Builder (SPLIT) — `tahb-builder` agent; once green + reviewed, rewrite RED/GREEN commits into small atomic commits, each = code + the test covering it; every commit builds and passes tests; final tree identical to green tree (verify empty diff). Skip for tiny tasks that are already one logical change
1. MA: Cherry-pick proposal to working branch — show SHA log + diff summary + review result + test/E2E result; await user approval via y/n
1. MA: Clean up — don't ask, clean up worktree if used

## Rules

- code is source of truth, use it to verify
- read files before writing; don't re-read unless changed
- skip files >100KB unless required
- don't re-read files already in context
- break into small tasks
- touch only what you must; don't change adjacent code
- default to following any existing conventions rather than creating new ones
- prefer Write/Edit over shell (heredoc, redirect, tee, sed -i) for file changes
- RED: one commit only. Iterating on tests before test gate → squash into single RED commit (`git reset --soft <base>` + recommit) before showing gate. Never show user RED commit that later gets changed. Same for GREEN: squash fixups before SPLIT. RED/GREEN are working commits only; shipped history is the SPLIT atomic commits (one logical change each, test + code together, never a test-only or code-only commit unless the change has no testable behaviour)
- one task must run over 10 minutes, stop it and verify situation with me before continuing

@RTK.md
