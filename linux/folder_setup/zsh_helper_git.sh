function cdgitroot {
  while (! ls | grep Volumes) && (! test -e .git)
  do
    echo "Up Dir"
    cd ../
  done
}

alias gpa="gitpushall"
alias gpa-c="gitpushall-checks"

function gitpushall {
  CURR_DIR=$(pwd)
  cdgitroot
  echo "Running pre-commit hooks"
  echo "Pre-commit hooks completed"
  git add . && git commit -m "$1" && git push
  cd $CURR_DIR
}

function gitpushall-checks {
  CURR_DIR=$(pwd)
  cdgitroot
  echo "Running pre-commit hooks"

  pre-commit run --from-ref origin/master --to-ref HEAD && echo "Pre-commit against branch completed"
  terraform fmt -recursive && echo "Terraform fmt completed"
  yamllint -c .yamllint --strict . && echo "Yamllint completed"

  echo "About to add, pre-commit run, commit, and push"
  git add . && pre-commit run && git commit -m "$1" && git push
  echo "Completed add, pre-commit run, commit, and push"
  cd $CURR_DIR
}

function gitcheck {
  if git branch | grep "$1"; then
    echo "$1 branch exists locally, checkout and pull"
    git checkout "$1" && git pull
    return
  elif git ls-remote --heads origin "$1" | grep "refs/heads/$1"; then
    echo "$1 branch exists remotely, checkout and pull"
    git checkout "$1" && git pull
    return
  else
    echo "$1 branch does not exist, creating it"
    git checkout -b "$1" && git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)
    return
  fi
}

function gitcheckpush {
  echo "Deprecated function, use gitcheck instead"
  git checkout -b "$1" && git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)
}

function gitcheckm {
  echo "Attempting to checkout main/master branch"

  if git ls-remote --heads origin master | grep "refs/heads/master"; then
    echo "Master branch exists, checkout and pull"
    git checkout master && git pull && git status
    return
  elif git ls-remote --heads origin main | grep "refs/heads/main"; then
    echo "Main branch exists, checkout and pull"
    git checkout main && git pull && git status
    return
  else
    echo "What? You don't have master or main branch? Fix this script or check your 'git branch' output"
    cd $HOME
    return
  fi
}

# print normal pwd, though with git root folder highlighted if possible
alias pwdg=pwdgit
function pwdgit {
  pwd | pbcopy
  GIT_ROOT_FOLDER=$(basename $(git rev-parse --show-toplevel))
  pwd | sed "s/$GIT_ROOT_FOLDER/$(echo -e "${BRed}$GIT_ROOT_FOLDER${Color_Off}")/g"
}

alias gitupdatecurrentwithmaster="git fetch origin && git merge origin/HEAD && git push"
alias gitpull="git pull"
alias gitpush="git push"
alias gitaddall="git add ."
alias gitstatus="git status"
alias gitstat="git status"
alias gits="git status"
alias gitcommit="git commit -m "
alias gitdiff="git status && git diff"
alias gitdiff-w="git status && git diff -w"
alias gitd="git status && git diff"
alias gitcp="git cherry-pick"
alias gitcherry="git cherry-pick"
alias gitstash="git stash"
alias gitpop="git stash pop"
alias gitstashpop="git stash pop"
alias ghalogin="gh auth login && echo $(gh auth token) > ~/Desktop/temp/gh-auth-token && ghatoken"
alias ghatoken="export GH_TOKEN=$(cat ~/Desktop/temp/gh-auth-token) && export GITHUB_TOKEN=$(cat ~/Desktop/temp/gh-auth-token)"

function gitpullfolders {
  echo "Running Git Pull for all directories in $(pwd)"
  echo ""
  for dir in ./*/; do
    (
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

function gitpullstash {
  git stash && git pull && git stash pop
}
