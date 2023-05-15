require_relative '../../automated_init'

context "Recorder" do
  context "Predicate Module" do
    context "No Arguments" do
      context "Matches by Method Name" do
        invocation = Controls::Invocation.example
        other_invocation = Controls::Invocation.other_example

        context "Recorded" do
          mimic = Controls::Mimic::Predicate.example

          mimic.record(invocation)
          mimic.record(other_invocation)

          assert(mimic.invocations(invocation.method_name).length == 1)

          detected = mimic.some_predicate?

          detail "Recorded Invocations: #{mimic.records.inspect}"

          test "Detected" do
            assert(detected)
          end
        end

        context "Not Recorded" do
          mimic = Controls::Mimic::Predicate.example

          detected = mimic.some_predicate?

          assert(mimic.invocations(invocation.method_name).length == 0)

          detail "Recorded Invocations: #{mimic.records.inspect}"

          test "Not detected" do
            refute(detected)
          end
        end
      end
    end
  end
end
