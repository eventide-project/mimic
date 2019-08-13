require_relative '../../automated_init'

context "Recorder" do
  context "Activation" do
    context "Activated" do
      subject_class = Controls::Subject::Anonymous.example

      mimic = Mimic.(subject_class, record: true)

      test "Mimic is a recorder" do
        assert(mimic.is_a? Recorder)
      end
    end
  end
end
