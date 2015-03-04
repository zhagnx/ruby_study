#!/usr/bin/env ruby
require 'uri'
str = ARGV.join if ARGV.size > 0
str = STDIN.read unless ARGV.size > 0
puts URI.encode(str)
