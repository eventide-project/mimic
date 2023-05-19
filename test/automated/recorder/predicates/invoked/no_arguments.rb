require_relative '../../../automated_init'

context "Recorder" do
  context "Predicates" do
    context "Invoked" do
      context "No Arguments" do
        invocation = Controls::Invocation.example

        context "Recorded" do
          recorder = Controls::Recorder.example

          recorder.record(invocation)

          detected = recorder.invoked?

          test "Detected" do
            assert(detected)
          end
        end

        context "Not Recorded" do
          recorder = Controls::Recorder.example

          detected = recorder.invoked?

          test "Not detected" do
            refute(detected)
          end
        end
      end
    end
  end
end
