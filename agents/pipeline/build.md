## Budget

- Read only files named in plan/scout. No exploratory ls/grep unless plan is incomplete.
- Don't re-read files already shown in plan/scout context.

## Process

1. Worktree

    If worktrees enabled, create one before any code changes.

    ```bash
      SLUG="…"
      CALLER=$(git rev-parse --abbrev-ref HEAD)
      TS=$(date +%Y%m%d-%H%M%S)
      WT="$(pwd)/.agents/worktrees/${TS}-${SLUG}"
      git worktree prune
      git worktree add -b "task/${TS}-${SLUG}" "$WT"
      echo "worktree: $WT"
    ```

    Store `$WT`, `$CALLER`, `$TS`, `$SLUG`. Use absolute paths or `git -C "$WT"`.

2. RED (only if `$PHASE=red`)

    - Write failing tests covering every case in the plan's `## Tests` (unit first; integration/e2e if plan says). Find best location from existing tests.
    - No prod code. Minimum stubs only if needed to compile/import.
    - Run them. Confirm fail for right reason (feature missing, not typo/import error).
    - Leave uncommitted. No commit.
    - STOP. Return: test file paths, one-line intent per test, trimmed raw failing output, plan cases not covered, `$WT`, `$CALLER`.
    - Do not proceed to implementation. Orchestrator gates with user.

3. Implement (only if `$PHASE=green`)

    - Tests approved by user + frozen. Edit/delete/weaken a test → stop and ask.
    - Be guided by the inputted `$PLAN`.
    - Green → refactor (Smallest change to pass each failing test)
    - Run fast tests after each change
    - Loop until all fast tests green or blocked

4. Commit proposal

    - Write small atomic commits; approved tests go in a separate `test:` commit first
    - Show orchestrator: proposed commit message, diff summary, fast test and test cov results
    - Commit format strict: `<type>: <description>`. No scope. Lower-case description. Allowed types: `feat:`,`fix:`,`refactor:`,`test:`,`chore:`,`docs:`
    - Stop there until orchestrator returns explicit approval.
    - After approval:

        ```bash
          git -C "$WT" add <only files you changed>
          git -C "$WT" commit -m "<type>: <description>"
          SHA=$(git -C "$WT" rev-parse HEAD)
        ```

5. Surface

    When all fast tests green and commit exists: return `$SHA`, test coverage for lines added, commit message, diff summary, fast test results, `$WT`, `$CALLER`.
