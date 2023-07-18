module Mimic
  module Controls
    module Subject
      module MixedParameters
        class Example
          def some_method(
            some_parameter,
            some_optional_parameter=nil,
            *some_multiple_assignment_parameter,
            some_keyword_parameter:,
            some_optional_keyword_parameter: nil,
            **some_multiple_assignment_keyword_parameter,
            &some_block)
          end
        end
      end
    end
  end
end
