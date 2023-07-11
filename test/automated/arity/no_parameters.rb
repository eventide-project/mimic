require_relative '../automated_init'

context "Mimic" do
  context "Arity" do
    context "No Parameters Received by Mimic" do
      subject_class = Controls::Subject::NoParameters::Example

      mimic = Mimic.(subject_class)

      test "Not an error" do
        refute_raises(ArgumentError) do
          mimic.some_method
        end
      end
    end
  end
end
