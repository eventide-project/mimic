module Mimic
  Error = Class.new(RuntimeError)

  def self.call(subject_class)
    cls = Class.new(subject_class)

    InstanceMethods.replace(cls)

    cls
  end
end
