# Linux Application Monitoring

## Common Application Monitoring
* Application info
  * `systemctl <application> status`
    * systemctl <application> <input> input option:
      * status
      * restart
      * start
      * stop
    * `systemctl list-units`
    * `systemctl --all`
    * `systmctl list-unit-files`
    * so many more
  * journalctl -u <application>.service
    * flags
      * `-u` service name
      * `-n` (number of lines to print from the bottom)
      * `--no-pager` (what is this?)
      * `-o` (what is this?)
        * have an example of "cat" afterwords
      * -f (what is this?)
    * questions:
      * so many flags
      * TODO: Fill in all the flags like '--no-pager'
      * ? do i have to have ".service" as a suffix for -u flag?
  * sudo service uwsgi restart
    * TODO: how to list applications
* Logs
  * sudo cat /var/log/syslog
  * sudo journalctl -u <application> <optional-flags>
    * journalctl --list-boots
    * journalctl -u nginx.service -u mysql.service
    * journalctl -u mysql.service -f  # tail logs
    * journalctl -n 50 --since "1 hour ago"
    * journalctl -u sshd.service -r -n 1
    * journalctl -b  # list of boot processes
    * journalctl --no-pager  # To send your logs to standard output and avoid paging them
    * journalctl -u ssh  # Show logs for ssh
    * journalctl -k  # Only show kernel messages
    * journalctl -o json-pretty
  * logs are typically stored at "/var/log/"


## Questions
* What is difference between service and systectl e.g.:
  * `$ sudo systemctl status application_name`
  * `$ sudo service application_name status`
