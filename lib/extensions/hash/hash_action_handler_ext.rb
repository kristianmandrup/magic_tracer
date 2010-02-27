class Hash
  # return action_handler
  def action_handlers
    list = self[:action_handlers]
    if list
      list.action_handlers        
    else
      self.action_handler
    end
  end

  def action_handler
    return action_handler if self[:action_handlers]    
    Tracing::ActionHandler.new(self)
  end
end  