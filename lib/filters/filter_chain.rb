module Tracing
  module Filter
    class Chain < Tracing::Named
      include Enumerable
      registratable_set :filters      
   
      def initialize(options = {})
        filters.register_filters(options) 
        super(options)
      end
      
      def each
        filters.each do |filter|
          yield filter
        end
      end
    end
  end
end