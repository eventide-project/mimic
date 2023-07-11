require_relative '../automated_init'

context "Mimic" do
  context "Arity" do
    context "Positional Parameters Received by Mimic" do
      subject_class = Controls::Subject::PositionalParameters::Example

      mimic = Mimic.(subject_class)

      test "Not an error" do
        refute_raises(ArgumentError) do
          mimic.some_method(1, 11)
        end
      end
    end
  end
end
