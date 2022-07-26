echo "Welcome to iTerm2\n"

# curl wttr.in/Santa+Clara

date
echo ""

# Alias
alias tg=terragrunt
alias tf=terraform
alias kctl=kubectl
alias kns=kubens
alias kctx=kubectx

export PATH=$PATH:/Users/$(whoami)/.helper_scripts/

echo "Echoing non-standard Environment Variables:"
MY_ENV_VARS_STR=$(printenv)
MY_ENV_VARS_LIST=($(echo $MY_ENV_VARS_STR | tr " " "\n"))
STANDARD_ENV_VARS="TERM_SESSION_ID SSH_AUTH_SOCK LC_TERMINAL_VERSION COLORFGBG ITERM_PROFILE XPC_FLAGS LANG PWD SHELL __CFBundleIdentifier TERM_PROGRAM_VERSION TERM_PROGRAM PATH LC_TERMINAL COLORTERM COMMAND_MODE TERM HOME TMPDIR USER XPC_SERVICE_NAME LOGNAME __CF_USER_TEXT_ENCODING ITERM_SESSION_ID SHLVL OLDPWD ZSH GOPATH PAGER LESS LSCOLORS _"
for ENV_VAR in "${MY_ENV_VARS_LIST[@]}"
do
    ENV_VAR_KEY_VAL=($(echo $ENV_VAR | tr "=" "\n"))
#     echo "${ENV_VAR_KEY_VAL[1]}"
    if [[ "$ENV_VAR" != *"="* ]]; then # ENV_VAR Value with Space...TODO fix this hack with better "MY_ENV_VARS_LIST" split
      continue
    elif [[ $STANDARD_ENV_VARS =~ (^|[[:space:]])"${ENV_VAR_KEY_VAL[1]}"($|[[:space:]]) ]] ; then
      continue
    else
        echo $ENV_VAR
    fi
done

echo ""
