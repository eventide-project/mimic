require_relative '../../automated_init'

context "Recorder" do
  context "Invocation" do
    context "Method Name" do
      invocation = Controls::Invocation.example

      context "Recorded" do
        recorder = Controls::Recorder.example

        recorder.record(invocation)

        detected_invocation = recorder.invocation(invocation.method_name)

        context "Retrieved" do
          assert(detected_invocation == invocation)
        end
      end

      context "Not Recorded" do
        recorder = Controls::Recorder.example

        recorder.record(invocation)

        detected_invocation = recorder.invocation(SecureRandom.hex)

        test "Not Retrieved" do
          assert(detected_invocation.nil?)
        end
      end
    end
  end
end
