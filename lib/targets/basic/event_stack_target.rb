module Tracing
  
  class TraceEvent
    attr_accessor :context, :store_text
    def initialize(options)
      @store_text = options
    end    
    
    def <<(event)
      ev = store_text? ? event : event[:ctx]
      @context = ev
    end
  end
  
  class EventStackTarget
    include Enumerable
    attr_accessor :stack, :stack_text
          
    def initialize(stack_text = false)
      @stack = []
      @stack_text = stack_text?
    end
    
    def each
      @stack.each do |s|
        yield s
      end
    end
    
    def append(txt, context)    
      event = TraceEvent.new stack_text? if context[:result].nil?
      event << {:txt => txt, :ctx => context}
      @stack << event    
    end
  end
end