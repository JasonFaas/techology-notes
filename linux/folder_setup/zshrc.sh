echo "Welcome to iTerm2"

echo ""
echo '$ echo-time'
echo-time

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

echo "\$ ps"
ps | rg -v "zsh"
echo ""

echo "\$ docker ps"
docker ps
echo ""

echo "\$ kubectx # replace with kubectl command"
kubectx
echo ""

echo "\$ kubectl get nodes"
kubectl get nodes
echo ""

cd $HOME/Code/1

ln -s "$HOME/Code/1" "$HOME/workspace" # symlink to workspace folder, aka Eclipse paradigm

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
