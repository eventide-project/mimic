module Mimic
  module RemoveMethods
    def self.call(cls, subject_methods=nil)
      subject_methods ||= Mimic.subject_methods(cls)

      subject_methods.each do |m|
        cls.undef_method(m.name)
      end

      nil
    end
  end
end
