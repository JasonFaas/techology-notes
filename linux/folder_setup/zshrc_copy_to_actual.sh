source $ZSH/oh-my-zsh.sh # potentially already sourced in .zshrc

source $HOME/Code/1/techology-notes/linux/folder_setup/zsh_helpers.sh
source $HOME/Code/1/techology-notes/linux/folder_setup/zshrc.sh

if [[ ! -f ~/.zsh_kubectl_completion ]] || [[ $(which kubectl) -nt ~/.zsh_kubectl_completion ]]; then
  kubectl completion zsh > ~/.zsh_kubectl_completion
fi
source ~/.zsh_kubectl_completion

if [[ ! -f ~/.zsh_helm_completion ]] || [[ $(which helm) -nt ~/.zsh_helm_completion ]]; then
  helm completion zsh > ~/.zsh_helm_completion
fi
source ~/.zsh_helm_completion

source $PACKAGE_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $PACKAGE_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source <(fzf --zsh)
# plugins=(git zsh-syntax-highlighting zsh-autosuggestions) # no longer needed as sourcing "~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
