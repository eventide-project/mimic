require_relative '../../../automated_init'

context "Recorder" do
  context "Queries" do
    context "One Invocation" do
      context "By Method Name and Parameters" do
        invocation = Controls::Invocation.example

        context "Recorded" do
          context "One" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)

            method_name = invocation.method_name
            parameters = { some_parameter: 1 }

            detected_invocation = recorder.one_invocation(method_name, **parameters)

            detail "Match Method Name: #{method_name.inspect}"
            detail "Match Parameters: #{parameters.inspect}"
            detail "Recorded Invocations: #{recorder.records.inspect}"

            test "Detected" do
              assert(detected_invocation)
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

            test "Is an error" do
              assert_raises(Recorder::Error) do
                recorder.one_invocation(method_name, **parameters)
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

            detected_invocation = recorder.one_invocation(method_name, **parameters)

            detail "Match Method Name: #{method_name.inspect}"
            detail "Match Parameters: #{parameters.inspect}"
            detail "Recorded Invocations: #{recorder.records.inspect}"

            test "Not detected" do
              assert(detected_invocation.nil?)
            end
          end

          context "By Parameters" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)

            method_name = invocation.method_name
            parameters = { some_parameter: SecureRandom.hex }

            detected_invocation = recorder.one_invocation(method_name, **parameters)

            detail "Match Method Name: #{method_name.inspect}"
            detail "Match Parameters: #{parameters.inspect}"
            detail "Recorded Invocations: #{recorder.records.inspect}"

            test "Not detected" do
              assert(detected_invocation.nil?)
            end
          end
        end
      end
    end
  end
end
