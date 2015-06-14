#!/usr/bin/env ruby

## delete the blank lines and coment lines
## author: andy chou
## date:  2015014

in_file = File.open(ARGV[0])
out_file = File.open(ARGV[1],'w')

in_file.each_line do |line|
  #next line if /正規表現/ =~ line
  next line if /^\s*$/ =~ line
  next line if /^\s*#/ =~ line
  out_file.write(line)  
end

in_file.close
out_file.close
