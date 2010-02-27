module Tracing
  module Appender
    attr_accessor :template, :target    
  end
  
  module Factory
    def self.create_appender(hash = {})
      new_appender do |appender| 
        appender.template = hash.template
        appender.target   = hash.target
      end
    end
    
    def self.new_appender(&block)
      yield Tracing::BaseAppender.new
    end
  end
  
end