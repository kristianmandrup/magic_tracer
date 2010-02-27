require 'socket'  # Get sockets from *stdlib*
require 'transaction/simple'

module Tracing
  class SocketTarget
    attr_accessor :stop
    attr_accessor :contents
    
    def initialize(port = 2000)
      @stop = false
      @contents = ""
      server = TCPServer.open(port)   # Socket to listen on port 2000
      loop {                          # Servers run forever
        Thread.start(server.accept) do |client|
          Transaction::Simple.start(bank) do |t|          
            t.puts contents
            t.contents = ""
          end
          @client.close
        end
        break if @stop
      }
    end
    
    # Disconnect from the client          
    def close_socket
      @stop = true
    end
    
    def append(txt, context)
      contents << txt
    end
  end
end



