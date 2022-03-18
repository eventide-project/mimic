module Mimic
  module Predicates
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

        def self.types_equal?(compare, control, method_name)
          control_method = control.method(method_name)

          control_parameters = control_method.parameters
          control_parameter_types = control_parameters.map(&:first)

          compare_method = compare.method(method_name)

          compare_parameters = compare_method.parameters
          compare_parameter_types = compare_parameters.map(&:first)

          if ENV['VERBOSE'] == 'on'
            puts "Control: #{control.class}"
            pp control_parameter_types

            puts

            puts "Compare: #{compare.class}"
            pp compare_parameter_types
          end

          compare_parameter_types == control_parameter_types
        end
      end
    end
  end
end
