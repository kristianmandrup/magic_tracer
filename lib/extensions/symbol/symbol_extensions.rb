class Symbol
  def prefix(pre)
    (pre.to_s + '_' + self.to_s).to_sym
  end
    
  def appender
    mappings = Tracing::Configuration.appender_mappings
    if mappings
      appender_hash = mappings[self]
      return appender_hash.appender if appender_hash
    end    
    raise Exception, "#{self} is not a valid appender symbol registered with Tracing::Configuration"
  end
  
end
