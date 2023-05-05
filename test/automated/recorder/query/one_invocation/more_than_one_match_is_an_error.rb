require_relative '../../../automated_init'

context "Recorder" do
  context "Query" do
    context "One Invocation" do
      context "More Than One Match" do
        context "By Method Name" do
          invocation = Controls::Invocation.example

          recorder = Controls::Recorder.example

          recorder.record(invocation)
          recorder.record(invocation)

          test "Is an error" do
            assert_raises(Recorder::Error) do
              recorder.invocation(invocation.method_name)
            end
          end
        end

        context "By Parameters" do
          invocation = Controls::Invocation.example

          recorder = Controls::Recorder.example

          recorder.record(invocation)
          recorder.record(invocation)

          test "Is an error" do
            assert_raises(Recorder::Error) do
              recorder.invocation(invocation.method_name, some_parameter: 1)
            end
          end
        end
      end
    end
  end
end
