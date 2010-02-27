module Tracing
  module Filter
    # filter on method
    class SingletonMethods < BaseFilter
      def initialize(options)
        super(options)   
        @rules = options[:singleton_method_rules] || options[:singleton_method_filter] || {}
        @all = options[:all]
      end

      def allow_action(msg, context)
        obj = context[:self]
        obj = obj.class if @on_class      
        if var_name.kind_of?(Symbol) || var_name.kind_of?(String)
          methods = obj.singleton_methods(@all)
          methods.include?(var_name) ? :include : :exclude      
        else
          :yield
        end            
      end
    end
  end
end

