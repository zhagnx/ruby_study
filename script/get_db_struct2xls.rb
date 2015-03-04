#! /usr/bin/env ruby

# description: This script is used to pickup the database table schma into a xls format. 
# author: andy.chou
# date: 2015/02/07


require 'axlsx'
require 'csv'

FileUtils.mkdir_p("tmp")
FileUtils.mkdir("result") unless File.exists?("result")

## get the tables structure from DB
get_databases = "mysql -uroot -h \"127.0.0.1\"  -e \"show databases\" | grep \"development$\" > tmp/databaslist"
`#{get_databases}`

open("tmp/databaslist") do | f |
  f.each_line do | database |
    database.chomp!
    Dir.mkdir("tmp/#{database}") 
    get_tables = "mysql -uroot -h \"127.0.0.1\" -e \"show tables from #{database}\" | grep -v \"Tables_in_\" > tmp/#{database}/tables"  
    `#{get_tables}` 
    open("tmp/#{database}/tables") do | file |
      file.each_line do | table |
        table.chomp!
        get_table_struct = "mysql -uroot -h \"127.0.0.1\" -e \"show columns from #{database}.#{table}\" | tr \"\\t\" , >  tmp/#{database}/#{table}.csv"
        `#{get_table_struct}`
      end
    end
  end 
end

## make the dbschema xls
databases = Dir["tmp/*development"]
databases.each do |database| 
  package = Axlsx::Package.new
  Dir["#{database}/*.csv"].each do |table_path|
    table_name= File.basename(table_path, '.*')
    sheet = package.workbook.add_worksheet(name: table_name[0..30])
    sheet.add_row([''])
    sheet.add_row(['', 'DATABASE',File.basename(database), 'GAME', 'a game'])
    sheet.add_row(['', 'TABLE NAME', table_name,'DEVELOPER',''])
    sheet.add_row(['', 'DESCRIPTION', '', 'DBA', ''])
    sheet.add_row(['', 'TABLESPACE_NAME', '', 'DATE',''])
    sheet.add_row(['', '', 'FILED NAME', 'TYPE', 'NULL', 'KEY', 'DEFAULT', 'EXTRA', 'DESC/VALUE'])
    first_row = true
    CSV.foreach(table_path) do |row|
      if !first_row  
        sheet.add_row(['', '', row, ''].flatten)
      else
        first_row = false
      end 
    end 
  end 
  package.serialize("#{database}.xlsx") 
end

## mv the xlsx files to result
FileUtils.cp(Dir.glob('tmp/*.xlsx'), 'result')
FileUtils.rm_r('tmp')
