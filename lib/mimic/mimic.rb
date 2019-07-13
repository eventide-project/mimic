module Mimic
  def self.call(subject_class)
    cls = Build.(subject_class)
    cls.new
  end
end
