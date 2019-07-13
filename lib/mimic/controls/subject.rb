module Mimic
  module Controls
    module Subject
      module Instance
        def self.example
          Class.example
        end
      end

      module Class
        def self.example
          Example
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
end
