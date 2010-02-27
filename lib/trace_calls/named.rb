module Tracing
  class Named
    attr_accessor :name
    
    def initialize(options = {})
      @name ||= options[:name] || options.to_s
    end
  end
end