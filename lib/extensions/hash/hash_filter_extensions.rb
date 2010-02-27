class Hash
  # return filter
  def filters
    filter_list = self[:filters]  
    if filter_list
      filter_list.filters              
    else
      x = Tracing::Factory.create_filter self
      x
    end        
  end  
    
end