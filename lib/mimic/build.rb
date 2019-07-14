module Mimic
  module Build
    def self.call(subject_class, &blk)
      # cls = Class.new(subject_class, &blk)
      cls = Class.build(subject_class, &blk)

      subject_methods = Mimic.subject_methods(cls)

      RemoveMethods.(cls, subject_methods)
      VoidMethods.(cls, subject_methods)

      cls
    end
  end
end
