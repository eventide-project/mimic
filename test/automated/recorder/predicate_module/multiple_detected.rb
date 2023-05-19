require_relative '../../automated_init'

context "Recorder" do
  context "Predicate Module" do
    context "Multiple Detected" do
      invocation = Controls::Invocation.example

      context "Strict (Default)" do
        context "By Method Name" do
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
          mimic = Controls::Mimic::Predicate.example(strict: false)

          mimic.record(invocation)
          mimic.record(invocation)

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
