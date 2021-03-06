module Tracing 
  module Template
    class Xml < Base
      def before_template(context)
        template = <<-EOF
      <method name="<%= context.full_name %>">
        <time point="start"><%= context[:time_start] %></time>    
        <modules><%= context.full_name %></modules>
        <class><%= context.cls_name %></class>
        <args><%= context.args %></args>
        #block#
      EOF
      end

      def before_block_template 
        template = <<-EOF
      <block-arg>true</block-arg>
      EOF
      end

      def end_template(context) 
        result = context[:result]
        template = <<-EOF
        <time point="end"><%= context[:time_end] %></time>          
        <time point="passed"><%= context[:time_passed] %></time>    
        <result><%= context.result %></result>
      </method>
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