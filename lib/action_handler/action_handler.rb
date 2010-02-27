Dir.glob(File.join(File.dirname(__FILE__), '**/*.rb')).each {|f| require f }

module Tracing
  class ActionHandler
    # supports:
    # - Filter registration and execution    
    # - Appender registration
    include Tracing::FilterUse
    registratable_set :appenders
  
    attr_accessor :name
  
    # register filters and appenders
    def initialize(options = {})
      if options.kind_of?(String) || options.kind_of?(Symbol)
        @name = options.to_s
      end    
      if options.kind_of?(Hash) && options.size > 0    
        register_filters(options.filters)
        register_appenders(options.appenders)
      end
    end 

    # action for tracelogs that pass the filters
    # by default send to all appenders for further processing!
    def handle_allow(txt, context)
      appenders.each do |appender|
        appender.handle(txt, context)
      end
    end

    # action for tracelogs that DO NOT pass the filters
    def handle_not_allow(txt, context)
    end

    # handle tracelogs by applying filters and action handler methods
    def handle(txt, context)
      if filters_allow?(txt, context)
        handle_allow(txt, context)
      else
        handle_not_allow(txt, context)
      end
    end
    
    # try to register appender or filter on action_handler
    def method_missing(method_name, *args, &block) 
      appender = try_appender(method_name.to_s, *args)
      # _filter = try_filter(method_name.to_s, *args)

      # found = nil
      # if appender
      #   register_appenders appender
      #   found = appender        
      # elsif _filter
      #   register_filters _filter
      #   found = _filter                
      # end
      # if found  
      #   puts "found: #{found}"
      #   yield found if block
      #   return found if !block
      # else       
      #   super(method_name, args)
      # end
    end        
            
  end # class
end # module