#!/usr/bin/env ruby

require 'csv'
require 'yaml'
require 'json'

### the study of yaml lib
yaml_string = <<EOS
---
remote:
  host: localhost
  port: 22
  ssh: true
  username: zhangxianghong
  password: zhangxianghong
EOS

p setting = YAML.load(yaml_string)

p setting['remote']

p setting['remote']['port']
setting['remote'].update('port' => 2222)
p setting['remote']['port']

p YAML.dump(setting)
p setting.to_yaml

### the study of json lib

data = [1,2.0,{'key' => 'value'},nil,true,false]

p JSON.dump(data)
p json=data.to_json

p JSON.load(json)
p JSON.parse(json)

### the study of csv lib
p ['I', 'my', 'me', 'mine'].to_csv
p 'I,my,me,mine'.parse_csv
p %(foo,bar,baz).parse_csv
p %("foo","bar","baz").parse_csv
p %("foo","\"bar\"",baz).parse_csv


### the to many records csv file

csv = CSV.new(<<EOS)
foo,bar,baz
hoge,piyo,fuga
a,b,c
EOS

csv.each do |row|
  puts row.join('|')
end





