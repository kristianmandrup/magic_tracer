# include this on any class that should have filter functionality available
# for tracing, this is used on TraceExt, ActionHandler, Appender
module Tracing
  module FilterUse
    registratable_set :filters
    include Tracing::Filter::ExecUse        
  end
end
