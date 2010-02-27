class Module  
  def registratable_set(name)
     methods = %Q{
      attr_accessor :registered_#{name}
  
    def get_#{name}
      @registered_#{name} ||= Set.new
    end

    def register_#{name}(reg_#{name})
      @registered_#{name} ||= []      
      @registered_#{name}.add(reg_#{name}.#{name})
    end

    def unregister_#{name}(unreg_#{name})
      registered_#{name}.delete(unreg_#{name})
    end    

    def clear_#{name}
      @registered_#{name} = nil
    end    
  
    def #{name}(options = nil, &block)
      yield get_#{name}
    end      
  
    def try_#{name.to_s.singularize}(method_name, *args)
      method = method_name.gsub(/_#{name.to_s.singularize}/, '')
      return if !method
      options = method.to_sym.#{name.to_s.singularize}_class || method.to_sym      
      return Tracing::Factory.create_#{name.to_s.singularize} options 
    end
    }
    self.class_eval methods
  end  

  def registratable_sets(*names)
    names.each do |name|
      registratable_set(name)
    end 
  end 

  def try_create(name)
    methods = %Q{
      def try_#{name.to_s.singularize}(method_name, *args)
        method = method_name.gsub(/_#{name.to_s.singularize}/, '')
        return if !method
        options = method.to_sym.#{name.to_s.singularize}_class || method.to_sym      
        return Tracing::Factory.create_#{name.to_s.singularize} options 
      end
    } 
    self.class_eval methods    
  end
  
  def registratable(name)
     methods = %Q{
      attr_accessor :registered_#{name}
  
    def get_#{name}
      @registered_#{name}
    end

    def register_#{name}(reg_#{name})
      @registered_#{name} ||= reg_#{name}      
    end

    def clear
      @registered_#{name} = nil
    end    
  
    def #{name}(options = nil, &block)
      yield get_#{name}
    end      
  
    }
    try_create(name)    
    self.class_eval methods
  end    
end
  
  