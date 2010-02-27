module Tracing
  module Target
    class String
      attr_accessor :text
    
      def append(txt, context)
        @text << txt
      end
    end
  end
end