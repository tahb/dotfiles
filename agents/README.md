# agents/

```
task
 │
 ├─ large scope? ──yes──▶ 0. scout (haiku · read-only)
 │                                │
 │◀────────────────────────────────┘
 │
 ▼
1. scout (haiku · read-only)
  │
  ▼
2. plan skill  (.agents/plans/{slug}-plan.md + {slug}-todos.md)
  │
  ▼
3. plan gate  [YOU] approve plan + todos? ──reject──▶ back to 2
  │
  ▼
4. builder (haiku) · git worktree  (.agents/worktrees/slug)
  │
  ▼
5. builder · write failing e2e test
  │
  ▼
6. builder · todos one-at-a-time · TDD per item · commit
  │
  ▼
7. reviewer (opus · deep review)
  │
[YOU] verdict? ──rework──────────────────────────────▶┘
  │
  ▼
8. builder · e2e pass proof
  │
  ▼
9. scribe (haiku · update docs)
  │
[YOU] approve commit? ──reject──────────────────────▶┘
  │
  ▼
10. cherry-pick proposal to main
  │
  ▼
11. cleanup · prune worktree
```

`[YOU]` = manual gate

## Subagents

| Agent | Model | Role |
|-------|-------|------|
| `dev` | sonnet · high | orchestrator |
| `scout` | haiku · low | read-only exploration |
| `builder` | haiku · medium | implementation (todos + TDD) |
| `reviewer` | opus · high | deep review |
| `scribe` | haiku · low | doc sync |

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
| "Implement only" | 4–9 |
| "Review only" | 7 |
| "Document only" | 9 |
