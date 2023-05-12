require_relative '../../../automated_init'

context "Recorder" do
  context "Query" do
    context "One Invocation" do
      context "By Method Name and Parameters" do
        invocation = Controls::Invocation.example

        context "Retrieve One" do
          context "One Parameter Match" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)

            method_name = invocation.method_name
            parameters = { some_parameter: 1 }

            detected_invocation = recorder.invocation(method_name, **parameters)

            detail "Match Method Name: #{method_name.inspect}"
            detail "Match Parameters: #{parameters.inspect}"
            detail "Recorded Invocations: #{recorder.records.inspect}"
            detail "Detected Invocation: #{detected_invocation.inspect}"

            context "Retrieved" do
              assert(detected_invocation == invocation)
            end
          end

          context "Many Parameter Match" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)

            method_name = invocation.method_name
            parameters = { some_parameter: 1, some_other_parameter: 11 }

            detected_invocation = recorder.invocation(method_name, **parameters)

            detail "Match Method Name: #{method_name.inspect}"
            detail "Match Parameters: #{parameters.inspect}"
            detail "Recorded Invocations: #{recorder.records.inspect}"
            detail "Detected Invocation: #{detected_invocation.inspect}"

            context "Detected" do
              test do
                assert(detected_invocation == invocation)
              end
            end
          end
        end

        context "None Retrieved" do
          context "By Method Name" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)

            method_name = SecureRandom.hex
            parameters = { some_parameter: 1 }

            detected_invocation = recorder.invocation(method_name, **parameters)

            detail "Match Method Name: #{method_name.inspect}"
            detail "Match Parameters: #{parameters.inspect}"
            detail "Recorded Invocations: #{recorder.records.inspect}"
            detail "Detected Invocation: #{detected_invocation.inspect}"

            test "Not retrieved" do
              assert(detected_invocation.nil?)
            end
          end

          context "By Parameters" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)

            method_name = invocation.method_name
            parameters = { some_parameter: SecureRandom.hex }

            detected_invocation = recorder.invocation(method_name, **parameters)

            detail "Match Method Name: #{method_name.inspect}"
            detail "Match Parameters: #{parameters.inspect}"
            detail "Recorded Invocations: #{recorder.records.inspect}"
            detail "Detected Invocation: #{detected_invocation.inspect}"

            test "Not retrieved" do
              assert(detected_invocation.nil?)
            end
          end
        end
      end
    end
  end
end
