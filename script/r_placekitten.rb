#!/usr/bin/env ruby

require 'open-uri'
# Open http://placekitten.com/ for reading on line 4!
kittens = open("http://placekitten.com")
body = kittens.read[559, 441]
# Add your puts statement below!
puts body
