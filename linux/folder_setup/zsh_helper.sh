export TextUpdate='\033'
export DefaultFont='[0;'
export ColorBlack='30m'
export ColorDefault='0m'

# Reset
#export Color_Off='\033[0m'       # Text Reset
export Color_Off='$TextUpdate$DefaultFont$ColorDefault' # Text Reset

# Regular Colors
#export Black='$TextUpdate$DefaultFont$ColorBlack' # Black
export Black='\033[0;30m'        # Black
export Red='\033[0;31m'          # Red
export Green='\033[0;32m'        # Green
export Yellow='\033[0;33m'       # Yellow
export Blue='\033[0;34m'         # Blue
export Purple='\033[0;35m'       # Purple
export Cyan='\033[0;36m'         # Cyan
export White='\033[0;37m'        # White

export Color_Off='\033[0m'       # Text Reset
# Bold
export BBlack='\033[1;30m'       # Black
export BRed='\033[1;31m'         # Red
export BGreen='\033[1;32m'       # Green
export BYellow='\033[1;33m'      # Yellow
export BBlue='\033[1;34m'        # Blue
export BPurple='\033[1;35m'      # Purple
export BCyan='\033[1;36m'        # Cyan
export BWhite='\033[1;37m'       # White

export Color_Off='\033[0m'       # Text Reset
# Underline
export UBlack='\033[4;30m'       # Black
export URed='\033[4;31m'         # Red
export UGreen='\033[4;32m'       # Green
export UYellow='\033[4;33m'      # Yellow
export UBlue='\033[4;34m'        # Blue
export UPurple='\033[4;35m'      # Purple
export UCyan='\033[4;36m'        # Cyan
export UWhite='\033[4;37m'       # White

export Color_Off='\033[0m'       # Text Reset
# Background
export On_Black='\033[40m'       # Black
export On_Red='\033[41m'         # Red
export On_Green='\033[42m'       # Green
export On_Yellow='\033[43m'      # Yellow
export On_Blue='\033[44m'        # Blue
export On_Purple='\033[45m'      # Purple
export On_Cyan='\033[46m'        # Cyan
export On_White='\033[47m'       # White

export Color_Off='\033[0m'       # Text Reset
# High Intensity
export IBlack='\033[0;90m'       # Black
export IRed='\033[0;91m'         # Red
export IGreen='\033[0;92m'       # Green
export IYellow='\033[0;93m'      # Yellow
export IBlue='\033[0;94m'        # Blue
export IPurple='\033[0;95m'      # Purple
export ICyan='\033[0;96m'        # Cyan
export IWhite='\033[0;97m'       # White

export Color_Off='\033[0m'       # Text Reset
# Bold High Intensity
export BIBlack='\033[1;90m'      # Black
export BIRed='\033[1;91m'        # Red
export BIGreen='\033[1;92m'      # Green
export BIYellow='\033[1;93m'     # Yellow
export BIBlue='\033[1;94m'       # Blue
export BIPurple='\033[1;95m'     # Purple
export BICyan='\033[1;96m'       # Cyan
export BIWhite='\033[1;97m'      # White

export Color_Off='\033[0m'       # Text Reset
# High Intensity backgrounds
export On_IBlack='\033[0;100m'   # Black
export On_IRed='\033[0;101m'     # Red
export On_IGreen='\033[0;102m'   # Green
export On_IYellow='\033[0;103m'  # Yellow
export On_IBlue='\033[0;104m'    # Blue
export On_IPurple='\033[0;105m'  # Purple
export On_ICyan='\033[0;106m'    # Cyan
export On_IWhite='\033[0;107m'   # White

export Color_Off='\033[0m'       # Text Reset


# Alias

function echo_exit_status {
  echo "$?"
}
alias exit_status="echo_exit_status"

## GIT
function cdgitroot {
  while (! ls | grep Volumes) && (! test -e .git)
  do
    echo "Up Dir"
    cd ../
  done
}
function gitpushall {
  git add . && git commit -m "$1" && git push
}
function gitcheck {
  git checkout "$1" && git pull
}
function gitcheckpush {
  git checkout -b "$1" && git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)
}
function gitcheckm {
  echo "Attempting to checkout main/master branch"

  git status > ~/tmp.txt
  if ! $(grep -q "Your branch is up to date" ~/tmp.txt) || ! $(grep -q "nothing to commit, working tree clean" ~/tmp.txt)
  then
    echo "Clean up your branch before switching to master/main branch with automation"
    return
  fi

  git branch > ~/tmp.txt
  if $(grep -q master ~/tmp.txt)
  then
    echo "git checkout master && git pull"
    git checkout master && git pull
    return
  fi

  if $(grep -q main ~/tmp.txt)
  then
    echo "git checkout main && git pull"
    git checkout master && git pull
  else
    echo "What? You don't have master or main branch? Fix this script or check your 'git branch' output"
  fi
}
alias gitpull="git pull"
alias gitpush="git push"
alias gitaddall="git add ."
alias gitstatus="git status"
alias gitcommit="git commit -m "
alias gitdiff="git status && git diff"
alias gitd="git status && git diff"
alias gitcp="git cherry-pick"
alias gitcherry="git cherry-pick"
alias gitstash="git stash"
alias gitpop="git stash pop"
alias gitstashpop="git stash pop"

## terraform and k8s
alias tg=terragrunt
alias tf=terraform
alias kctl=kubectl
alias kns=kubens
alias kctx=kubectx
alias tgapply="terragrunt apply"
alias tga="terragrunt apply"
alias tfi="terraform init"
alias tfa="say Running_Terraform && terraform apply && say Good_News_Everyone || say Terrible_News"
alias tfplan="terraform plan"
alias tga1="tga -parallelism=1"
alias tgimport="terragrunt import"
alias tgplan="terragrunt plan"
alias tginit="terragrunt init"
alias rmtf="rm -f .terraform/terraform.tfstate"
alias rmtfa="echo \"Removing all terraform files including large downloaded providers.\" && rm -rf .terraform*"

alias awslogin="aws sso login"
alias awscompleter="complete -C $(which aws_completer) aws"
alias awsc="complete -C $(which aws_completer) aws"

alias sgpt="~/Library/Python/3.9/bin/sgpt"
alias s="sgpt"

alias pip="pip3"

function shell_say_result {
  $1 && echo "Success" && say "Good News, Everyone!" || (echo "Failure" && say "Failed again, try again soon.")
}

function gitpullfolders {
  echo "Running Git Pull for all directories in $(pwd)"
  echo ""
  for dir in ./*/; do
    (
    # Check if the item is a directory and contains a .git folder
    if [ -d "$dir" ] && [ -d "$dir/.git" ]; then
      echo "Entering directory: $dir"
      cd "$dir"

      echo "Current branch: \"$(git branch --show-current)\""
      git pull

      echo ""
    else
      echo "Skipping $dir: Not a Git repository"
    fi
    )
  done
}
