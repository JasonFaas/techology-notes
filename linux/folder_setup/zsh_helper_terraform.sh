

alias tg=terragrunt

function tf {
  pwdg
  
  if [[ -n "$TSH_AWS_APP" ]]; then
    echo "\$ tsh aws --app $TSH_AWS_APP --exec terraform -- $@"
    tsh aws --app $TSH_AWS_APP --exec terraform -- "$@" | teeout
    echo ""
  else
    terraform "$@" | teeout
  fi
}

alias tfi="tf init"
alias tfip="tfi && tfp"
alias tfia="tfi && tfa"
alias tfshow="tf show -no-color"
alias tfa="tf apply"
alias tfmv="terraform state mv"
alias tfrm="terraform state rm"

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
  TEE_OUTPUT_DIR=$HOME/Desktop/output/$(date +%Y%m)
  mkdir -p $TEE_OUTPUT_DIR
  OUTPUT_FILE=$TEE_OUTPUT_DIR/$(basename "$(dirname "$PWD")")--$(basename "$PWD")--$(date +%Y%m%d%H%M%S).txt
  echo "Most recent output file: $OUTPUT_FILE"
  tee $OUTPUT_FILE
}
