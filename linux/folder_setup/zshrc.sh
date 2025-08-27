echo "Welcome to iTerm2\n"

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

FULL_TEMP_FILE_PATH="$HOME/temp/techology_monthly.txt"
FULL_MONTHLY_FILE_PATH="$HOME/Code/1/techology-notes/linux/folder_setup/zshrc_monthly.sh"
current_month=$(date +%m)
run_command_if_file_not_same_as_value $FULL_MONTHLY_FILE_PATH $FULL_TEMP_FILE_PATH $current_month

echo "\$ps"
ps | rg -v "zsh"
echo ""

echo "\$ docker ps"
docker ps
echo ""
