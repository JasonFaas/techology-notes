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
export GOPATH="/usr/local/go"
export PATH=$GOPATH/bin:$PATH
export PATH=$AWS_COMPLETER:$PATH

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

export GLOBAL_GITIGNORE="${HOME}/Code/1/techology-notes/git/global.gitignore"
test -f $GLOBAL_GITIGNORE && sh -c "git config --global core.excludesfile $GLOBAL_GITIGNORE" || sh -c "echo 'Global git file DOES NOT EXIST. Fix this'; echo ''"

# Check if the file does not exist
mkdir -p "$HOME/Code/temp"
FULL_TEMP_FILE_PATH="$HOME/Code/temp/once_a_month.txt"
FULL_MONTHLY_FILE_PATH="$HOME/Code/1/techology-notes/linux/folder_setup/zshrc.montly.sh"
current_month=$(date +%m)
if [ ! -f "$FULL_TEMP_FILE_PATH" ]; then
    date +%m > "$FULL_TEMP_FILE_PATH"
    echo "Running Monthly Script as it doesn't exist yet"
    $FULL_MONTHLY_FILE_PATH
else
    TEMP_VAR=$(cat ~/Code/once_a_month.old.txt)
    if [ "$current_month" != "$TEMP_VAR" ]; then
        date +%m > "$FULL_TEMP_FILE_PATH"
        echo "Running Monthly Script as it's a new month!"
        $FULL_MONTHLY_FILE_PATH
    else
        echo "Not running Monthly Script as it's not a new month"
    fi
fi
