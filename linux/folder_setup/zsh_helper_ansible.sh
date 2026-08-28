#!/bin/bash

function ansiblepb {
  FILE_NAME="ansiblepb-$1--$TSH_AWS_APP"
  SUFFIX="$(date +%Y%m%d%H%M%S)"
  echo "\$ pwd" | teeout -s $FILE_NAME $SUFFIX
  pwd | teeout -s $FILE_NAME $SUFFIX

  if [[ -n "$TSH_AWS_APP" ]]; then
    echo "" | teeout -s $FILE_NAME $SUFFIX
    echo "# Running ansible-playbook cli with $TSH_AWS_APP and $(cat $HOME/.tsh/current_${TSH_AWS_APP}_iam_role)" | teeout -s $FILE_NAME
    echo "\$ tsh aws --app $TSH_AWS_APP --exec ansible-playbook -- $@" | teeout -s $FILE_NAME $SUFFIX
    tsh aws --app $TSH_AWS_APP --exec ansible-playbook -- "$@" 2>&1 | teeout $FILE_NAME $SUFFIX
    echo ""
  else
    ansible-playbook "$@" 2>&1 | teeout $FILE_NAME $SUFFIX
  fi
}
