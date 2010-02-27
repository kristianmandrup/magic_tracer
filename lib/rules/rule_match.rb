module Tracing
  module RuleMatch
    class RuleTypeError < RuntimeError; end  
  
    def matches_any?(name) 
      self.any? do |rule| 
        if rule.kind_of? Regexp
          match = !(name =~ rule).nil? 
          match
        elsif rule.kind_of? String
          match = (name == rule)
          match
        elsif rule.kind_of? Proc
          rule.call(name)
        elsif rule.kind_of? NameFilter
          rule.allow?(name)
        else
          raise RuleTypeError, "Bad rule type: must be Regexp, String, Proc or NameFilter"
        end
      end
    end
  
    def rules_allow_action(name)
      self.each do |rule|
        res = rule.rule_allow_action(name)
        return :exclude if (res == :exclude)
        return :include if (res == :include)
      end
      # default allow action
      return :yield
    end
  end
end