module Tracing
  # abstract filter  
  class BaseFilter
    attr_reader :name
    attr_accessor :rules
    
    def initialize(options = {})
      @name = options[:name] || "Unknown filter"      
    end
    
    def name_allow_action(name)
      rules.rules_allow_action(name)
    end
  end  
end


