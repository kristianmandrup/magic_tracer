module Tracing
  module Target
    class Base
      # Target can have filters 
      include Tracing::FilterUse

      attr_accessor :options
    
      def initialize(init_options = nil)          
        return if !init_options
        if init_options.kind_of? Hash
          @options = init_options[:options] || init_options
        else
          raise Exception, "Target must be initialized with Hash of options"
        end
      end 
  
      def time_limit
        options[:time_limit] || 1.minute    
      end    
    end
  end
end