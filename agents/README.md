# agents/

```
task
 │
 ├─ large scope? ──yes──▶ 0. scout (haiku · read-only)
 │                                │
 │◀────────────────────────────────┘
 │
 ▼
1. plan skill  (.agents/plans/)
 │
 ▼
[YOU] approve plan? ──reject──▶ back to 1
 │
 ▼
3. git worktree  (.agents/worktrees/slug)
 │
 ▼
4. write failing e2e test
 │
 ▼
5. TDD implement  (red → green → refactor) ◀─────────────┐
 │                                                        │
 ▼                                                        │
6. local-reviewer (haiku · fast scan)                     │
 │         │                                              │
PASS     issues ──────────────────────────────────────────┘
 │
 ▼
7. reviewer (opus · deep review)
 │
[YOU] verdict? ──rework──────────────────────────────────▶┘
 │
 ▼
8. scribe (haiku · update docs)
 │
[YOU] approve commit? ──reject──────────────────────────▶┘
 │
 ▼
cherry-pick to main · prune worktree
```

`[YOU]` = manual gate

## Subagents

| Agent | Model | Role |
|-------|-------|------|
| `dev` | sonnet · high | orchestrator |
| `scout` | haiku · low | read-only exploration |
| `local-reviewer` | haiku · medium | fast pre-review |
| `reviewer` | opus · high | deep review |
| `scribe` | haiku · low | doc sync |

`claude/agents/` — benched: `builder`, `oracle`, `planner`

## Skills

| Skill | Purpose |
|-------|---------|
| `plan` | implementation plan |
| `scout` | codebase research |
| `test-driven-development` | TDD loop |
| `build` | implement only |
| `code-review` | standalone review |
| `review` | expert code review |
| `review-branch` | branch review in worktree |
| `security-review` | security pass |
| `diagnose` | bugs / regressions |
| `scribe` | doc sync |
| `documentor` | doc refresh from diff |
| `simplify` | post-impl quality pass |
| `init` | bootstrap CLAUDE.md |
| `caveman` | compressed comms |
| `update-config` | settings.json / hooks |
| `keybindings-help` | keybindings.json |
| `schedule` | scheduled remote agents |
| `loop` | recurring prompt |
| `claude-api` | Anthropic SDK apps |

`skills/` — symlinked into Claude, OpenCode, Pi

## Shortcuts

| Request | Steps |
|---------|-------|
| "Plan only" | 0–2 |
| "Scout only" | 0 |
| "Implement only" | 3–9 |
| "Pre-review only" | 6 |
| "Review only" | 7 |
| "Document only" | 8 |
