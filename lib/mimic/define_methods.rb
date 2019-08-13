module Mimic
  module DefineMethods
    def self.call(cls, subject_methods=nil)
      subject_methods ||= Mimic.subject_methods(cls)

      subject_methods.each do |m|
        define_method(cls, m)
      end

      nil
    end

    def self.define_method(cls, method_name)
      cls.define_method(method_name) do
        Void.new
      end
    end
  end
end
