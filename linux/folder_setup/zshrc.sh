echo "Welcome to iTerm2\n"

function echo_time {
  echo "$(date)  Computer Time Zone"
  echo ""
  echo "$(TZ=America/Los_Angeles date)  Los Angeles" # https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
  date -u
  echo "$(TZ=Europe/Amsterdam date) Amsterdam" # https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
  echo "$(TZ=Asia/Kolkata date)  India" # https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
  echo "$(TZ=Asia/Shanghai date)  Shanghai" # https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
  echo ""
}

echo_time

export PATH=$PATH:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin
export PATH=$PATH:/usr/local/bin

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
