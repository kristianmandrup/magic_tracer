module Tracing
  module Template
    module Mappings  
      def self.defaults
        {
          :string => Tracing::Template::String, 
          :xml => Tracing::Template::Xml,
          :html => Tracing::Template::Html,          
          :default => Tracing::Template::String
        }
      end
    end
  end
end