module Mimic
  module Controls
    module Subject
      def self.example
        Example
      end

      def self.implemented_methods
        Example.instance_methods(false)
      end

      class Example
        def a_method
        end

        def another_method
        end
      end

      class Initialized
        def initialize(a)
        end
      end

      module Anonymous
        def self.example
          ::Class.new(Example)
        end
      end

      class MethodMissing
        def method_missing(*)
        end
      end
    end
  end
end
