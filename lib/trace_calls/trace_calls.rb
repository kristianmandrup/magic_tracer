module Tracing
  module TraceCalls
    
    def self.included(klass)
      suppress_tracing do
        klass.instance_methods(false).each do |existing_method|
          wrap(klass, existing_method)
        end
      end
      def klass.method_added(method)  # note: nested definition
        unless @trace_calls_internal
          @trace_calls_internal = true
          TraceCalls.wrap(self, method)
          @trace_calls_internal = false
        end
      end
    end
    
    def self.suppress_tracing
      Thread.current[:'suppress tracing'] = true
      yield
    ensure
      Thread.current[:'suppress tracing'] = false
    end

    def self.ok_to_trace?(name)
      !Thread.current[:'suppress tracing']
    end      

    def self.time_now
      time = Time.now      
    end
    
    def self.wrap(klass, method) 
      klass.class_eval do
        name = method.to_s
        original_method = instance_method(name)

        define_method(name) do |*args, &block|        
          cls_name = self.class.to_s          
          context = {                  
                     :method_name => name, 
                     :args => args, 
                     :block => block_given?,
                     :self => self,
                     :time_start => time_now }.context

          if TraceCalls.ok_to_trace?(name)
            TraceCalls.suppress_tracing do
              if trace_method?(context) 
                # puts "tracing before:" + context[:method_full_name]
                handle_before_call(context)
              end
            end
          end
          result = original_method.bind(self).call(*args, &block)
          if TraceCalls.ok_to_trace?(name)
            TraceCalls.suppress_tracing do          
              if trace_method?(context)  
                # puts "tracing after:" + context[:method_full_name]                
                context[:result] = result
                context[:time_end] = time_now
                context[:time_passed] = context[:time_end] - context[:time_start]
                handle_after_call(context)   
              end
            end
          end
          result
        end
      end
    end
  
    class << self
      attr_accessor :configurations, :active_configuration

      def configuration(options = nil, &block)
        configure Tracing::Configuration.new options
        yield active_configuration
      end

      def configure(configuration)
        name = configuration.name || :default
        @configurations ||= {}
        @active_configuration = @configurations[name] ||= configuration if configuration.kind_of? Tracing::Configuration
      end

      def set_configuration(key)
        @configurations ||= {}        
        @active_configuration = @configurations[key] if @configurations[key]
      end        

    end
  
  
    suppress_tracing do
      include Tracing::TraceExt
    end  
  end
end