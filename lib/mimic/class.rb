module Mimic
  module Class
    def self.build(subject_class, &blk)
      define_class(subject_class, &blk)
    end

    def self.define_class(subject_class, &blk)
      mimic_class = ::Class.new(subject_class, &blk)
      set_constant(mimic_class, subject_class)
      mimic_class
    end

    def self.set_constant(mimic_class, subject_class)
      class_id = mimic_class.object_id
      class_name = class_name(subject_class, class_id)

      unless self.const_defined?(class_name, false)
        self.const_set(class_name, mimic_class)
      end

      class_name
    end

    def self.class_name(cls, class_id)
      if cls.name.nil?
        return "C#{class_id}"
      else
        return "#{cls.name.gsub('::', '_')}_#{class_id}"
      end
    end
  end
end
