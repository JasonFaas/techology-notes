# Linux Tools

## Terminals:
* iTerm
  * https://medium.com/swlh/power-up-your-terminal-using-oh-my-zsh-iterm2-c5a03f73a9fb

## Common networking tools
* top
  * Line 1:
    * Time
    * Computer up time
    * number of users
    * load average
  * Line 2, concurrent tasks including
    * number of tasks
    * number running tasks
    * number sleeping tasks
    * number stopped tasks
  * Line 3, CPU performance
  * Line 4, memory
  * Line 5, swap space
  * Lots of process info
* vmstat
  * Linux use of virtual memory
  * examples
    * vmstat
      * basic details of processes, memory, swap, io, system, cpu
    * vmstat 5
      * update statistics every 5 seconds
    * vmstat 5 4
      * update statistics every 5 seconds 4 times then stop vmstat
    * vmstat 10 -S M
      * update statistics every 10 seconds with memory and swap statistics displayed in megabytes
        * k = 1,000 bytes
        * K = 1,024 bytes
        * m = 1,000,000 bytes
        * M = 1,048,576 bytes
  * other flags
    * -a
      * highlight active and inactive memory separate
    * -f
      * number of forks since the computer was booted up
* netstat
  * netstat -tulpn | grep LISTEN
    * Ports open on local machine
  * netstat -a
    * List all connections of TCP and UDP ports
  * netstat -at
    * List all TCP port connections
  * netstat -au
    * List all UDP port connections
  * netstat -l
    * List all listening ports connections
  * netstat -s
    * display statistics by protocol
* ???Understand these Tools!
  * asadm (asmonitor)
  * top, htop (mpstat)
  * iostat
  * iotop -o
  * iftop, tcpdump, Wireshark alternatives
  * Intel specifc
    * vtune
    * mlc

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