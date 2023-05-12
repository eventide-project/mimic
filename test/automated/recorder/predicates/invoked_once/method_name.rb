require_relative '../../../automated_init'

context "Recorder" do
  context "Predicate" do
    context "Invoked Once" do
      context "By Method Name" do
        invocation = Controls::Invocation.example

        context "Recorded" do
          context "One" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)

            detected = recorder.invoked_once?(invocation.method_name)

            test "Detected" do
              assert(detected)
            end
          end

          context "Many" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)
            recorder.record(invocation)

            test "Is an error" do
              assert_raises(Recorder::Error) do
                recorder.invoked_once?(invocation.method_name)
              end
            end
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
end
