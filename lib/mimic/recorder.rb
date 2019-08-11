module Mimic
  module Recorder
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

    def __invocation(method_name, &blk)
      invocation = __records.find { |invocation| invocation.method_name == method_name }

      if blk.nil?
        return invocation
      end

      if invocation.nil?
        return nil
      end

      invocation.parameters.find { |k, v| blk.(k, v)}

      ## FAIL if more than one
    end
    alias :invocation :__invocation

    def __invocations(method_name, &blk)
      invocations = __records.select { |invocation| invocation.method_name == method_name }

      if blk.nil?
        return invocations
      end

      if invocations.empty?
        return []
      end

      invocations.select do |invocation|
        invocation.parameters.find { |k, v| blk.(k, v)}
      end
    end
    alias :invocations :__invocations

    def __invoked?(method_name)
fail
    end
    alias :invoked? :__invoked?
  end
end
