context "empty action_handlers" do                   
  let :ac_handlers = { config.action_handlers }
  
  it "can be configured with action_handler 'my_handler' " do
    handler = ac_handlers.add :my_handler
    handler.should == Tracing::ActionHandler
    handler.name.should == 'my_handler'

    handlers.add :my_handler do |handler|
      handler.should == Tracing::ActionHandler
      handler.name.should == 'my_handler'
    end
  end      
  
  context "existing handler"
  let :handler = { config.add }      
  it "should let handler be configured with xml appender 'my_xml_appender' " do      
    handler.appender.add :xml, :my_xml_appender do |appender|
      appender.should == Tracing::Appenders::XmlAppender
      appender.name.should == 'my_xml_appender'          
    end
  end

  it "should let handler be configured with html appender 'my_html_appender' " do      
    handler.appender.add :xml, :my_html_appender do |appender|
      appender.should == Tracing::Appenders::XmlAppender
      appender.name.should == 'my_html_appender'          
    end
  end
end