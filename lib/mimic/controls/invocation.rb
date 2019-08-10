module Mimic
  module Controls
    module Invocation
      def self.example
        method_name = :some_method

        parameters = {}
        parameters[:some_parameter] = 1
        parameters[:some_other_parameter] = 11

        invocation = ::Invocation.new(method_name, parameters)

        invocation
      end
    end
  end
end
