module Tracing
  # base appender (abstract)
  class BaseAppender
    registratable_set :filters
    registratable :target
    registratable :template

    def initialize(options = {})
      @filters ||= []      
    end

    # default action handler depending on filters result 
    def handle(txt, context)
      if filters_allow?(txt, context)
        allow_append(txt, context)
      else
        not_allow_append(txt, context)
      end
    end
  
    def allow_append(txt, context)  
      raise Exception, "allow_append should be overridden by subclass"          
    end

    def not_allow_append(txt, context)
      raise Exception, "not_allow_append should be overridden by subclass"                
    end
              
    def method_missing(method_name, *args, &block) 
      _template = try_template(method_name.to_s, *args)
      _filter = try_filter(method_name.to_s, *args)
      _target = try_target(method_name.to_s, *args)      
      
      if _template
        template = template        
        yield template if block         
        return template
      elsif _filter
        register_filters _filter        
        yield _filter if block
        return _filter
      elsif _target
        register_targets _target
        yield _target if block
        return _target
      else       
        super(method_name, args)
      end

    end    
    
  end
end  