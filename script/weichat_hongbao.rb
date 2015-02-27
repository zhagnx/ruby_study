#!/usr/bin/env ruby

# 一个模拟微信红包的算法实现
# 1，保证所有人都能分到红包，至少0.01元，用户领取红包的金额最小值精确到分
# 2，没人随机领取红包金额，保证相差不要太大,总的红包金额为整数
# 3，所有人最后获得红包金额合计等于红包初始金额

freinds = ARGV[0].to_i
money =  ARGV[1].to_i
MIN = 0.01

(1..freinds-1).each do |i|
  safe_money = (money - (freinds - i) * MIN) / (freinds -i)
  per_money =  (rand(1..(safe_money*100).to_i)/100.0).round(3)
  money = (money - per_money).round(3)
  p "第#{i}个红包，抢得#{per_money}元,余额:#{money}元" 
end

p "第#{freinds}个红包，抢的#{money}元,余额:0元"




