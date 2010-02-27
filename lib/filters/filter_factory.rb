module Tracing
  module Filter
    
    module Factory
      def self.create(key)
        Tracing::Configuration.filter_mappings[key].new
      end
      
    end
  end
end