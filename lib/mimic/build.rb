module Mimic
  module Build
    def self.call(subject_class, record: nil, &blk)
      record ||= false

      cls = Class.build(subject_class, &blk)

      subject_methods = Mimic.subject_methods(cls)

      RemoveMethods.(cls, subject_methods)

      if record
        cls.class_exec do
          include Recorder
        end
      end

      DefineMethods.(cls, subject_methods)

      cls
    end
  end
end
