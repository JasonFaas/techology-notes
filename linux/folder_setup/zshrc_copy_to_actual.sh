source $ZSH/oh-my-zsh.sh # potentially already sourced in .zshrc

source $HOME/Code/1/techology-notes/linux/folder_setup/zsh_helper.sh
source $HOME/Code/1/techology-notes/linux/folder_setup/zshrc.sh

source <(kubectl completion zsh) # not sure if this is needed
source <(helm completion zsh) # not sure if this is needed

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# plugins=(git zsh-syntax-highlighting zsh-autosuggestions) # no longer needed as sourcing "~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
