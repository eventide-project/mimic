require_relative '../../../automated_init'

context "Recorder" do
  context "Query" do
    context "Many Invocations" do
      context "No Arguments" do
        invocation = Controls::Invocation.example

        context "Recorded" do
          recorder = Controls::Recorder.example

          recorder.record(invocation)
          recorder.record(invocation)

          detected_invocations = recorder.invocations

          detail "Detected invocations: #{detected_invocations.inspect }}"

          context "Retrieved" do
            test "All invocations" do
              assert(detected_invocations == [invocation, invocation])
            end
          end
        end

        context "Not Recorded" do
          recorder = Controls::Recorder.example

          detected_invocations = recorder.invocations

          detail "Detected invocations: #{detected_invocations.inspect }}"

          test "Not retrieved" do
            assert(detected_invocations.empty?)
          end
        end
      end
    end
  end
end
