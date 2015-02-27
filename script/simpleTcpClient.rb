#!/usr/bin/env ruby 

require 'socket'

sock = TCPSocket.open("127.0.0.1",20000)
sock.write($*)

sock.close

