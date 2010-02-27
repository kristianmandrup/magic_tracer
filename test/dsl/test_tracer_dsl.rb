require 'include'
 
class TestTracerDSL < Test::Unit::TestCase

  def setup
  end

  def test_config_dsl    
    Tracing::TraceCalls.configuration do |config|
#      p config
      
      # register a custom target which stores files depending on value of instance variable @template_path
      config.action_handlers do |handlers|
        # p handlers
        handlers[0].xml_appender :x => 1 do |appender|
          puts "appender: #{appender}"
          appender.class_filter do |cl_filter|
            p cl_filter
          end
          
          appender.xml_template
        end
          
        p handlers
          
      end

      config.filters do |filters|
        puts filters.inspect
      end

    end    
  end
  
  
end

