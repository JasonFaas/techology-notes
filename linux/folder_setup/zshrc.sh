echo "Welcome to iTerm2\n"

function echo_time {
  echo "$(date) Computer Time Zone"
  echo "$(date +%s)                   Unix timestamp"
  echo ""
  echo "$(TZ=America/Los_Angeles date) Los Angeles, USA" # https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
  date -u
  echo "$(TZ=Europe/Amsterdam date) Amsterdam, Netherlands" # https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
  echo "$(TZ=Asia/Kolkata date) Kolkata, India" # https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
  echo "$(TZ=Asia/Shanghai date) Shanghai, China" # https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
  echo ""
}

echo_time

export PATH=$PATH:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$HOME/.docker/bin
export PATH=$PATH:/usr/local/go/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# AWS_COMPLETER
# $(echo $SHELL)
export AWS_COMPLETER=$(which aws_completer)
# Completer BASH
# complete -C "$AWS_COMPLETER" aws
# AWS_COMPLETER ZSH
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
#autoload -U +X bashcompinit && bashcompinit
#autoload -U +X compinit && compinit
complete -C $AWS_COMPLETER aws
#complete -C '$AWS_COMPLETER' aws
echo "Run Command 'awscompleter' to enable aws cli auto complete. Still not sure why I can't run this in a script. Ask a friend."
echo ""

export GLOBAL_GITIGNORE="${HOME}/Code/1/techology-notes/git/global.gitignore"
test -f $GLOBAL_GITIGNORE && sh -c "echo \"Global git file exists. Setting now.\"; echo \"\"; git config --global core.excludesfile $GLOBAL_GITIGNORE" || echo "Global git file DOES NOT EXIST. Fix this."

echo "Starting Azure AutoComplete" && source /usr/local/Cellar/azure-cli/2.61.0/etc/bash_completion.d/az && echo "Azure AutoComplete Complete" && az account show | jq '.name'
