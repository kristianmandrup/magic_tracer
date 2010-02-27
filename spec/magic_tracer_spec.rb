require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "MagicTracer setup" do
  context "no config" do
    it "can be configured" do
      Tracing::TraceCalls.configuration do |config|
        config.should == Tracing::Configuration
      end
    end

    it "can be configured with a name" do
      Tracing::TraceCalls.configuration :hello do |config|
        config.name.should == 'hello'     
      end
    end
  end

  context "initial config" do  
    let :config = { Tracing::TraceCalls.configuration }
    it "can be configured with empty filters" do
      config.filters do |filters|
        filters.should == []
      end      
    end
  end  
end
