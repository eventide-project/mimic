require_relative '../../automated_init'

context "Recorder" do
  context "Predicate Module" do
    context "Record Multiple" do
      context "Strict" do
        context "By Method Name" do
          invocation = Controls::Invocation.example

          mimic = Controls::Mimic::Predicate.example

          mimic.record(invocation)
          mimic.record(invocation)

          test "Is an error" do
            assert_raises(Recorder::Error) do
              mimic.some_predicate?
            end
          end
        end

        context "By Parameters" do
          invocation = Controls::Invocation.example

          mimic = Controls::Mimic::Predicate.example

          mimic.record(invocation)
          mimic.record(invocation)

          test "Is an error" do
            assert_raises(Recorder::Error) do
              mimic.some_predicate?(some_parameter: 1)
            end
          end
        end
      end

      context "Not Strict" do
        context "By Method Name" do
          invocation = Controls::Invocation.example

          mimic = Controls::Mimic::Predicate.example(strict: false)

          mimic.record(invocation)
          mimic.record(invocation)

          test "Is not an error" do
            refute_raises(Recorder::Error) do
              mimic.some_predicate?
            end
          end
        end

        context "By Parameters" do
## Why unique invocations?
## What's differentiated/discriminated?
          first_invocation = Controls::Invocation.example
          second_invocation = Controls::Invocation.example

          mimic = Controls::Mimic::Predicate.example(strict: false)

          mimic.record(first_invocation)
          mimic.record(second_invocation)

          test "Is not an error" do
            refute_raises(Recorder::Error) do
              mimic.some_predicate?(some_parameter: 1)
            end
          end
        end
      end
    end
  end
end
