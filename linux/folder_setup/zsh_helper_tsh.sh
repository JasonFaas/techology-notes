#!/bin/bash

function tshssh {
    local matches selected
    echo "tsh ls -v | grep \"$1\""
    matches=$(tsh ls -v | grep "$1")
    [[ -z "$matches" ]] && { echo "No nodes found"; return 1; }

    local count
    count=$(echo "$matches" | wc -l | tr -d ' ')
    if [[ "$count" -gt 1 ]]; then
        echo "ERROR: $count nodes matched — be more specific:"
        echo "$matches"
        echo "ERROR: $count nodes matched — be more specific:"
        return 1
    fi

    selected="$matches"
    echo "selected: $selected"

    local csv hostname
    csv=$(echo "$selected" | awk '{print $NF}')
    # echo "csv: $csv"

    hostname=$(echo "$selected" | awk '{print $1}')
    # echo "hostname: $hostname"

    [[ -z "$hostname" ]] && { echo "Could not extract hostname"; return 1; }

    if [[ $# -gt 1 ]]; then
        echo "tsh ssh \"ubuntu@$hostname\" ${@:2}"
        tsh ssh "ubuntu@$hostname" "${@:2}"
    else
        echo "tsh ssh \"ubuntu@$hostname\""
        tsh ssh "ubuntu@$hostname"
    fi
}

alias tshsshosversion=tsh-ssh-os-version
# lsb_release -a is a command to get the os version of a node
# lsb stands for Linux Standard Base
# -a stands for all
# -r is for release
# -s is for short
# -d is for distribution
function tsh-ssh-os-version {
    echo "timeout 5 tsh ssh \"ubuntu@instance_id=$1\" \"lsb_release -a\""

    timeout 5 tsh ssh "ubuntu@instance_id=$1" "lsb_release -a"
}
