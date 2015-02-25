#!/usr/bin/env ruby
#
# TCP client designed to test the rot12_server daemon
#
require 'socket'

conn_num = ARGV[0] || 10
host     = 'localhost'
port     =  40713
counter  = 0

puts "%-8s %-25s %-8s %-6s %-8s %-6s %s" % %w(SntMsg StartsAt ConnId Delay RcvMsg Counter EndsAt)
conn_num.to_i.times.map do |n|
  Thread.new do
    socket= TCPSocket.open host, port
    st = Time.now.strftime("%F %T.%L")
    msg = "Moo{n}"
    socket.puts msg
    dsec = rand(5)
    sleep(dsec)
    rsp = socket.readline.chomp
    et = Time.now.strftime("%F %T.%L")
    counter += 1
    puts "%-8s %-25s %-8s %-6s %-8s %-6s %s" % [msg, st, n, dsec, rsp, counter, et]
  end
end.each(&:join)
