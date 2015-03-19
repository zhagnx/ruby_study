#! /usr/bin/env ruby


def foo(x, y)
  add = x + y
  sub = x - y
  begin
    mul = x * y
    div = x / y
  rescue => ex
    puts(ex.message)
  ensure
    return add, sub, mul, div
  end
end
p foo(10, 0)  # エラーが発生する


def foo(x, y)
  result = x + y
  return result
rescue => ex
  return x, y
ensure
  if result
    puts "xとyを足した結果は、#{result}でした"
  else
    puts "xとyは足せませんでした"
  end
end
 
p foo(10, 20)
p foo(10, "a")
