#!/usr/bin/env ruby
  p  Time.new   #get now time 
  p  Time.now   #get now time

  p Time.now.zone    #print now time zone
  p Time.now.getutc  #get the utc time
  now = Time.now.utc #set the timezone to utc
  p now.zone         #print now time zone 
  p "---------to_i to_f to_r to_s-----------"
  now = Time.now
  p now.to_i         #整数 
  p now.to_f         #浮点数
  p now.to_r         #有理数
  p now.to_s         #字符串
  p "-----------get year month day hour min sec nsec wday---------"
  p now.year
  p now.month
  p now.day
  p now.hour
  p now.min
  p now.sec
  p now.nsec
  p now.wday
  p "--------?weekday-----------"
  p now.dst?
  p now.sunday?
  p now.thursday?
  p "-------comparable----------"
  p past = Time.now
  p future = Time.now

  p past == future
  p past.nsec
  p future.nsec

  p past <=> future
  p past < future
  p past > future

  p "--------plus or Subtraction---------"
  p now03 = Time.now
  p now03 + 1 
  p now03 - 1

  sleep 3
  p now04 = Time.now
  p now04 - now03

  p "-------make time object-------------"
  p Time.at(0)
  p Time.at(0).getutc
  p Time.at(-10000000000)  #回到远古
  p Time.at(2000000000)    #去未来

  p "-------print the time formats--------"
  now05 = Time.now
  p now05.strftime('%Y年%m月%d日 %H:%M:%S')
  p now05.strftime('%B')
  p now05.strftime('%^B')

