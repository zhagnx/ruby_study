#!/usr/bin/env ruby


1.upto(9) { |a| 1.upto(9) {|b| print "%3d%s" % [(a*b),b==1? "|" : ""]} ; puts "\n"+(a==1 ? '-'*30 : "")}
1.upto(9) { |a| 1.upto(9) {|b| print "%3d%s" % [(a*b),b==1? "|" : ""]} ; puts "\n"+(a==1 ? '-'*30 : "")}
