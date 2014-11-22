#!/usr/bin/env ruby


require 'pathname'

path = Pathname.new('/etc/resolv.conf')

path.dirname.opendir {|d| puts d.entries}
