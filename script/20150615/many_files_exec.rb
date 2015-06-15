#!/usr/bin/env ruby

##背景
# 工作中经常会碰到输入文件和输出文件作为参数，传递给命令行执行的情况
# 例如： ./hoge.exe infile outfile
# 当存在多个文件需要处理的情况，则需要手动不断重复修改命令行，重复键入回车键，比较麻烦

## 解决思路
# ./script.rb ./shell-command infolder outfolder
# 如上，输入文件所在的目录 和 输出文件所在目录 作为参数，
# 可一次处理N个文件



if ARGV.size < 2 then
  exit
end

command = ARGV[0]
infolder  = ARGV[1]
outfolder = ARGV[2]

infiles     = Dir::glob("./#{infolder}/*.in")
inbasenames = infiles.map {|infile| File.basename infile, ".in"}
outfiles    = inbasenames.map {|basename| "./#{outfolder}/#{basename}.out"}

infiles.zip(outfiles).each do |inout|
  command_line = "#{command} #{inout[0]} #{inout[1]}"
  puts command_line
  `#{command_line}`
end

