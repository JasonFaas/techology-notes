#!/bin/bash

alias tg=terragrunt

function tf {
  FILE_NAME="tf-$1--$TSH_AWS_APP"
  SUFFIX="$(date +%Y%m%d%H%M%S)"
  echo "\$ pwd" | teeout -s $FILE_NAME $SUFFIX
  pwd | teeout -s $FILE_NAME $SUFFIX
  
  if [[ -n "$TSH_AWS_APP" ]]; then
    echo "" | teeout -s $FILE_NAME $SUFFIX
    echo "# Running terraform cli with $TSH_AWS_APP and $(cat $HOME/.tsh/current_${TSH_AWS_APP}_iam_role)" | teeout -s $FILE_NAME
    echo "\$ tsh aws --app $TSH_AWS_APP --exec terraform -- $@" | teeout -s $FILE_NAME $SUFFIX
    tsh aws --app $TSH_AWS_APP --exec terraform -- "$@" 2>&1 | teeout $FILE_NAME $SUFFIX
    echo ""
  else
    terraform "$@" 2>&1 | teeout $FILE_NAME $SUFFIX
  fi
}

alias tfi="tf init"
alias tfip="tfi && tfp"
alias tfia="tfi && tfa"
alias tfshow="tf show -no-color"
alias tfa="echo 'Run other terraform apply command for now'" # need to update this to only run if on home machine
# alias tfa="tf apply"
alias tfmv="terraform state mv"
alias tfrm="terraform state rm"

alias tfapply="tf apply"
alias tfiapply="tfi && tf apply"
# alias tfapply="tf apply"
alias tfplan="tfp"
alias tfiplan="tfip"
function tfp {
  mkdir -p $HOME/Desktop/terraform/
  TF_PLAN_FILE=$HOME/Desktop/terraform/$(basename "$(dirname "$PWD")")-$(basename "$PWD")-$(date +%s)

  tf plan -lock=false -out=$TF_PLAN_FILE.plan "$@"
  tfshow $TF_PLAN_FILE.plan > $TF_PLAN_FILE.txt
  echo ""
  echo "Plan file saved to $TF_PLAN_FILE.plan"
  echo "Text file saved to $TF_PLAN_FILE.txt"
}

alias tgapply="terragrunt apply"
alias tgia="terragrunt init && terragrunt apply"
alias tga="terragrunt apply"
alias tga1="tga -parallelism=1"
alias tgimport="terragrunt import"
alias tgplan="terragrunt plan -lock=false"
alias tginit="terragrunt init"

alias rmtf="rm -f .terraform/terraform.tfstate"
alias rmtfa="echo \"Removing all terraform files including large downloaded providers.\" && rm -rf .terraform && rm -rf .terraform.lock.hcl"

function teeout {
  local silent=false
  if [[ "$1" == "-s" || "$1" == "--silent" ]]; then
    silent=true
    shift
  fi

  if [[ -n "$2" ]]; then
    SUFFIX="$2"
  else
    SUFFIX="$(date +%Y%m%d%H%M%S)"
  fi

  TEE_OUTPUT_DIR=$HOME/Desktop/output/$(date +%Y)/$(date +%m)/$(date +%d)
  mkdir -p $TEE_OUTPUT_DIR
  # Replace "./" with "-" in the command name
  CMD_NAME=${1//.\//-}
  OUTPUT_FILE=$TEE_OUTPUT_DIR/${CMD_NAME:+${CMD_NAME}--}$(basename "$(dirname "$PWD")")--$(basename "$PWD")--${SUFFIX}.txt
  LAST_OUTPUT_FILE=$TEE_OUTPUT_DIR/${CMD_NAME:+${CMD_NAME}--}$(basename "$(dirname "$PWD")")--$(basename "$PWD")--$(date +%s%N).txt
  tee -a $OUTPUT_FILE $LAST_OUTPUT_FILE
  if [[ "$silent" != true ]]; then
    echo ""
    echo "Full output file: $OUTPUT_FILE"
    echo "Last command output file: $LAST_OUTPUT_FILE"
  fi
}

alias tffmt="terraform-format-repo"
function terraform-format-repo {
  CURR_DIR=$(pwd)
  cdgitroot

  echo "terraform fmt -recursive"
  terraform fmt -recursive | teeout "terraform-fmt-repo"

  cd $CURR_DIR
}
