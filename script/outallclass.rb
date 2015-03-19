#! /usr/bin/env ruby

ObjectSpace.each_object(Class) do |klass|
  puts klass.name
end
