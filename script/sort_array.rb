#!/usr/bin/env ruby
require 'csv'


csv = CSV.table("file/ruby_1.csv")
puts "rubyの得点を基準に降順に並べ替え、名前とrubyの得点を出力する"
csv.sort_by {|obj| obj[:ruby]}.reverse.each {|i| puts "#{i[:name]} #{i[:ruby]}"}
puts "平均点を計算し降順に並べ替え、名前と平均点を出力する"
csv.sort_by {|obj| (obj[:ruby] + obj[:php] + obj[:perl]).to_f / 3 }.reverse.each {|i| puts "#{i[:name]} #{(i[:ruby] + i[:php] + i[:perl]).to_f / 3}" }

