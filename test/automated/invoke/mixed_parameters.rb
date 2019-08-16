require_relative '../automated_init'

context "Invoke" do
  context "Mixed Parameters" do
    subject_class = Controls::Subject::MixedParameters::Example

    mimic = Mimic.(subject_class)

    blk = proc { nil }
    action = proc { mimic.some_method(11, 1111, 11111, some_other_parameter: 111, yet_another_parameter: 1111, additional_parameter: 11111, &blk) }

    test "Is not an error" do
      refute action do
        raises_error?
      end
    end
  end
end
