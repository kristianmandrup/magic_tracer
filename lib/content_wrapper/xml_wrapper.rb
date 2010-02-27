module Tracing
  module Wrapper
    module Xml
      def content_wrap_top
        %q{<?xml version="1.0" encoding="UTF-8"?>
          <tracing>
        }
      end

      def content_wrap_bottom
        "</tracing>"
      end
    end
  end
end