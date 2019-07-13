module Mimic
  module Controls
    module Subject
      def self.example
        Class.example
      end

      module Class
        def self.example
          Example
        end

        def self.implemented_methods
          Example.instance_methods(false)
        end

        module Anonymous
          def self.example
            ::Class.new(Example)
          end
        end
      end

      class Example
        def a_method
        end

        def another_method
        end
      end
    end
  end
end
