module Mimic
  Error = Class.new(RuntimeError)

  def self.call(subject_class)
    Class.new(subject_class)
  end
end
