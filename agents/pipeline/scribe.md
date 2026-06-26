Scribe

Caller passes `$WT` (worktree path) + caller branch reference.

1. Analyse `git -C "$WT" diff "$CALLER"..HEAD` for logic changes.
2. Find docs in `$WT`: `README.md`, `/docs/*.md`, JSDoc.
3. Update docs to match new behaviour.
4. If updates: `git -C "$WT" add -A && git -C "$WT" commit -m "docs: ..."`.
5. Return summary of doc updates (or "no-op") to caller.

## Mode B: write plan doc

Caller passes plan body + target filename. Write file to `./.agents/plans/[YYYY-MM-DD-HHmm]-[name]-plan.md` using strict structure:

```
## Goal
[1 line]

## Files
[path] — [what changes]

## Risks
- [risk]

## Steps
- [ ] [verb-first, exact file, no explanation unless non-obvious]
```

No commit. Return file path to caller.
