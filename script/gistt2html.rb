#!/usr/bin/env ruby
#coding:utf-8

require 'openssl'
require 'open-uri'
require 'rubygems'
require 'json'

if ARGV.size < 1 || ! (/([0-9a-z]+)/ =~ ARGV[0])
 puts "Usage : Gist のIDを指定。"
 puts "以下のように指定"
 puts " #{FILE} https://gist.github.com/3033059 "
 puts " #{FILE} https://gist.github.com/3033059.js "
 puts " #{FILE} https://gist.github.com/3033059.json "
 puts " #{FILE} 3033059 "
 exit
 end

id = $1
 json = open("https://gist.github.com/#{id}.json").read
 data = JSON.load json
 puts '<link rel="stylesheet" href="https://gist.github.com/stylesheets/gist/embed.css"/>'
 puts data["div"]
