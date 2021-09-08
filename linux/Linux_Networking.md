# Linux Tools

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
  * ip
    * ip addr | grep 'global eth1'
    * ip addr show