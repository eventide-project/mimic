require_relative '../../../automated_init'

context "Recorder" do
  context "Queries" do
    context "By Method Name" do
      context "One Invocation" do
        invocation = Controls::Invocation.example

        context "Recorded" do
          context "One" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)

            detected_invocation = recorder.one_invocation(invocation.method_name)

            test "Detected" do
              assert(detected_invocation == invocation)
            end
          end

          context "Many" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)
            recorder.record(invocation)

            test "Is an error" do
              assert_raises(Recorder::Error) do
                recorder.one_invocation(invocation.method_name)
              end
            end
          end
        end

        context "Not Recorded" do
          recorder = Controls::Recorder.example

          detected_invocation = recorder.one_invocation(SecureRandom.hex)

          test "Not retrieved" do
            assert(detected_invocation.nil?)
          end
        end
      end
    end
  end
end
