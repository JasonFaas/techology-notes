# Linux Tools

## Terminals:
* iTerm
  * https://medium.com/swlh/power-up-your-terminal-using-oh-my-zsh-iterm2-c5a03f73a9fb

## CSV tools
* column

## Process IDs
* ps
  * flags:
    * -u `[user]`
      * processes created by `[user]`
    * -e and -f
      * display lots of info, more details
  * IDs of note: - verify all
    * 0 - scheduler
    * 1 - init process
    * 2 - kflushd
    * 3 - kupdate
    * 4 - kpiod
    * 5 - kwapd
    * 6 - mdrecoveryd

## CHMOD
* Quick vocab - clean this up:
  * u - user/owner (1st)
  * g - group (2nd)
  * o - others (3rd)
  * r - read (4)
  * w - write (2)
  * x - execute (1)