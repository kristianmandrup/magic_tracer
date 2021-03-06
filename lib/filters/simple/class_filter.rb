module Tracing
  module Filter
    # filter on class name
    class Class < BaseFilter
      def initialize(options)
        super(options)      
        @rules = options[:class_rules] || options[:class_filter] || {}
      end

      def allow_action(msg, context)
        name = context[:class_name]
        # puts "class_name: #{name}, name_allow_action(#{name})"
        allow = name_allow_action(name)
      end
    end
  end
end  