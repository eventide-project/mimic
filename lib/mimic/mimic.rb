module Mimic
  def self.call(subject_class, record: nil, &blk)
    cls = Build.(subject_class, record: record, &blk)
    cls.allocate
  end
end
