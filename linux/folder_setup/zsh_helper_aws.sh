alias awsw="aws sts get-caller-identity"
alias awscompleter="complete -C $(which aws_completer) aws"
alias awsc="complete -C $(which aws_completer) aws"

# function taws {
#   /opt/homebrew/bin/aws "$@"
# }

function aws {
  pwdg
  
  if [[ -n "$TSH_AWS_APP" ]]; then
    echo "Running aws cli with $TSH_AWS_APP and SHOW IAM ROLE"
    echo "\$ tsh aws --app $TSH_AWS_APP $@"
    tsh aws --app $TSH_AWS_APP "$@" | teeout
    echo ""
  else
    /opt/homebrew/bin/aws "$@"
  fi
}

function tsh_exec {
  pwdg
  echo "\$ tsh aws --app $TSH_AWS_APP --exec $@"
  tsh aws --app $TSH_AWS_APP --exec "$@" | teeout
  echo ""
}
alias tshexec=tsh_exec
alias exectsh=tsh_exec

function echo_tsh {
  echo -e "${BBlue}TSH_AWS_APP:${Color_Off} ${TSH_AWS_APP:-"(not set)"}"
  echo ""

  echo -e "${BBlue}Teleport login status:${Color_Off}"
  if tsh status 2>/dev/null | grep -q "Logged in"; then
    tsh status 2>/dev/null | grep -E "Logged in|Profile URL|Valid until" | sed 's/^/  /'
  else
    echo "  (not logged in)"
  fi
  echo ""

  echo -e "${BBlue}AWS apps currently logged in:${Color_Off}"
  local apps
  apps=$(tsh apps ls 2>/dev/null | rg ">.*-aws " 2>/dev/null)
  if [[ -z "$apps" ]]; then
    echo "  (none)"
  else
    echo "$apps" | while IFS= read -r line; do
      app_name=$(echo "$line" | awk '{print $2}')
      env_tag=$(echo "$line" | sed 's/.*env=\([^,]*\).*/\1/')
      identity=$(tsh aws --app "$app_name" sts get-caller-identity 2>/dev/null)
      account=$(echo "$identity" | grep '"Account"' | awk -F'"' '{print $4}')
      role=$(echo "$identity" | grep '"Arn"' | sed 's/.*assumed-role\/\([^/]*\).*/\1/')
      if [[ -z "$account" ]]; then
        id_info="(session expired)"
      else
        id_info="account=$account, role=$role"
      fi
      if [[ "$app_name" == "$TSH_AWS_APP" ]]; then
        echo -e "  ${BGreen}* $app_name${Color_Off}  (env=$env_tag, $id_info) ${BGreen}<-- active${Color_Off}"
      else
        echo -e "  ${Yellow}  $app_name${Color_Off}  (env=$env_tag, $id_info)"
      fi
    done
  fi
}
alias echotsh=echo_tsh

alias tshlogout-techology="pkill -f 'tsh proxy aws'; tsh app logout; tsh logout; unset AWS_ACCESS_KEY_ID; unset AWS_SECRET_ACCESS_KEY; unset AWS_SESSION_TOKEN; unset HTTPS_PROXY; echo 'AWS credentials cleared'"

function tshapplogout-techology() {
    pkill -f 'tsh proxy aws'
    tsh app logout
    unset AWS_ACCESS_KEY_ID
    unset AWS_SECRET_ACCESS_KEY
    unset AWS_SESSION_TOKEN
    unset HTTPS_PROXY
    echo 'AWS credentials cleared'
    echo "Setting Default iterm2 Profile"
    echo -e "\033]50;SetProfile=Default\007" || true
}

function aws_sso_login {
  aws sso login
}

function aws_sso_login_regular {
  six_hour_block=$(echo "$(date +%H) / 6" | bc)
  quarter_daily=$(date +%j)-$six_hour_block
  run_command_if_file_not_same_as_value aws_sso_login $HOME/temp/daily_aws_login.txt $quarter_daily
}

function echo_alarms_aws {
  printf "${On_Green}$TF_VAR_aws_account-$TF_VAR_aws_region_name-$TF_VAR_stack CloudWatch Alarms${Color_Off}\n"
  aws cloudwatch describe-alarms | jq '.MetricAlarms[] | select(.StateValue != "OK") | .AlarmName'
  echo ""
}

function echo-aws {
  echo ""
  echo "Likely connected to AWS account:"
  echo "--------------------------------"
  echo-aws-account-info > $HOME/temp/aws-account-info.txt
  aws sts get-caller-identity --no-cli-pager > $HOME/temp/aws-caller-identity.txt
  cat $HOME/temp/aws-account-info.txt | grep $(cat $HOME/temp/aws-caller-identity.txt | jq -r '.Account')
  STS_ARN=$(cat $HOME/temp/aws-caller-identity.txt | jq -r '.Arn')

  role_path=$(echo "$STS_ARN" | sed 's/^.*://')
  echo "$role_path"
}
alias echoaws=echo-aws
alias echoawsaccountinfo=echo-aws-account-info
