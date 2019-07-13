module Mimic
  module VoidMethods
    def self.call(cls, subject_methods=nil)
      subject_methods ||= Mimic.subject_methods(cls)

      subject_methods.each do |m|
        void_method(cls, m)
      end

      nil
    end

    def self.void_method(cls, method_name)
      cls.define_method(method_name) do
        Void.new
      end
    end
  end
end
