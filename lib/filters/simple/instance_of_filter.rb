module Tracing
  module Filter
    # filter on method
    class InstanceOf < BaseFilter
      def initialize(options)
        super(options)   
        @rules = options[:instance_rules] || options[:instance_filter] || {}
        @all = options[:all]
      end

      def allow_action(msg, context)
        obj = context[:self]
        if var_name.kind_of?(Symbol) || var_name.kind_of?(String)
          obj.instance_of?(var_name) ? :include : :exclude      
        else
          :yield
        end            
      end
    end
  end
end

