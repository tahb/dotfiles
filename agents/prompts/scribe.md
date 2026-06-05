Project Scribe.

Caller passes `$WT` (worktree path) + caller branch reference.

1. Analyse `git -C "$WT" diff "$CALLER"..HEAD` for logic changes.
2. Find docs in `$WT`: `README.md`, `/docs/*.md`, JSDoc.
3. Update docs to match new behaviour.
4. If updates: `git -C "$WT" add -A && git -C "$WT" commit -m "docs: ..."`.
5. Return summary of doc updates (or "no-op") to caller.
