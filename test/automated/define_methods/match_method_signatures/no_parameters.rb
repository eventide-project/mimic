require_relative '../../automated_init'

context "Define Methods" do
  context "Match Method Signature" do
    context "No Parameters" do
      subject_class = Controls::Subject::NoParameters::Example
      subject = subject_class.new

      mimic = Mimic.(subject_class)

      subject_methods = Mimic.subject_methods(subject_class)

      subject_methods.each do |subject_method_name|
        context "#{subject_method_name} method" do
          subject_method = subject.method(subject_method_name)
          mimic_method = mimic.method(subject_method_name)

          subject_parameters = subject_method.parameters
          mimic_parameters = mimic_method.parameters

          test_description = 'parameter'
          if subject_parameters.length > 0
            test_description << 's'
          end

          test "#{subject_method_name} #{test_description}" do
            assert(mimic_parameters == subject_parameters)
          end
        end
      end
    end
  end
end
