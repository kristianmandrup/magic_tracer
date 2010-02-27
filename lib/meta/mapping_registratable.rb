class Module  
  def registratable_mapping(name)
    methods = %Q{
      module Registration  
        module #{name.to_s.capitalize}
          attr_accessor :#{name}_mappings

          # when module included, setup default mappings 
          # use Set to avoid duplicate entries
          def included(clazz)
            defaults = Tracing::#{name.to_s.singularize.capitalize}::Mappings.defaults
            #{name}_mappings ||= Set.new
            #{name}_mappings.add(defaults)
          end
        end
      end
    }          
    self.class_eval methods
    self.class_eval "include Registration::#{name.to_s.capitalize}"
  end
  
  def registratable_mappings(*names)
    names.each do |name|
      registratable_mapping(name)
    end 
  end 
  
end  
      