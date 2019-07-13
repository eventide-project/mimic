module Mimic
  module Build
    def self.call(subject_class)
      cls = Class.new(subject_class)

      subject_methods = Mimic.subject_methods(cls)

      RemoveMethods.(cls)
      VoidMethods.(cls, subject_methods)

      cls
    end
  end
end
