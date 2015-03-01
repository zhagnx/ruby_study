#!/usr/bin/env ruby
require 'rubygems'
require 'net/http'
require 'wsse'
require 'base64'
$KCODE='u'
if ARGV.size < 1 or not ARGV.all?{|e|  File.exist? e} then
  puts "usage: #{__FILE__} 画像ファイル名
          ファイル名はタイトルになる。
          タイトル指定したいときはファイル名を使えば良い。"
          exit 2
end
ARGV.each{|e|
    f_name = e
    a = File.basename(f_name).split('.');a.pop
    title = a.join('.')
    content = Base64.encode64(open(f_name).read)
    xml = "<entry xmlns=http://purl.org/atom/ns >"+
            "<title>#{title}</title>"+
            "<content mode='base64'  type='image/jpeg'>#{content}</content>"+
            "</entry>"
    username, password = %w!takuya_1st xx***Xxx! ##ここにID/PWを入れる
    http = Net::HTTP.start("f.hatena.ne.jp", 80)
    response = http.get('/atom',{'X-WSSE' => WSSE::header(username, password )})
    response = http.post('/atom/post',xml, {'X-WSSE' => WSSE::header(username, password )})
    response.body =~ /<hatena:syntax>([^<]+)<\/hatena:syntax>/
    foto_id = $1
    puts "[#{foto_id}](#{title})"
}
