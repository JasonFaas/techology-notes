export HOMEBREW_AUTO_UPDATE_SECS=604800 # every week

# Claude Code
function cde {
  claude --continue
}
function cde-continue {
  claude --continue
}
function cde-resume {
  claude --resume
}

alias echotime="echo-time"
function echo-time {
  echo "$(date) Computer Time Zone"
  echo "$(date +%s)                   Unix timestamp"
  echo "$(TZ=Asia/Shanghai date) Shanghai, China"
  echo "$(TZ=Asia/Kolkata date) Kolkata, India"
  echo "$(TZ=Europe/Warsaw date) Warsaw, Poland"
  date -u
  echo "$(TZ=America/Los_Angeles date) Los Angeles, USA"
  echo ""
}

function echo_weather {
  echo "$(curl 'wttr.in/Santa+Clara?format=%t&m')"
}

function echo_weather_say {
  say "$(curl 'wttr.in/Santa+Clara?format=%t&m')"
}

function echo_exit_status {
  echo "$?"
}
alias echoexit="echo_exit_status"

alias cd1="cd $HOME/Code/1"
alias cd2="cd $HOME/Code/2"
alias cd3="cd $HOME/Code/3"
alias cd4="cd $HOME/Code/4"
alias cd5="cd $HOME/Code/5"
alias cd6="cd $HOME/Code/6"
alias cd7="cd $HOME/Code/7"
alias cd8="cd $HOME/Code/8"
alias cdtech="cd techology-notes/"

alias vi="echo \"You should really try vim\""

alias echo-bt-battery="$HOME/workspace/techology-notes/mac/bluetooth/battery/bt-battery.py"
alias echo-battery="$HOME/workspace/techology-notes/mac/battery.py"
alias echobattery=echo-battery
alias battery=echo-battery
alias btbattery=echo-battery
alias bt-battery=echo-bt-battery

alias sgpt="~/Library/Python/3.9/bin/sgpt"
alias s="sgpt"

#alias pip="pip3"
alias pip='echo "pip command is disabled. Use pipx instead."'

function shell_say_result {
  $1 && echo "Success" && say "Good News, Everyone!" || (echo "Failure" && say "Failed again, try again soon.")
}

function run_command_if_file_not_same_as_value {
  mkdir -p "$HOME/temp"
  CMD_TO_RUN=$1
  TEMP_FILE_PATH=$2
  VALUE_EXPECTED=$3

  if [ ! -f "$TEMP_FILE_PATH" ]; then
    echo "Running \"${CMD_TO_RUN}\" as ${TEMP_FILE_PATH} does not exist."
    echo ""
    $CMD_TO_RUN
  else
    TEMP_VAR=$(cat $TEMP_FILE_PATH)
    if [ "$VALUE_EXPECTED" != "$TEMP_VAR" ]; then
      echo "Running \"${CMD_TO_RUN}\" as value is different in ${TEMP_FILE_PATH}."
      $CMD_TO_RUN
    else
      echo "Not running \"${CMD_TO_RUN}\" as value is same in ${TEMP_FILE_PATH}."
    fi
  fi
  echo $VALUE_EXPECTED > $TEMP_FILE_PATH
  echo ""
}

alias rgrec=rg_recent
function rg_recent {
  rg  "$@" $HOME/Desktop/output/$(date +%Y%m)/$(ls -t $HOME/Desktop/output/$(date +%Y%m)/ | head -1)
}

alias cprec=cp_recent
function cp_recent {
  cp $HOME/Desktop/output/$(date +%Y%m)/$(ls -t $HOME/Desktop/output/$(date +%Y%m)/ | head -1) "$@"
}
