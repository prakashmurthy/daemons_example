#########################################################################
#  my_server_control.rb
#
#  Wrapper script to daemonize my_server.rb
#
#  Usage:
#  -----
#
#  1. Start the process:
#  $ ruby my_server_control.rb start
#
#  2. Stop the process:
#  $ ruby my_server_control.rb stop
#
#  3. Restart the process:
#  $ ruby my_server_control.rb restart
#
#########################################################################
require 'daemons'
require 'date'
require 'fileutils'

pid_log_dir = "/tmp/daemons-#{Date.today.to_s}"
if !File.exists?(pid_log_dir) && !File.directory?(pid_log_dir)
  FileUtils.mkdir_p pid_log_dir
  FileUtils.chmod_R 0777, pid_log_dir
end

options = {
  :dir_mode  => :normal,    # The directory given by :dir is interpreted as absolute/relative path for pid & log file
  :dir       => pid_log_dir,# Directory for storing the log & pid file 
  :multiple  => false,      # Multiple instances of the daemon are NOT allowed.
  :backtrace => true,       # Write the backtrace to a log file in the pid-file directory for unhandled exceptions
  :monitor   => true        # Monitors the programs and restarts crashed instances.
}

Daemons.run( File.join(File.dirname(__FILE__), 'my_server.rb' ), options)
