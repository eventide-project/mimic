module Mimic
  def self.subject_methods(cls)
    instance_methods = cls.instance_methods.sort
    instance_methods - Mimic.preserved_methods
  end
end
