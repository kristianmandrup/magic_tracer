require 'include'
 
class TestTracerDSL < Test::Unit::TestCase

  def setup
  end

  def test_kernel_factory_dsls    
    xml_template do |t|
      p t
    end
  end
  
  
end

