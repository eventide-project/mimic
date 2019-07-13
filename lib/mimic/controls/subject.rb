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
          def some_method
          end

          def some_other_method
          end

          def self.some_class_method
          end

          def self.some_other_class_method
          end
        end
      end
    end
  end
end
