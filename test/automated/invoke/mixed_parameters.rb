require_relative '../automated_init'

context "Invoke" do
  context "Mixed Parameters" do
    subject_class = Controls::Subject::MixedParameters::Example

    mimic = Mimic.(subject_class)

    blk = proc { nil }

    test "Is not an error" do
      refute_raises do
        mimic.some_method(11, 1111, 11111, some_keyword_parameter: 111, some_optional_keyword_parameter: 1111, yet_another_parameter: 11111, additional_parameter: 111111, &blk)
      end
    end
  end
end
