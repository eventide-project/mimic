require_relative '../automated_init'

context "Recorder Activation" do
  context "Default" do
    subject_class = Controls::Subject::Anonymous.example

    mimic = Mimic.(subject_class)

    test "Not activated" do
      refute(mimic.is_a?(RecordInvocation))
    end
  end
end
