require_relative '../../automated_init'

context "Recorder" do
  context "Activation" do
    context "Not Activated" do
      subject_class = Controls::Subject::Anonymous.example

      mimic = Mimic.(subject_class, record: false)

      test "Mimic is not a recorder" do
        refute(mimic.is_a? Recorder)
      end
    end
  end
end
