module Tracing
  module Appender
    module Mappings    
      # used to help construct/register Appender instances using convenience symbols
  
      # Convenience Appenders
      # - xmlfile   : xml template, file target
      # - htmlfile  : html template, file target
      # - logfile   : string template, file target
      # - logger    : string template, logger target
      # - socket    : xml template, socket target
      # - events    : string template, eventstack target  
      def self.defaults
        {
          :xmlfile => {:template => :xml, :target => :file},
          :htmlfile => {:template => :html, :target => :file},
          :logfile => {:template => :string, :target => :file},
          :logger => {:template => :string, :target => :logger},
          :socket => {:template => :xml, :target => :socket},
          :eventstack => {:template => :string, :target => :eventstack},
          :default => {:template => :string, :target => :file}
        }
      end
    end
  end
end
