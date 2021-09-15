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
      * `-u`/`--unit` service name
      * `-f`/`--follow` show new entries instead of `tail`
      * `-n` number of lines to print from the bottom
      * `--no-pager` Sends output to terminal instead of `less` style
      * `-o`/`--output` specify output formatting
        * `cat` no metadata included in output
        * `json`
        * `verbose`
        * `short` default output
      * `-S`/`--since`
        * `-2h` after 2 hours ago
        * `today` everything today
        * `yesterday` everything yesterday and today
      * `-U`/`--until`
        * `-2h` before 2 hours ago
        * `today` everything before today
        * `yesterday` everything before yesterday
        * `tomorrow` everything before tomorrow
      * `--flush` remove all current logs
      * `--version`
    * examples
      * 
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
