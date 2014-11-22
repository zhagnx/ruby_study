#!/usr/bin/env ruby


now = Time.now.strftime('%Y%m%d%H%M%S')
filename = "log."+Process.pid.to_s + "." +now
File.new(filename,"w")


