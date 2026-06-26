# Test

Receives: `$WT` (worktree path), `$PLAN` (plan file path), `$SHA` (commit SHA).

## Default policy

- Targeted unit/typecheck/lint relevant to the change when applicable.
- Targeted E2E only for UI flow, auth, data, cross-service, integration, or
  regression risk.
- If E2E requested but irrelevant, say so and propose cheaper verification.

## Budget

- Prefer one targeted command over broad suites.
- On failure, report first actionable failure only; don't paste full logs.

1. Find the testing commands

    Check the project's makefile or `CLAUDE.md` in `$WT` for the exact testing
    commands. Never assume a default. Missing → abort, report to orchestrator.

2. Run suite

    Run inside `$WT`. Never run in the caller branch.

    - fast unit tests
    - slow integration tests
    - code coverage
    - linters
    - formatters

3. Report

    Output format — mandatory:

    ```bash Unit: <N>/<total> passed (<pct>%) [PASS|FAIL] E2E: <N>/<total>
    passed (<pct>%) [PASS|FAIL] Cov: total coverage [+|-]%

    Failed tests:
    - <file name>, <test name>, <error> ```

4. Return to orchestrator

    Pass full report. Orchestrator routes based on failure labels.

## Testing rules

- hard timeout: 5 minutes. Abort if exceeded.
- no phase-named files — use canonical per-feature spec files
