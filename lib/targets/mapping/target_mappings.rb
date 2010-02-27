module Tracing
  module Target
    module Mappings  
      def self.defaults
        {
          :file => Tracing::FileTarget, 
          :events => Tracing::EventStackTarget,
          :socket => Tracing::SocketTarget,          
          :stream => Tracing::StreamTarget,
          :string => Tracing::StringTarget,
        }
      end
    end
  end
end