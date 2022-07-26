# Git Commands

## Intermediate
* Squash and merge `branch_name` into `main`
  * git pull
  * git checkout main
  * git merge --squash `branch_name`
  * git commit -m "`commit message`"
  * git push
  * git push origin --delete `branch_name`

## Other commands
* `git reset --hard HEAD` - Clean up all code changes locally