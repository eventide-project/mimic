module Mimic
  module VoidMethods
    def self.call(cls)
      void_methods = void_methods(cls)

      void_methods.each do |m|
        void_method(cls, m)
      end

      nil
    end

    def self.void_methods(cls)
      instance_methods = cls.instance_methods.sort
      instance_methods - Mimic.preserved_methods
    end

    def self.void_method(cls, method_name)
      cls.define_method(method_name) do
        Void.new
      end
    end
  end
end
