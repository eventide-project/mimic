module Mimic
  module Void
    class Error < RuntimeError; end

    def self.method_missing(method_name, *args)
      raise Error, "Result of mimicked method `#{method_name}' can't be used"
    end
  end
end
