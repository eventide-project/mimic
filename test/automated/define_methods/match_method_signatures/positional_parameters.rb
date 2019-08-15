require_relative '../../automated_init'

context "Define Methods" do
  context "Match Method Signature" do
    context "Positional Parameters" do
      subject_class = Controls::Subject::PositionalParameters::Example
      subject = subject_class.new

      mimic = Mimic.(subject_class)

mimic.some_method(1,1)

      method_name = :some_method

      context "#{method_name} method" do
        parameters_are_equal = Proofs::Method::Parameters.equal?(
          mimic, subject, method_name
        )

        test "#{method_name} parameters" do
          assert(parameters_are_equal)
        end
      end
    end
  end
end
