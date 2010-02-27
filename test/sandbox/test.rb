require 'rubygems'
require 'transaction/simple'


class Me
  
  def initialize(c) 
    @contents = c
  end
  
  def hello
    Transaction::Simple.start(self) do |t|          
      puts @contents
      contents = ""
    end
  end
end

me = Me.new "abc"
me.hello
