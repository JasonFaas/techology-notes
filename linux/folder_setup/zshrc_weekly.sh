source $(dirname $BASH_SOURCE)/zsh_helper.sh

# curl 'wttr.in/Santa+Clara?m'

rm $HOME/.vimrc # TODO: Remove this after testing

cp $HOME/.zsh_history $HOME/.zsh_history.backup
cp $HOME/Code/1/techology-notes/linux/folder_setup/zsh_history.sh $HOME/.zsh_history


cd $HOME/Code/1/

# for d in */; do
#   if [ -d "$d/.git" ]; then
#     echo "$ cd $d && git pull; cd .."
#     (cd "$d" && git pull)
#     echo ""
#   else
#     echo "$ Skipping $d # not a git repo"
#     echo ""
#   fi
# done

echo ""
echo "Symlinking $HOME/workspace folder to $HOME/Code/1"
ln -s "$HOME/Code/1" "$HOME/workspace" # symlink to workspace folder, aka Eclipse paradigm

echo ""
echo "\$ docker ps"
docker ps
echo ""
