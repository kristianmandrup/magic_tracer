module Tracing
  class StreamTarget
    attr_accessor :stream
    
    def initialize(options = {})
      @stream = $stdout            
      if options
        case options[:stream]
          when :error
            @stream = $stderr      
        end
      end
    end    
    
    def append(txt, context)
      @stream << txt
    end
  end
end