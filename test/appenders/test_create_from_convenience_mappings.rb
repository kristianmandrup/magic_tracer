require "include"


class TestCreateAppender < Test::Unit::TestCase

  def setup
    @xmlfile  = :xmlfile # => {:template => :xml, :target => :file},
    @htmlfile = :htmlfile # => {:template => :html, :target => :file},
    @logfile  = :logfile # => {:template => :string, :target => :file}
    @logger   = :logger # => {:template => :string, :target => :logger}
    @socket   = :socket # => {:template => :xml, :target => :socket}
    @eventstack   = :eventstack # => {:template => :string, :target => :eventstack}
    @default  = :default # => {:template => :string, :target => :file}
  end    

  def test_create_xmlfile_appender
    appender = @xmlfile.appender
    assert Tracing::Template::Xml appender.template, "Should create appender with Xml Template"    
    assert Tracing::Target::File appender.target, "Should create appender with File Target"    
  end

  def test_create_htmlfile_appender
    appender = @htmlfile.appender
    assert Tracing::Template::Html appender.template, "Should create appender with Html Template"    
    assert Tracing::Target::File appender.target, "Should create appender with File Target"    
  end

  def test_create_logfile_appender
    appender = @logfile.appender
    assert Tracing::Template::String appender.template, "Should create appender with String Template"    
    assert Tracing::Target::File appender.target, "Should create appender with File Target"    
  end

  def test_create_logger_appender
    appender = @logger.appender
    assert Tracing::Template::String appender.template, "Should create appender with String Template"    
    assert Tracing::Target::Logger appender.target, "Should create appender with Logger Target"    
  end

  def test_create_socket_appender
    appender = @socket.appender
    assert Tracing::Template::Xml appender.template, "Should create appender with Xml Template"    
    assert Tracing::Target::Socket appender.target, "Should create appender with Socket Target"    
  end

  def test_create_eventstack_appender
    appender = @eventstack.appender
    assert Tracing::Template::Xml appender.template, "Should create appender with Xml Template"    
    assert Tracing::Target::EventStack appender.target, "Should create appender with EventStack Target"    
  end

  def test_create_default_appender
    appender = @default.appender
    assert Tracing::Template::String appender.template, "Should create appender with String Template"    
    assert Tracing::Target::File appender.target, "Should create appender with File Target"    
  end

end

