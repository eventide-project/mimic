require_relative '../../../automated_init'

context "Recorder" do
  context "Predicates" do
    context "Invoked" do
      context "Strictness" do
        context "Record Multiple" do
          context "Strict" do
            context "By Method Name" do
              invocation = Controls::Invocation.example

              recorder = Controls::Recorder.example

              recorder.record(invocation)
              recorder.record(invocation)

              test "Is an error" do
                assert_raises(Recorder::Error) do
                  recorder.invoked?(invocation.method_name, strict: true)
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
                  recorder.invoked?(invocation.method_name, some_parameter: 1, strict: true)
                end
              end
            end
          end

          context "Not Strict" do
            context "By Method Name" do
              invocation = Controls::Invocation.example

              recorder = Controls::Recorder.example

              recorder.record(invocation)
              recorder.record(invocation)

              test "Is not an error" do
                refute_raises(Recorder::Error) do
                  recorder.invoked?(invocation.method_name, strict: false)
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
                  recorder.invoked?(first_invocation.method_name, some_parameter: 1, strict: false)
                end
              end
            end
          end
        end
      end
    end
  end
end
