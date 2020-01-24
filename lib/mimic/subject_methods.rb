module Mimic
  def self.subject_methods(cls)
    instance_method_names = cls.instance_methods.sort
    instance_method_names -= Mimic.preserved_methods

    instance_methods = instance_method_names.map do |method_name|
      cls.instance_method(method_name)
    end

    instance_methods
  end
end
