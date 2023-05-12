require_relative '../../../automated_init'

context "Recorder" do
  context "Predicate" do
    context "Invoked Once" do
      context "By Method Name and Parameters" do
        invocation = Controls::Invocation.example

        context "Recorded" do
          context "One" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)

            method_name = invocation.method_name
            parameters = { some_parameter: 1 }

            detected = recorder.invoked_once?(method_name, **parameters)

            detail "Match Method Name: #{method_name.inspect}"
            detail "Match Parameters: #{parameters.inspect}"
            detail "Recorded Invocations: #{recorder.records.inspect}"

            test "Detected" do
              assert(detected)
            end
          end

          context "Many" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)
            recorder.record(invocation)

            method_name = invocation.method_name
            parameters = { some_parameter: 1 }

            detail "Match Method Name: #{method_name.inspect}"
            detail "Match Parameters: #{parameters.inspect}"
            detail "Recorded Invocations: #{recorder.records.inspect}"

            test "Detected" do
              assert_raises(Recorder::Error) do
                recorder.invoked_once?(method_name, **parameters)
              end
            end
          end
        end

        context "Not Recorded" do
          context "By Method Name" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)

            method_name = SecureRandom.hex
            parameters = { some_parameter: 1 }

            detected = recorder.invoked_once?(method_name, **parameters)

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

            detected = recorder.invoked_once?(method_name, **parameters)

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
end
