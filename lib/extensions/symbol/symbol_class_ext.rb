class Symbol
  def rule
    mapper = Tracing::Rule::Mappings.prefix_map
    mapper.get_from_map(self)  
  end  
  
  def filter_class
    mapper = Tracing::Filter::Mappings.defaults
    mapper.get_from_map(self)
  end
  
  def template_class
    mapper = Tracing::Template::Mappings.defaults
    mapper.get_from_map(self)
  end
  
  def appender_class
    mapper = Tracing::Appender::Mappings.defaults
    mapper.get_from_map(self)  
  end
  
  def target_class
    mapper = Tracing::Target::Mappings.defaults
    mapper.get_from_map(self)  
  end
end  