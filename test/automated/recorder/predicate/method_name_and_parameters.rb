require_relative '../../automated_init'

context "Recorder" do
  context "Predicate" do
    context "Method Name and Parameters" do
      invocation = Controls::Invocation.example

      context "Recorded" do
        recorder = Controls::Recorder.example

        recorder.record(invocation)

        method_name = invocation.method_name
        parameters = { some_parameter: 1 }

        detected = recorder.invoked?(method_name, **parameters)

        detail "Match Method Name: #{method_name.inspect}"
        detail "Match Parameters: #{parameters.inspect}"
        detail "Recorded Invocations: #{recorder.records.inspect}"

        test "Detected" do
          assert(detected)
        end
      end

      context "Not Recorded" do
        context "By Method Name" do
          recorder = Controls::Recorder.example

          recorder.record(invocation)

          method_name = SecureRandom.hex
          parameters = { some_parameter: 1 }

          detected = recorder.invoked?(method_name, **parameters)

          detail "Match Method Name: #{method_name.inspect}"
          detail "Match Parameters: #{parameters.inspect}"
          detail "Recorded Invocations: #{recorder.records.inspect}"

          test "Not detected" do
            refute(detected)
          end
        end

        context "By Parameters" do
          recorder = Controls::Recorder.example

          recorder.record(invocation)

          method_name = invocation.method_name
          parameters = { some_parameter: SecureRandom.hex }

          detected = recorder.invoked?(method_name, **parameters)

          detail "Match Method Name: #{method_name.inspect}"
          detail "Match Parameters: #{parameters.inspect}"
          detail "Recorded Invocations: #{recorder.records.inspect}"

          test "Not detected" do
            refute(detected)
          end
        end
      end
    end
  end
end
