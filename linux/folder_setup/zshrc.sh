echo "Welcome to iTerm2\n"


echo "$(date) California"
date -u
echo "$(TZ=Europe/Amsterdam date) Amsterdam" # https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
echo "$(TZ=Asia/Kolkata date) India" # https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
echo "$(TZ=Asia/Shanghai date) China" # https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
echo ""

export PATH=$PATH:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin
export PATH=$PATH:/usr/local/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
