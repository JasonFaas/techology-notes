#!/bin/bash

echo "8 hours is up"

mkdir -p $HOME/Desktop/Screenshots/ && mv $HOME/Desktop/Screenshot*png $HOME/Desktop/Screenshots/

echo "brew upgrade claude-code"
brew upgrade claude-code

$HOME/workspace/techology-notes/mac/battery.py

local_settings=$(find "$HOME/Code" -maxdepth 4 -path "*/.claude/settings.local.json" 2>/dev/null)
if [ -n "$local_settings" ]; then
  echo ""
  echo "settings.local.json files found — run /sync-settings in Claude Code to consolidate:"
  echo "$local_settings"
fi
