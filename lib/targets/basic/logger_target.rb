module Tracing
  module Target
    class Logger
      attr_reader :logger

      def stream(options)
        if options
          case options[:stream]
            when :error
              STDERR      
            else
              STDOUT
          end
        else
          STDOUT
        end
      end

      def log_lv(options)
        if options
          case options[:log_level]
            when :info
              Logger::INFO      
            when :warning
              Logger::WARNING      
            when :fatal
              Logger::FATAL      
            else
              Logger::DEBUG
          end
        else
          Logger::DEBUG
        end
      end    
    end
  end
end

