module Mimic
  module Build
    def self.call(subject_class)
      cls = Class.new(subject_class)

      InstanceMethods.replace(cls)

      cls
    end
  end
end
