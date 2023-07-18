require_relative '../automated_init'

context "Invoke" do
  context "Mixed Parameters" do
    subject_class = Controls::Subject::MixedParameters::Example

    mimic = Mimic.(subject_class)

    blk = proc { nil }

    test "Not an error" do
      refute_raises do
        mimic.some_method(
          :some_arg,
          :some_optional_arg,
          :some_multiple_assignment_arg,
          :some_other_multiple_assignment_arg,
          some_keyword_parameter: :some_keyword_arg,
          some_optional_keyword_parameter: :some_optional_keyword_arg,
          some_multiple_assignment_keyword_parameter: :some_multiple_assignment_keyword_arg,
          some_other_multiple_assignment_keyword_parameter: :some_other_multiple_assignment_keyword_arg,
          &blk
        )
      end
    end
  end
end
