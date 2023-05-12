require_relative '../../../automated_init'

context "Recorder" do
  context "Query" do
    context "Many Invocations" do
      context "By Method Name" do
        invocation = Controls::Invocation.example

        context "Recorded" do
          recorder = Controls::Recorder.example

          recorder.record(invocation)
          recorder.record(invocation)

          detected_invocations = recorder.invocations(invocation.method_name)

          context "Retrieved" do
            test "First" do
              assert(detected_invocations[0] == invocation)
            end

            test "Second" do
              assert(detected_invocations[1] == invocation)
            end
          end
        end

        context "Not Recorded" do
          recorder = Controls::Recorder.example

          recorder.record(invocation)
          recorder.record(invocation)

          detected_invocations = recorder.invocations(SecureRandom.hex)

          test "Not retrieved" do
            assert(detected_invocations.empty?)
          end
        end
      end
    end
  end
end
