require_relative '../../../automated_init'

context "Recorder" do
  context "Queries" do
    context "Invocation" do
      context "Multiple Detected" do
        invocation = Controls::Invocation.example

        context "Strict" do
          context "By Method Name" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)
            recorder.record(invocation)

            test "Is an error" do
              assert_raises(Recorder::Error) do
                recorder.invocation(invocation.method_name, strict: true)
              end
            end
          end

          context "By Parameters" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)
            recorder.record(invocation)

            test "Is an error" do
              assert_raises(Recorder::Error) do
                recorder.invocation(invocation.method_name, some_parameter: 1, strict: true)
              end
            end
          end
        end
      end
    end
  end
end
