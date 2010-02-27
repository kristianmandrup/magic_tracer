module Tracing
  module Filter
    module Mappings 
      def self.defaults
        {
         :module => Tracing::Filter::Module,
         :class  => Tracing::Filter::Class,
         :method => Tracing::Filter::Method,
         :vars => Tracing::Filter::InstanceVar,
         :args => Tracing::Filter::Argument,
        }
      end  
    end
  end
end