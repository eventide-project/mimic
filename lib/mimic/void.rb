module Mimic
  class Void
    class Error < RuntimeError; end

    def method_missing(method_name, *args)
      raise Error, "Cannot invoke `#{method_name}' on a void"
    end
  end
end
