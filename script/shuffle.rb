#!/usr/bin/env ruby

def f 
  a = (1..10).to_a
  p a.sort_by {rand}
end


f
f
f
