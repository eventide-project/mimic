module Mimic
  module DefineMethods
    Error = ::Class.new(RuntimeError)

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
        #{record ? "record " : "" }#{signature(mthd)}
          Void.new
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
      type = parameter[0]
      name = parameter.fetch(1) { :args }

      case type
      when :opt
        return "#{name}=nil"
      when :req
        return "#{name}"
      when :key
        return "#{name}: nil"
      when :keyreq
        return "#{name}:"
      when :rest
        if name == :*
          return "*"
        else
          return "*#{name}"
        end
      when :keyrest
        if name == :**
          return "**"
        else
          return "**#{name}"
        end
      when :block
        if name == :&
          return "&"
        else
          return "&#{name}"
        end
      else
        raise Error, "Unknown parameter type (Name: #{name.inspect}, Type: #{type.inspect})"
      end
    end

##
    # def self.body(record)
    #   body = ''
    #   if record
    #     body << <<~RECORD
    #       invocation = Invocation.build(binding)
    #       __record(invocation)
    #     RECORD
    #   end

    #   body << "Void.new"

    #   body
    # end
  end
end

