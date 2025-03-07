source $(dirname $BASH_SOURCE)/zsh_helper.sh

brew update
brew upgrade
pip install --upgrade pip

gh extension upgrade gh-copilot

echo "Run Command 'awscompleter' to enable aws cli auto complete. Still not sure why I can't run this in a script. Ask a friend."
echo ""

echo "Shell: $SHELL"

cd $HOME/Code/1/
gitpullfolders
cd $HOME

#echo 'To get Azure Autocomplete, run "source /usr/local/Cellar/azure-cli/2.61.0/etc/bash_completion.d/az"'
#echo "Starting Azure AutoComplete" && source /usr/local/Cellar/azure-cli/2.61.0/etc/bash_completion.d/az && echo "Azure AutoComplete Complete" && az account show | jq '.name'
#echo ""
