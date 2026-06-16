dotfiles
========

Personal dotfiles managed with a `setup.sh` script. Installs and configures:

- **Zsh** with Prezto
- **Claude Code** (via Homebrew) with custom agents
- **OpenCode** (via Homebrew) with custom agents
- **Pi Coding Agent** (via Homebrew)
- Global git config, shell config, and shared agent skills

## Prerequisites

Install these manually first:

- [VSCode](https://code.visualstudio.com/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Homebrew](https://brew.sh/)
- [Node.js](https://nodejs.org/) (20+) — automatically installed as Homebrew dependency

## Install

```bash
cd ~
git clone git@github.com:tahb/dotfiles.git
./dotfiles/setup.sh
```

`setup.sh` will:

1. Install Prezto (zsh framework)
2. Symlink global `AGENTS.md` to `~/.claude/CLAUDE.md`, `~/.config/opencode/AGENTS.md`, and `~/.pi/agent/AGENTS.md`
3. Symlink `~/.claude/agents/` to `dotfiles/agents/claude/agents/`
4. Symlink shared skills in `~/.config/opencode/skills/`, `~/.claude/skills/`, and `~/.pi/agent/skills/`
5. Symlink prompt files to `~/.config/opencode/prompts/`
6. Install Claude Code via Homebrew (if missing)
7. Install OpenCode via Homebrew (if missing)
8. Install Pi via Homebrew (if missing)
9. Install git hooks for dangerous command blocking

## What gets installed

| Tool | Install method | Config location |
|------|---------------|-----------------|
| Claude Code | `brew install --cask claude-code` | `~/.claude/` |
| OpenCode | `brew install opencode` | `~/.config/opencode/` |
| Pi | `brew install pi-coding-agent` | `~/.pi/agent/` |

## Agents

The `agents/` directory holds all agent customization shared across Claude Code, OpenCode, and Pi. It contains per-tool subdirs (`claude/`, `opencode/`, `pi/`) for tool-specific config plus shared `prompts/` and `skills/` that are symlinked into each tool's config location by `setup.sh`. Claude Code picks up subagent definitions from `agents/claude/agents/` (symlinked to `~/.claude/agents/`) and global instructions from `agents/claude/CLAUDE.md` (symlinked to `~/.claude/CLAUDE.md`).

## Repo layout

```
dotfiles/
  agents/
    prompts/     # Shared agent prompt bodies (loaded by OpenCode via {file:})
    skills/      # Shared skills (symlinked into Claude, OpenCode, Pi)
  agents/
    claude/
      agents/      # Claude agent definitions (YAML frontmatter + body)
      hooks/       # Claude git hooks
    opencode/
      opencode.json        # OpenCode config with {file:} prompt references
      AGENTS.md            # Global agent instructions (caveman mode, coding preferences)
      hooks/               # OpenCode hooks
  setup.sh       # Install & configure everything
  README.md      # This file
```

## Debug

```bash
pi -p "list your skills"
```

## Optional

### Offline variables

Add sensitive or machine specific variables into `~/dotfiles/.profile`
