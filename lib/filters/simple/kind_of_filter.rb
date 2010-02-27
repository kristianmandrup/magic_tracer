module Tracing
  # filter on method
  module Filter
    class KindOf < BaseFilter
      def initialize(options)
        super(options)   
        @rules = options[:kind_rules] || options[:kind_filter] || {}
        @all = options[:all]
      end

      def allow_action(msg, context)
        obj = context[:self]
        if var_name.kind_of?(Symbol) || var_name.kind_of?(String)
          obj.class.is_a?(var_name) ? :include : :exclude      
        else
          :yield
        end            
      end
    end
  end
end

