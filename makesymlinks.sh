#!/usr/bin/env bash
set -euo pipefail
# Create all dotfile symlinks. Safe to re-run.

DOTFILES="$HOME/dotfiles"

echo "Setting up symlinks..."
echo "  dotfiles"
# Standard dotfiles
mkdir -p "$HOME/.config/ghostty"
mkdir -p "$HOME/.config/aerospace"
touch "$DOTFILES/.profile"

for src in "$DOTFILES/ghostty/config" \
           "$DOTFILES/.gitignore" \
           "$DOTFILES/gitconfig" \
           "$DOTFILES/zshrc" \
           "$DOTFILES/zpreztorc" \
           "$DOTFILES/aerospace/aerospace.toml" \
           "$DOTFILES/tmux/.tmux.conf" \
           "$DOTFILES/.clauderc"; do
  dest="$HOME/$(basename "$src")"
  [[ -e "$dest" ]] || ln -sfn "$src" "$dest"
done
[[ -e "$HOME/.wezterm.lua" ]] || ln -sfn "$DOTFILES/wezterm/.wezterm.lua" "$HOME/.wezterm.lua"

echo "  RTK"
# RTK — global project CLAUDE.md, picked up by all projects via directory traversal
ln -sfn "$DOTFILES/agents/RTK.md" "$HOME/CLAUDE.md"

echo "  claude"
# Claude
mkdir -p "$HOME/.claude/agents"
ln -sfn "$DOTFILES/agents/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
ln -sfn "$DOTFILES/agents/claude/agents" "$HOME/.claude/agents"
ln -sfn "$DOTFILES/agents/claude/settings.json" "$HOME/.claude/settings.json"
mkdir -p "$HOME/.claude/hooks"
ln -sfn "$DOTFILES/agents/claude/hooks" "$HOME/.claude/hooks"

echo "  claude skills"
# Claude skills
mkdir -p "$HOME/.claude/skills"
for f in "$DOTFILES"/agents/skills/*.md; do
  name=$(basename "$f" .md)
  mkdir -p "$HOME/.claude/skills/$name"
  cp "$f" "$HOME/.claude/skills/$name/SKILL.md"
done
# Remove stale skills no longer in dotfiles
for d in "$HOME"/.claude/skills/*/; do
  name=$(basename "$d")
  if [[ ! -f "$DOTFILES/agents/skills/$name.md" ]]; then
    echo "  removing stale skill: $name"
    rm -rf "$d"
  fi
done

echo "  opencode"
# Opencode
mkdir -p "$HOME/.config/opencode"
ln -sfn "$DOTFILES/agents/opencode/opencode.json" "$HOME/.config/opencode/opencode.json"
ln -sfn "$DOTFILES/agents/opencode/AGENTS.md" "$HOME/.config/opencode/AGENTS.md"
mkdir -p "$HOME/.config/opencode/skills"
ln -sfn "$DOTFILES/agents/skills" "$HOME/.config/opencode/skills"
mkdir -p "$HOME/.config/opencode/prompts"
ln -sfn "$DOTFILES/agents/prompts" "$HOME/.config/opencode/prompts"
mkdir -p "$HOME/.config/opencode/hooks"
ln -sfn "$DOTFILES/agents/opencode/hooks" "$HOME/.config/opencode/hooks"

echo "  pi"
# Pi coding agent
mkdir -p "$HOME/.pi/agent"
ln -sfn "$DOTFILES/agents/pi/settings.json" "$HOME/.pi/agent/settings.json"
ln -sfn "$DOTFILES/agents/skills" "$HOME/.pi/agent/skills"
ln -sfn "$DOTFILES/agents/opencode/AGENTS.md" "$HOME/.pi/agent/AGENTS.md"
echo "Symlinks done."
