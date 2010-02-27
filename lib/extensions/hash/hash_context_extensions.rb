def Hash
  def context
    modules = self[:modules]
    cls_name = self[:class_name]
    method_name = self[:method_name]
    self[:modules] = cls_name.modules if cls_name && !modules
    self[:class_name] = cls_name.class_name if cls_name
    calculate_full_names
    self
  end

  def method_name=(name)
    self[:method_name] = name
    calculate_full_method_name
  end

  def result=(res)
    self[:result] = res
  end

  def set_context(hash)
    obj = self[:self]
    modules = hash[:modules]
    obj_class = obj.class.to_s.class_name if obj
    cls_name = hash[:class_name] || obj_class    
  
    method_name = hash[:method_name]
    args = hash[:args]
    vars = hash[:vars]
    self[:modules] = cls_name.modules if cls_name

    self[:modules] = modules if modules

    self[:class_name] = cls_name.class_name if cls_name
    self[:method_name] = method_name if method_name

    calculate_full_names  
  end

  def full_name
    context[:full_method_name]
  end

  def cls_name
    context[:class_name]
  end

  def args
    context[:args].inspect if context[:args]      
  end

  def result
    context[:result].inspect if context[:res]      
  end


  def full_modules_name
    self[:modules].join("::") if self[:modules]
  end

  def full_class_name
    mod_name = self.full_modules_name
    name = self[:class_name]
    name = "#{mod_name}::#{name}" if !mod_name.blank?
  end

  def full_method_name
    cls_name = self.full_class_name
    name = self[:method_name]
    name = "#{cls_name}.#{name}" if !cls_name.blank?
  end
  
protected  

  def calculate_full_names
    fmm = full_modules_name
    fcm = full_class_name
    self[:full_modules_name] = fmm if fmm
    self[:full_class_name] = fcm if fcm
    calculate_full_method_name    
  end

  def calculate_full_method_name
    fmn = full_method_name
    self[:full_method_name] = fmn if fmn
  end
  
end