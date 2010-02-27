module Tracing
  module Filter
    # filter on method
    class RespondsTo < BaseFilter
      def initialize(options)
        super(options)   
        @rules = options[:respond_rules] || options[:respond_filter] || {}
      end

      def allow_action(msg, context)
        obj = context[:self]
        obj = obj.class if @on_class      
        if var_name.kind_of?(Symbol) || var_name.kind_of?(String)
          obj.responds_to?(var_name) ? :include : :exclude      
        else
          :yield
        end            
      end
    end
  end
end