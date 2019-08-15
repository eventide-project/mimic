module Mimic
  module DefineMethods
    def self.call(cls, subject_methods=nil, record: nil)
      subject_methods ||= Mimic.subject_methods(cls)

      subject_methods.each do |m|
        define_method(cls, m, record)
      end

      nil
    end

    def self.define_method(cls, method_name, record)
      cls.define_method(method_name) do |*|
        if record
          invocation = Invocation.build(binding)
          __record(invocation)
        end

        Void.new
      end
    end
  end
end
