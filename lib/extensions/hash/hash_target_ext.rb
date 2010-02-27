class Hash
  def targets        
    list = self[:targets]
    list.targets if list
    if list
      list.targets        
    else
      self.target
    end    
  end

  def target        
    return targets if self[:targets]
    Tracing::Factory.create_target(self)
  end
  
end  