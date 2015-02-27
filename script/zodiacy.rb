#encoding: utf-8
require 'rubygems'


def zodiac(year)
  zodiacs = [
    "鼠", "牛", "虎", "兔", "龙", "蛇", 
    "马", "羊", "猴", "鸡", "狗", "猪"
  ]
 
   zodiacs[(year - 2008) % 12]
end


puts zodiac(1978)

puts zodiac(2013)

puts zodiac(1982)

puts zodiac(2010)

puts zodiac(1981)
