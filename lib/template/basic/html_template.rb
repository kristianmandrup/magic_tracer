module Tracing 
  module Template
    class Html < Base
      
      def before_template(context)
        template = <<-EOF
        <div class="method title"><%= context.full_name %></div>
        <div class="method body">
          <div class="begin">
            <div class="name"><%= context.full_name %> :: BEGIN</div>
            <div class="time start"><%= context[:time_start] %></div>
            <div class="arguments">
              <div class="args"><%= context.args %> </div>
              #block#
            </div>
          </div>
      EOF
      end

      def before_block_template 
        template = <<-EOF
      <div class="block-arg">(and a block)</div>
      EOF
      end

      def end_template(context) 
        # method_name = context[:method_full_name]
        # result = context[:result].inspect
        template = <<-EOF
          <div class="end">
            <div class="name"><%= context.full_name %> :: END</div>
            <div class="time end"><%= context[:time_end] %></div>
            <div class="time passed"><%= context[:time_passed] %></div>          
            <div class="result"><%= context.result %></div>
          </div>
        </div>
      EOF
      end

      # override
      def handle_before_call(context)
        template = before_template(context)
        block_replace = context[:block] ? before_block_template : ""
        template.gsub!(/#block#/, block_replace)
        output(template, context)
      end
    end
  end
end