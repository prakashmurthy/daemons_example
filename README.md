# Daemonizing ruby processes with daemons gem

A simple example of daemonizing a ruby process using [daemons gem](http://daemons.rubyforge.org/)

# Setting up the repo locally
1. Clone the repository
2. change directory into the folder holding the cloned repo.
3. Run 'bundle install'

# Working with the Daemon process

## Starting the daemon
```ruby
> ruby my_server_control.rb start
```

This command does the following:

1. Start my_server.rb as a background process
2. Store the pid of the background process in /tmp/daemons-YYYY-mm-dd/my_server.rb.pid file
3. Start another process to monitor the above background process
4. Store the pid of the second background process in /tmp/daemons-YYYY-mm-dd/my_server.rb_monitor.pid file 

## Stopping the daemon
```ruby
> ruby my_server_control.rb stop
```

This command does the following:

1. Stop the my_server process using the pid in /tmp/daemons-YYYY-mm-dd/my_server.rb.pid file file
2. Stop the monitor process using the pid in /tmp/daemons-YYYY-mm-dd/my_server.rb_monitor.pid file
3. Cleanup the pid files. The pid files can be retained by passing ':keep_pid_files => true' as an option.

The my_server.rb process writes to '/tmp/server1-yyyy-mm-dd/server1.log' frequently.

## Restart the daemon
```ruby
> ruby my_server_control.rb restart
```

This command does the following:

1. Stop the my_server process & the monitor process, and cleaup the pid files. 
2. Start a new my_server process & a new monitor process with pids stored in appropriate files.

*Note:* backtrace of last exceptions will be written to /tmp/daemons-yyyy-mm-dd/my_server.rb.log file.
   

