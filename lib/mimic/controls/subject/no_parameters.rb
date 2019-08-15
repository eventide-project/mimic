module Mimic
  module Controls
    module Subject
      module NoParameters
        def self.example
          Example.new
        end

        class Example
          def some_method
          end
        end
      end
    end
  end
end
