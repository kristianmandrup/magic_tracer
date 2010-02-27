class Hash
  def appenders        
    list = self[:appenders]
    list.appenders if list
    if list
      list.appenders        
    else
      self.appender
    end    
  end

  def appender        
    return appenders if self[:appenders]
    Tracing::Factory.create_appender(self)
  end
end