#!/usr/bin/env ruby

require 'thread'

queue = Queue.new

## 生成3个worker
workers = 3.times.map {|t|
  Thread.fork {
  while req = queue.deq
    puts "worker#{t} processing.."
    req.call
  end 
 }
}

## 往queue里面压入10个处理
10.times do |t|
  queue.enq -> {
    sleep 1
  }
end

## 等待queue为空
sleep 1 until queue.empty? 

## 打印各个worker shrad 的状态
p workers.map(&:status)

## 再往queue里面压入5个处理
3.times do |t|
  queue.enq -> {
    sleep 1
  }
end
## 答应worker的状态
p workers.map(&:status)

sleep 1 until queue.empty?
