class Hash
  include Tracing::RuleMatch
  
  def rules_allow_action(name)
    rule_allow_action(name)
  end  
    
  def rule_list
    rules
  end 
    
  # return a symbol, either - :include, :exclude or :exclude_and_yield, :include_and_yield or :yield (let next filter decide)  
  def rule_allow_action(name)
    include_rules = self[:include].rule_list
        
    if !include_rules.blank?
      res = include_rules.matches_any?(name)
      return :include if res
    end
    exclude_rules = self[:exclude].rule_list
    if !exclude_rules.blank?
      return :exclude if exclude_rules.matches_any?(name)
    end

    rules = self[:exclude_and_yield].rule_list
    if !rules.blank?
      return :exclude_and_yield if rules.matches_any?(name)
    end

    rules = self[:include_and_yield].rule_list
    if !rules.blank?
      return :include_and_yield if rules.matches_any?(name)
    end

    if !self[:default].nil?
      return self[:default]      
    end
    return :yield
  rescue RuleTypeError
    return :exclude    
  end  
end