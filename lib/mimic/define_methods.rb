module Mimic
  module DefineMethods
    def self.call(cls, subject_methods=nil, record: nil)
      subject_methods ||= Mimic.subject_methods(cls)

      subject_methods.each do |mthd|
        define_method(cls, mthd, record)
      end

      nil
    end

    def self.define_method(cls, mthd, record)
      method_definition = method_definition(mthd, record)
      cls.class_eval(method_definition)
    end

    def self.method_definition(mthd, record)
      "
        #{signature(mthd)}
          #{body(record)}
        end
      "
    end

    def self.signature(mthd)
      parameter_list = parameter_list(mthd.parameters)

      "def #{mthd.name}(#{parameter_list})"
    end

    def self.parameter_list(parameters)
      parameter_list = ''
      parameters.each do |parameter|
        parameter_signature = parameter_signature(parameter)
        parameter_list << "#{parameter_signature}, "
      end

      parameter_list[0...-2]
    end

    def self.parameter_signature(parameter)
pp parameter
      type = parameter[0]
      name = parameter.fetch(1) { :* }

      case type
      when :req
        return "#{name}"
      else
        raise '*** unknown param sig'
      end
    end

    def self.body(record)
      body = ''
      if record
        body << <<~RECORD
          invocation = Invocation.build(binding)
          __record(invocation)
        RECORD
      end

      body << "Void.new"

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
