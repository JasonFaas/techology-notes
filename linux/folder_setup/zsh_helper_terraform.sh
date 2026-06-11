#!/bin/bash

alias tg=terragrunt

function tf {
  pwdg
  
  if [[ -n "$TSH_AWS_APP" ]]; then
    echo "\$ tsh aws --app $TSH_AWS_APP --exec terraform -- $@"
    tsh aws --app $TSH_AWS_APP --exec terraform -- "$@" | teeout "tf-$1--$TSH_AWS_APP"
    echo ""
  else
    terraform "$@" | teeout "tf-$1"
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
alias rmtfa="echo \"Removing all terraform files including large downloaded providers.\" && rm -rf .terraform*"

function teeout {
  TEE_OUTPUT_DIR=$HOME/Desktop/output/$(date +%Y)/$(date +%m)/$(date +%d)
  mkdir -p $TEE_OUTPUT_DIR
  # Replace "./" with "-" in the command name
  CMD_NAME=${1//.\//-}
  OUTPUT_FILE=$TEE_OUTPUT_DIR/${CMD_NAME:+${CMD_NAME}--}$(basename "$(dirname "$PWD")")--$(basename "$PWD")--$(date +%Y%m%d%H%M%S).txt
  tee $OUTPUT_FILE
  echo ""
  echo "Most recent output file: $OUTPUT_FILE"
}
