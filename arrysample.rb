#!/usr/bin/env ruby


print "Please input 5 numbers[num01,num02,num03,num04,num05]:"
arry=gets.chomp.split(',')
sum,odd,qdd = 0,0,0
arry.each do |a| 
    num=a.to_i
    sum += num
    if (num % 2) == 0
        odd += 1
    elsif
        qdd +=1
    end
end 

puts "The arry have #{odd} odds,and have #{qdd} qdds ,Sum of arry:#{sum}"


