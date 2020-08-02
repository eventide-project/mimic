require_relative 'automated_init'

context "Initialized" do
  context "Subject Has an Initializer" do
    subject_class = Controls::Subject::Initialized

    detail "Object Is Allocated Rather than Initialized"

    test "Is not an error" do
      refute_raises(ArgumentError) do
        mimic = Mimic.(subject_class)
      end
    end
  end
end
