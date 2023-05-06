module Mimic
  module Recorder
    Error = ::Class.new(RuntimeError)

    attr_writer :__records
    def __records
      @__records ||= []
    end
    alias :records :__records
    alias :records= :__records=

    def __record(invocation)
      __records << invocation
    end
    alias :record :__record

    def __invocation(method_name, **parameters)
      invocations = __invocations(method_name, **parameters)

      if invocations.empty?
        return nil
      end

      if invocations.length > 1
        raise Error, "More than one invocation record matches (Method Name: #{method_name.inspect}, Parameters: #{parameters.inspect})"
      end

      return invocations.first
    end
    alias :invocation :__invocation

    def __invocations(method_name=nil, **parameters)
      if method_name.nil? && parameters.empty?
        return __records
      end

      invocations = __records.select { |invocation| invocation.method_name == method_name }

      if parameters.nil?
        return invocations
      end

      if invocations.empty?
        return []
      end

      invocations = invocations.select do |invocation|
        parameters.all? do |match_parameter_name, match_parameter_value|
          invocation_value = invocation.parameters[match_parameter_name]

          invocation_value == match_parameter_value
        end
      end

      invocations
    end
    alias :invocations :__invocations

    def __invoked?(method_name, **parameters)
      invocation = __invocation(method_name, **parameters)
      !invocation.nil?
    end
    alias :invoked? :__invoked?
  end
end
