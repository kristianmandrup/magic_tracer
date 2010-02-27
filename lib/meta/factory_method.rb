class Module
  def factory_method(name)
     methods = %Q{
      def self.create_#{name}(options_hash = {})
        available = Tracing::TraceCalls.active_configuration.registered_#{name.to_s.pluralize}
        return if !available
        available.each do |key, clazz|
          if self[:#{name}] == key
            return clazz.new options_hash
          end
        end
        raise Exception, "No key found"
      end
    }
    self.class_eval methods    
  end
  
  def factory_methods(*args)
    args.each do |arg|
      factory_method(arg)
    end 
  end 
end   