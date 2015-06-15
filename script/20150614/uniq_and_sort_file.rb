#!/usr/bin/env ruby

# sort and uniq a file

file_array = File.readlines(ARGV[0]).uniq.sort
file_basename =  File.basename(ARGV[0])
File.open("./result/sorted_uniq_#{file_basename}", 'w') do |fh|
  file_array.each do |line|
    fh.write(line)
  end
end


