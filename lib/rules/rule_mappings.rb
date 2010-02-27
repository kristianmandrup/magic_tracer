module Tracing
  module Rule
    module Mappings  
      def self.prefix_map
        {
          :i => :include,
          :x => :exclude,
          :iy => :include_and_yield,
          :xy => :exclude_and_yield      
        }
      end  
    end
  end
end