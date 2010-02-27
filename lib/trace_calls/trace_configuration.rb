module Tracing
  class Configuration
    class << self 
      def apply(options = {})
        in_module = options[:module]
        classes_to_trace = options[:classes]
        return if !classes_to_trace
        classes_to_trace.each do |cls|
          eval "#{in_module}::#{cls}.class_eval { include Tracing::TraceCalls }"
        end            
      end

      registratable_mappings :filter, :template, :appender, :target      
    end
    
    registratable_sets :filters, :action_handlers, :templates          
    
    attr_accessor :final_yield_action, :name

    def initialize(options = {}) 
      @name ||= 'default'
      if options.kind_of?(String) || options.kind_of?(Symbol)
        name = options.to_s        
      else      
        if options.kind_of?(Hash) && options.size > 0
          name = options[:name] if options[:name]      
          register_filters(options.filters)
          register_action_handlers(options.action_handlers)
          @final_yield_action = options.final_yield_action
        end
      end
    end
        
  end
end  


   

