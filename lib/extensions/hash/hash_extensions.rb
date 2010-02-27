class Hash

  def configuration
    Tracing::Configuration.new(self)
  end
  
  def final_yield_action
    self[:final_yield_action] || :include
  end  

  # return template
  def template     
    # puts "Template from : #{self.inspect}"
    template_key = self[:template] || self[:type]
    template_class = TemplateMappings.defaults[template_key]
    # puts template_class.inspect
    template_class.new if template_class
  end
    
  def get_from_map(key)
    clazz = self[key]
    return clazz if clazz
    self[:default]
  end
  
protected
  def has_prefix(symbol, prefix)
    sym = symbol.prefix(prefix)
    self.has_key?(sym) ? {:filter_symbol => sym, :prefix => prefix} : false
  end

  def has_any_prefix(symbol)
    ['iy', 'xy', 'i', 'x'].each do |prefix|
      hash_result = has_prefix(symbol, prefix)
      return hash_result if hash_result         
    end  
    false
  end    
end  



