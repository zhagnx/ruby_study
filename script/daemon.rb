#!/usr/bin/env ruby

require 'socket'

Process.daemon   # 进程以daemon的形式启动

TCPServer.open '127.0.0.1',4423 do |server|
    loop do
        client = server.accept # 等待来自客户端的连接请求

        client.puts Time.now   # 返回给客户端当前服务器自身的系统时间

        client.close
    end
end





