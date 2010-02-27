# FILTERS

it "empty filters" do                          
  let :filters = { config.action_handlers }

  it "can be configured with filter 'my_arg_filter' " do
    _filter = filters.add :my_arg_filter
    _filter.should == Tracing::Filter::Argument
    _filter.name.should == 'my_arg_filter'

    filters.add :argument, :my_arg_filter do |filter|
      _filter.should == Tracing::Filter::Argument
      _filter.name.should == 'my_arg_filter'
    end
  end      
end
