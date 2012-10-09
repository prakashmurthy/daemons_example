#########################################################################
# my_server.rb
#
# The process to be daemonized
# my_server logs an info message to the logger at frequent intervals
#
#########################################################################
require 'date'
require 'fileutils'
require 'logger'

@log_dir = "/tmp/server1-#{Date.today.to_s}"
if !File.exists?(@log_dir) && !File.directory?(@log_dir)
  FileUtils.mkdir_p @log_dir
  FileUtils.chmod_R 0777, @log_dir
end

@logger = Logger.new( "#{@log_dir}/server1.log" )
@logger.level = Logger::DEBUG

while true
  interrupted = false
  trap("INT") { interrupted = true } 
  sleep 5
  @logger.info "\tProcess working. Time : #{Time.now.strftime('%H:%M:%S')}"
  exit if interrupted
end
