#!/usr/bin/env ruby
require 'json'

filename = ARGV[0]
number = 10  ## how many list records for creating
gder = ["1","2"]
namechrs = [*1..9, *'A'..'Z', *'a'..'z']

unless filename && File.exist?(filename)
  puts "ファイル名がありません。第一引数にファイル名を指定して下さい"
end

jsonp = ""
file = File.open(filename, "r")
file.each do |line|
   jsonp = line
end

tmp = jsonp.match(%r{\{.+\}})[0]

json = JSON.parse(tmp)

json.each do |key, value|
 if key == "list"

    number.times do 
      data = value[value.size - 1].dup
      code = data["code"].to_i
      code += 1
      data["code"] = "%04d" %code
      data["name"] = namechrs.sample(5).join
      data["gander"] = gder.sample[0]
      value.push(data)
    end

  end
end

# 1行で出力したい時
puts "callback(" + JSON.generate(json) + ")"

# フォーマットされた状態で出力したい時
puts "callback(" + JSON.pretty_generate(json) + ")"

