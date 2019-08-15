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
      cls.class_eval(method_definition(cls, method_name, record))
    end

    def self.method_definition(cls, method_name, record)
      # cls.define_method(method_name) do |*|
      #   if record
      #     invocation = Invocation.build(binding)
      #     __record(invocation)
      #   end

      #   Void.new
      # end

      definition =
        signature(cls, method_name) +
        body(record) +
        'end'

      definition
    end

    def self.signature(cls, method_name)


cls.instance_methods.sort.each do |m|
  puts m
end

pp cls


      mthd = cls.instance_method(method_name)

      parameter_list = parameter_list(mthd.parameters)

      sig = ''
      sig
    end

    def self.parameter_list(parameters)
      parameter_list = ''
      parameters.each do |parameter|
        parameter_list << "#{parameter_signature(*parameter)}, "
      end

      parameter_list[0...-2]
    end

    def self.parameter_signature(type, name)
      case type
      when :req
        return "#{name}, "
      end
    end

    def self.body(record)
      body = "\n"

      if record
        body << <<~RECORD
          invocation = Invocation.build(binding)
          __record(invocation)
        RECORD
      end

      body << "Void.new\n"
      body
    end
  end
end

__END__

target_class.class_eval(initializer_definition)

def initializer_definition
  "
    def initialize(#{parameter_list})
      #{variable_assignment_statements}
    end
  "
end

    def self.___define_method(cls, method_name, record)
      cls.define_method(method_name) do |*|
        if record
          invocation = Invocation.build(binding)
          __record(invocation)
        end

        Void.new
      end
    end
