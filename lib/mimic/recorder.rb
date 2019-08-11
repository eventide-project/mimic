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
      invocations = __invocations(method_name, &blk)

      if invocations.empty?
        return nil
      end

      return invocations.first
    end
    alias :invocation :__invocation

    def __invocations(method_name=nil, &blk)
      if method_name.nil? && blk.nil?
        return __records
      end

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

    def __invoked?(method_name, &blk)
      invocation = __invocation(method_name, &blk)
      !invocation.nil?
    end
    alias :invoked? :__invoked?
  end
end
