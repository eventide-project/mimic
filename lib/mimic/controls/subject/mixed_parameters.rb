module Mimic
  module Controls
    module Subject
      module MixedParameters
        class Example
          def some_method(some_parameter, *parameters, some_other_parameter:, **named_parameters, &blk)
          end
        end
      end
    end
  end
end
