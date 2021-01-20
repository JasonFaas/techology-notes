# Linux Application Monitoring

## Common Application Monitoring
* Application info
  * `systemctl <application> status`
    * systemctl <application> <input> input option:
      * status
      * restart
      * start
      * stop
  * `journalctl -u <application>.service`
    * TODO: Fill in all the flags like '--no-pager'
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