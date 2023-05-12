require_relative '../../../automated_init'

context "Recorder" do
  context "Queries" do
    context "Invocation" do
      context "Strict" do
        context "Not Strict" do
          context "By Method Name" do
            invocation = Controls::Invocation.example

            recorder = Controls::Recorder.example

            recorder.record(invocation)
            recorder.record(invocation)

            test "Is not an error" do
              refute_raises(Recorder::Error) do
                recorder.invocation(invocation.method_name, strict: false)
              end
            end
          end

          context "By Parameters" do
            first_invocation = Controls::Invocation.example
            second_invocation = Controls::Invocation.example

            recorder = Controls::Recorder.example

            recorder.record(first_invocation)
            recorder.record(second_invocation)

            strict = false

            test "Is not an error" do
              refute_raises(Recorder::Error) do
                recorder.invocation(first_invocation.method_name, some_parameter: 1, strict: false)
              end
            end

            context do
              detected_invocation = recorder.invocation(first_invocation.method_name, some_parameter: 1, strict: false)

              test "Retrieves the first invocation" do
                assert(detected_invocation == first_invocation)
              end
            end
          end
        end

        context "Strict" do
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
end
