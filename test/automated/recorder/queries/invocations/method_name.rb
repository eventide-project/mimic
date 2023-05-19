require_relative '../../../automated_init'

context "Recorder" do
  context "Queries" do
    context "Invocations" do
      context "By Method Name" do
        invocation = Controls::Invocation.example

        context "Recorded Multiple" do
          context "Matched Method Name" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)
            recorder.record(invocation)

            retrieved_invocations = recorder.invocations(invocation.method_name)

            context "Retrieved" do
              assert(retrieved_invocations.length == 2)

              test "First" do
                assert(retrieved_invocations[0] == invocation)
              end

              test "Second" do
                assert(retrieved_invocations[1] == invocation)
              end
            end
          end

          context "Mismatched Method Name" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)
            recorder.record(invocation)

            retrieved_invocations = recorder.invocations(SecureRandom.hex)

            test "Not retrieved" do
              assert(retrieved_invocations.empty?)
            end
          end
        end

        context "Not Recorded" do
          recorder = Controls::Recorder.example

          retrieved_invocations = recorder.invocations(invocation.method_name)

          test "Not retrieved" do
            assert(retrieved_invocations.empty?)
          end
        end
      end
    end
  end
end
