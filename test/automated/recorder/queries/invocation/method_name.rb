require_relative '../../../automated_init'

context "Recorder" do
  context "Queries" do
    context "Invocation" do
      context "By Method Name" do
        invocation = Controls::Invocation.example

        context "Recorded One" do
          context "Matched Method Name" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)

            retrieved_invocation = recorder.invocation(invocation.method_name)

            context "Retrieved" do
              assert(retrieved_invocation == invocation)
            end
          end

          context "Mismatched Method Name" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)

            retrieved_invocation = recorder.invocation(SecureRandom.hex)

            context "Not retrieved" do
              assert(retrieved_invocation.nil?)
            end
          end
        end

        context "Recorded Multiple" do
          other_invocation = Controls::Invocation.example

          context "Matched Method Name" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)
            recorder.record(other_invocation)

            retrieved_invocation = recorder.invocation(invocation.method_name)

            context "Retrieved First" do
              assert(retrieved_invocation == invocation)
            end
          end
        end

        context "Not Recorded" do
          recorder = Controls::Recorder.example

          retrieved_invocation = recorder.invocation(SecureRandom.hex)

          test "Not retrieved" do
            assert(retrieved_invocation.nil?)
          end
        end
      end
    end
  end
end
