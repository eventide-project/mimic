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
  end
end
