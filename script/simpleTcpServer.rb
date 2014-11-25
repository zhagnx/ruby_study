#!/usr/bin/env ruby

require 'socket'

# 打开端口200000
server = TCPServer.open(20000)

#to accespt the client access
sock = server.accept

#receive the data from client and print it to console 
while buf = sock.gets
  p buf.to_s
end

# close this access soket
sock.close

#close the server socket
server.close

