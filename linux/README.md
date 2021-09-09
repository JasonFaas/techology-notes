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
  
## Commands
* echo "$?"
* grep
  * `$ grep cake what.txt` same as `$ cat what.txt | grep cake`
  * each (important) flag
  * -i (what?)
* whoami
* id
* find
  * `find / -name vlc`
  * `find / -iname '*jp*g'`
* sed
  * what is this?
  * flag -e (what is this)
  * example: `sed -e 's/^[ \t]*//'`
* ps
  * ps -ax
  * ps -ef
* aux
* kill
* ip route get 1.2.3.4 | awk '{print $7}'

## Viewing and Editing files
* more
* less
* vi
* cat

## SSH
* ssh-add -l  # list ssh keys
* ssh-add -k ~/.ssh/id_rsa  # add private key to ssh
* troubleshooting options if acting up
  * delete `~/.ssh/config` and `~/.ssh/known_hosts`
* relevant files at `/etc/ssh/ssh_config` and `/etc/ssh/sshd_config`
* run command on another machine with "ssh ip 'command'"
  * `ssh jfaas@127.0.0.1 ls`
* TODO:
  * File transfer with `rsync` and `scp`
  * Examples of what to add to `~/.ssh/config`
  * Jump host options
* rsync - file transfer across jump host
  * `rsync -r -v --rsh "ssh <user>@<ip> ssh" <second_ip>:/home/jfaas/<file_name> <path_or_file_name>`
* scp - easy file transfer
  * `scp <username>@<ip>:<file_name> <path_or_file_name>`
* Jump host in `~/.ssh/config` examples
  * ```
    Host 10.0.0.*
        ProxyJump <username>@<jump_host>
        ProxyCommand  ssh jump -W %h:%p
    ```

## Standard out and error
* `<application and flags> > "std_out.txt">"ssh_err.txt`
* `<application and flags> > "std_out_and_err.txt">&1` (this isn't exactly correct, but close)
