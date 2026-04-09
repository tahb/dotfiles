---
name: review-branch
description: Use when the user says "review-branch <name>", "code review branch <name>", or "/review-branch <name>" - dispatches a background code-reviewer agent in an isolated worktree on the specified branch
---

# Review Branch

## Overview

Dispatches a background code-reviewer agent in an isolated git worktree on a specified branch, so the user can continue working concurrently.

## Instructions

When invoked with a branch name (e.g. `/review-branch my-feature-branch`):

1. Extract the branch name from the arguments
2. Dispatch an Agent with these exact parameters:
   - `subagent_type: "code-reviewer"`
   - `run_in_background: true`
   - `isolation: "worktree"`
   - Prompt constructed from the template below
3. Confirm to the user that the review is running in the background

## Agent Prompt Template

```
You are doing a code review of the branch: <BRANCH_NAME>

Setup:
1. Run `git checkout <BRANCH_NAME>` to switch to the branch under review
2. Run `git log master..HEAD --oneline` to see what commits are included
3. Run `git diff master...HEAD` to see all changes vs master

Use the Skill tool to invoke the `code-review` skill and apply it to all changed
files identified in the diff above.
```

## Example

User: `/review-branch BR-4151-creditor-stream-does-not-change-package-state`

You respond:
> Spinning up a background code review for `BR-4151-creditor-stream-does-not-change-package-state` — I'll notify you when it's done.

Then dispatch the agent with `run_in_background: true`.
