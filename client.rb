require 'socket'
require 'json'
s = UDPSocket.new

# HOST = '192.168.245'
HOST = 'localhost'

N = 70

tags = (1..10).map {|i| "tag-#{i}"}

1.upto N do |i|
  msg = JSON.dump(
    desc: "hello ##{i}",
    tags: tags.shuffle.take(3)
  )
  s.send(msg, 0, HOST, 5555)  
  p [:send, msg]
  sleep 0.1
end
