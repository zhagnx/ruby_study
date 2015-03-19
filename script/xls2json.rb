#! /usr/bin/env ruby

# シートごとに1ファイル生成される。
# 先頭に"!"が付いた名前のシートは処理対象とされない。
# "1行目の各列をキーとした辞書の配列が作られる。
# セルの中身がCSVの場合、配列に変換される。

require 'spreadsheet'
require 'json'
 
Spreadsheet.client_encoding = 'UTF-8'
 
begin
 book = Spreadsheet.open $*[0]
rescue
 STDERR.puts "usage: ruby xls2json.rb excel_file"
 exit false
end
 
book.worksheets.each do |sheet|
  next if sheet.name.index('!') == 0
 
  labels = sheet.rows.first
  rows = []
  sheet.rows[1..-1].each do |row|
    hash = Hash.new()
    row.each_with_index do |cell, i|
      hash[labels[i]] = cell.kind_of?(String) && cell.include?(',') ? cell.split(',') : cell
    end
    rows.push hash
  end
 
  f = File.open(sheet.name + '.json', 'w')
  f.write JSON.generate(rows)
  f.close
end
