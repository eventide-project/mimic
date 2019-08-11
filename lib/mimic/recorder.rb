module Mimic
  module Recorder
    attr_writer :__invocations
    def __invocations
      @__invocations ||= []
    end
    alias :invocations :__invocations
    alias :invocations= :__invocations=

    def __record(invocation)
      __invocations << invocation
    end
    alias :record :__record

    def __invocation(method_name, &blk)
      invocation = __invocations.find { |invocation| invocation.method_name == method_name }

      if blk.nil?
        return invocation
      end

      if invocation.nil?
        return nil
      end

      invocation.parameters.find { |k, v| blk.(k, v)}
    end
    alias :invocation :__invocation

    def __invoked?(method_name)
fail
    end
    alias :invoked? :__invoked?
  end
end
