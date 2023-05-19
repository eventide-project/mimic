module Mimic
  module Controls
    module Invocation
      def self.example
        parameters = {}
        parameters[:some_parameter] = 1
        parameters[:some_other_parameter] = 11

        invocation = ::Invocation.new(method_name, parameters)

        invocation
      end

      def self.other_example
        parameters = {}
        parameters[:some_parameter] = 111
        parameters[:some_other_parameter] = 1111

        invocation = ::Invocation.new(other_method_name, parameters)

        invocation
      end

      def self.method_name
        :some_method
      end

      def self.other_method_name
        :some_other_method
      end
    end
  end
end
