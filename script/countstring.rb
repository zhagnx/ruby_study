#!/usr/bin/env ruby

puts "Please input a string:"
string = gets
a,d,s,o =0,0,0,0
string.each_char do |c|
  if  c =~ /[[:alpha:]]/ 
    a +=1
  elsif c =~ /[[:digit:]]/
    d +=1
  elsif c =~ /\s+/
    s +=1
  else
   o +=1
  end
end

puts "have #{a} alphas,have #{d} digits,have #{s} spaces,have #{o} ohters characters."


