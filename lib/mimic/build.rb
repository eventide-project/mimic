module Mimic
  module Build
    def self.call(subject_class, record: nil, &blk)
      record ||= false

      cls = Class.build(subject_class)

      subject_methods = Mimic.subject_methods(cls)

      RemoveMethods.(cls, subject_methods)

## TODO goes in Class.build
## It's about the class def
      if record
        cls.class_exec do
          include RecordInvocation
        end
      end

      DefineMethods.(cls, subject_methods, record: record)

      if not blk.nil?
        cls.class_exec(&blk)
      end

      cls
    end
  end
end
