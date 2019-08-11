require_relative '../../automated_init'

context "Recorder" do
  context "Predicate" do
    context "Method Name" do
      invocation = Controls::Invocation.example

      context "Recorded" do
        recorder = Controls::Recorder.example

        recorder.record(invocation)

        detected = recorder.invoked?(invocation.method_name)

        test "Detected" do
          assert(detected)
        end
      end

      context "Not Recorded" do
        recorder = Controls::Recorder.example

        detected = recorder.invoked?(SecureRandom.hex)

        test "Not detected" do
          refute(detected)
        end
      end
    end
  end
end
