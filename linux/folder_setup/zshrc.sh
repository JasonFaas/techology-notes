source "$HOME/workspace/techology-notes/linux/folder_setup/zsh_helpers.sh"

echo "Welcome to iTerm2"

export PATH=$PATH:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$HOME/.docker/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH="/usr/local/go"
export PATH=$GOPATH/bin:$PATH
export PATH=$AWS_COMPLETER:$PATH

export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"

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
#terraform -install-autocomplete

export GLOBAL_GITIGNORE="${HOME}/Code/1/techology-notes/git/global.gitignore"
test -f $GLOBAL_GITIGNORE && sh -c "git config --global core.excludesfile $GLOBAL_GITIGNORE" || sh -c "echo 'Global git file DOES NOT EXIST. Fix this'; echo ''"

FULL_TEMP_FILE_PATH="$HOME/temp/techology_monthly.txt"
FULL_MONTHLY_FILE_PATH="$HOME/Code/1/techology-notes/linux/folder_setup/zshrc_monthly.sh"
current_month=$(date +%m)
run_command_if_file_not_same_as_value $FULL_MONTHLY_FILE_PATH $FULL_TEMP_FILE_PATH $current_month

FULL_TEMP_FILE_PATH="$HOME/temp/techology_weekly.txt"
FULL_WEEKLY_FILE_PATH="$HOME/Code/1/techology-notes/linux/folder_setup/zshrc_weekly.sh"
current_week=$(date +%U)
run_command_if_file_not_same_as_value $FULL_WEEKLY_FILE_PATH $FULL_TEMP_FILE_PATH $current_week

FULL_TEMP_FILE_PATH="$HOME/temp/techology_8_hours.txt"
FULL_WEEKLY_FILE_PATH="$HOME/Code/1/techology-notes/linux/folder_setup/zshrc_8_hours.sh"
current_8_hours=$(echo $(( $(date +"%s") / 3600 / 8)))
run_command_if_file_not_same_as_value $FULL_WEEKLY_FILE_PATH $FULL_TEMP_FILE_PATH $current_8_hours

FULL_TEMP_FILE_PATH="$HOME/temp/techology_1_hour.txt"
FULL_WEEKLY_FILE_PATH="$HOME/Code/1/techology-notes/linux/folder_setup/zshrc_1_hour.sh"
current_1_hour=$(echo $(( $(date +"%s") / 3600 / 1)))
run_command_if_file_not_same_as_value $FULL_WEEKLY_FILE_PATH $FULL_TEMP_FILE_PATH $current_1_hour

complete -C aws_completer taws # autocomplete taws command

cd $HOME/Code/1

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

for cmd in ${(k)functions} ${(k)aliases}; do
    print -s "$cmd"
done
