module Kernel
  def self.included(base)
    base.class_eval do
      unless method_defined? :method_missing
        def method_missing(meth, *args, &block); super; end
      end
      alias_method :old_method_missing, :method_missing
      alias_method :method_missing, :my_method_missing
    end
  end

  def my_method_missing(meth, *args, &block)
    ['appender', 'filter', 'target', 'template'].each do |name|
      method = meth.gsub(/_#{name}/, '')    
      if method
        new_instance = method.to_sym.send("#{name}_class").new *args        
        yield new_instance if block
        return new_instance
      end
    end
    old_method_missing(meth, *args, &block)
  end
      
end
