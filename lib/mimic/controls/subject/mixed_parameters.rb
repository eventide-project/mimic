module Mimic
  module Controls
    module Subject
      module MixedParameters
        class Example
          def some_method(some_parameter, some_optional_parameter=nil, *parameters, some_keyword_parameter:, some_optional_keyword_parameter: nil, **named_parameters, &blk)
          end
        end
      end
    end
  end
end
