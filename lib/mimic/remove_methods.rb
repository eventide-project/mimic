module Mimic
  module RemoveMethods
    def self.call(cls)
      void_methods = Mimic.subject_methods(cls)

      void_methods.each do |m|
        cls.undef_method(m)
      end

      nil
    end
  end
end
