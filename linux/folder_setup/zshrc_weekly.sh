source $(dirname $BASH_SOURCE)/zsh_helper.sh

curl 'wttr.in/Santa+Clara?m'

rm $HOME/.vimrc # TODO: Remove this after testing

cd $HOME/Code/1/

for d in */; do
  if [ -d "$d/.git" ]; then
    echo "$ cd $d && git pull; cd .."
    (cd "$d" && git pull)
    echo ""
  else
    echo "$ Skipping $d # not a git repo"
    echo ""
  fi
done
