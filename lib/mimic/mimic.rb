module Mimic
  def self.call(subject_class, &blk)
    cls = Build.(subject_class, &blk)
    cls.new
  end
end
