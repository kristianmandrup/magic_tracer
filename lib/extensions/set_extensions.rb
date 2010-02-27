class Set
  def action_handler(options = {})
    ah = Tracing::ActionHandler.new options
    self << ah
    yield ah
  end
end  