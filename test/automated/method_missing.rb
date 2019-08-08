require_relative 'automated_init'

context "Method Missing" do
  context "Mimic Implements Method Missing" do
    subject_class = Controls::Subject::MethodMissing
    mimic = Mimic.(subject_class)

    test "Method missing is preserved" do
      assert(mimic.respond_to?(:method_missing))
    end
  end

  context "Mimic Doesn't Implement Method Missing" do
    subject_class = Controls::Subject.example
    mimic = Mimic.(subject_class)

    test "Method missing is not implemented" do
      refute(mimic.respond_to?(:method_missing))
    end
  end
end
