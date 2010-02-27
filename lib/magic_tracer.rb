require 'rubygems'
require 'duration'
require 'active_support'
require 'active_support/inflector'
require 'set'
require 'require-magic'
Require.base_path = File.dirname(__FILE__)
require 'trace_calls/named'

Require.rfolder 'rules'
require 'extensions/include'

Require.rfolder 'meta'
require 'trace_calls/tracing_factory'
require 'trace_calls/trace_configuration'
require 'filters/include'
 
Require.folder 'content_wrapper'
require 'appenders/include'
Require.rfolder('action_handler')
Require.rfolder('targets')
Require.rfolder('template')
Require.folder('trace_calls')
