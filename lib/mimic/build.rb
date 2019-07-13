module Mimic
  module Build
    def self.call(subject_class)
      cls = Class.new(subject_class)

      RemoveMethods.(cls)

      cls
    end
  end
end
