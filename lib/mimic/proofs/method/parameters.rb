module Mimic
  module Proofs
    module Method
      module Parameters
        def self.equal?(compare, control, method_name)
          control_method = control.method(method_name)
          control_parameters = control_method.parameters

          compare_method = compare.method(method_name)
          compare_parameters = compare_method.parameters

          if ENV['VERBOSE'] == 'on'
            puts "Control: #{control.class}"
            pp control_parameters

            puts

            puts "Compare: #{compare.class}"
            pp compare_parameters
          end

          compare_parameters == control_parameters
        end
      end
    end
  end
end
