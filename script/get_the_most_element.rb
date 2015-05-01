#! /usr/bin/env ruby
# 演示两种从一个数组中找出出现次数最多的元素的方法

ary =  [5, 3, 3, 4, 5, 6, 6, 5, 5, 9, 6, 8, 1, 7, 7, 7, 7, 7, 5, 5, 4, 2, 2, 2, 3, 3, 10]
p ary.group_by {|e| e}.sort_by {|key, value| -value.size}.map(&:first).first
p ary.max_by {|e| ary.count(e)}

