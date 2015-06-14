#!/usr/bin/env ruby

# sort and uniq a file

file_array = File.readlines(ARGV[0]).uniq.sort
File.open('./result/sort_file.txt', 'w') do |fh|
  file_array.each do |line|
    fh.write(line)
  end
end


