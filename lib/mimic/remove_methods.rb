module Mimic
  module RemoveMethods
    def self.call(cls)
      instance_methods = cls.instance_methods.sort

      void_methods = instance_methods - Mimic.preserved_methods

      void_methods.each do |m|
        cls.undef_method(m)
      end

      nil
    end
  end
end
