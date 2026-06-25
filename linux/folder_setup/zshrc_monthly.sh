#!/bin/bash

source $(dirname $BASH_SOURCE)/zsh_helper.sh

echo "brew update"
brew update
echo "brew upgrade"
brew upgrade
echo "pip install --upgrade pip"
pip install --upgrade pip

echo "gh extension upgrade gh-copilot"
gh extension upgrade gh-copilot

echo "Run Command 'awscompleter' to enable aws cli auto complete. Still not sure why I can't run this in a script. Ask a friend."
echo ""

echo "Shell: $SHELL"

# cd $HOME/Code/1/
# gitpullfolders
cd $HOME

#echo 'To get Azure Autocomplete, run "source /usr/local/Cellar/azure-cli/2.61.0/etc/bash_completion.d/az"'
#echo "Starting Azure AutoComplete" && source /usr/local/Cellar/azure-cli/2.61.0/etc/bash_completion.d/az && echo "Azure AutoComplete Complete" && az account show | jq '.name'
#echo ""

mkdir -p ~/.terraform.d/plugin-cache

for proj in $HOME/Code/*/*; do
  if [[ -f "$proj/.claude/settings.local.json" ]]; then
    rm "$proj/.claude/settings.local.json"
    echo "Deleted $proj/.claude/settings.local.json"
  fi
  if [[ -f "$proj/.claude/user-settings.json" ]]; then
    rm "$proj/.claude/user-settings.json"
    echo "Deleted $proj/.claude/user-settings.json"
  fi
done
