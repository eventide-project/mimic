require_relative '../../../automated_init'

context "Recorder" do
  context "Queries" do
    context "Invocations" do
      context "By Method Name and Parameters" do
        invocation = Controls::Invocation.example
        other_invocation = Controls::Invocation.other_example

        context "Retrieve One" do
          context "One Parameter Match" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)
            recorder.record(other_invocation)

            method_name = invocation.method_name
            parameters = { some_parameter: 1 }

            detected_invocations = recorder.invocations(method_name, **parameters)

            detail "Match Method Name: #{method_name.inspect}"
            detail "Match Parameters: #{parameters.inspect}"
            detail "Recorded Invocations: #{recorder.records.inspect}"
            detail "Detected Invocations: #{detected_invocations.inspect}"

            context "Detected" do
              assert(detected_invocations.count == 1)

              test do
                assert(detected_invocations[0] == invocation)
              end
            end
          end

          context "Many Parameter Match" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)
            recorder.record(other_invocation)

            method_name = invocation.method_name
            parameters = { some_parameter: 1, some_other_parameter: 11 }

            detected_invocations = recorder.invocations(method_name, **parameters)

            detail "Match Method Name: #{method_name.inspect}"
            detail "Match Parameters: #{parameters.inspect}"
            detail "Recorded Invocations: #{recorder.records.inspect}"
            detail "Detected Invocations: #{detected_invocations.inspect}"

            context "Detected" do
              assert(detected_invocations.count == 1)

              test do
                assert(detected_invocations[0] == invocation)
              end
            end
          end
        end

        context "Retrieve Multiple" do
          context "One Parameter Match" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)
            recorder.record(invocation)
            recorder.record(other_invocation)

            method_name = invocation.method_name
            parameters = { some_parameter: 1 }

            detected_invocations = recorder.invocations(method_name, **parameters)

            detail "Match Method Name: #{method_name.inspect}"
            detail "Match Parameters: #{parameters.inspect}"
            detail "Recorded Invocations: #{recorder.records.inspect}"
            detail "Detected Invocations: #{detected_invocations.inspect}"

            context "Detected" do
              assert(detected_invocations.count == 2)

              test "First" do
                assert(detected_invocations[0] == invocation)
              end

              test "Second" do
                assert(detected_invocations[1] == invocation)
              end
            end
          end

          context "Many Parameter Match" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)
            recorder.record(invocation)
            recorder.record(other_invocation)

            method_name = invocation.method_name
            parameters = { some_parameter: 1, some_other_parameter: 11 }

            detected_invocations = recorder.invocations(method_name, **parameters)

            detail "Match Method Name: #{method_name.inspect}"
            detail "Match Parameters: #{parameters.inspect}"
            detail "Recorded Invocations: #{recorder.records.inspect}"
            detail "Detected Invocations: #{detected_invocations.inspect}"

            context "Retrieved" do
              assert(detected_invocations.count == 2)

              test "First" do
                assert(detected_invocations[0] == invocation)
              end

              test "Second" do
                assert(detected_invocations[1] == invocation)
              end
            end
          end
        end

        context "None Retrieved" do
          context "By Method Name" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)
            recorder.record(other_invocation)

            method_name = SecureRandom.hex
            parameters = { some_parameter: 1 }

            detected_invocations = recorder.invocations(method_name, **parameters)

            detail "Match Method Name: #{method_name.inspect}"
            detail "Match Parameters: #{parameters.inspect}"
            detail "Recorded Invocations: #{recorder.records.inspect}"
            detail "Detected Invocations: #{detected_invocations.inspect}"

            test "Not retrieved" do
              assert(detected_invocations.empty?)
            end
          end

          context "By Parameters" do
            recorder = Controls::Recorder.example

            recorder.record(invocation)
            recorder.record(other_invocation)

            method_name = invocation.method_name
            parameters = { some_parameter: SecureRandom.hex }

            detected_invocations = recorder.invocations(invocation.method_name, **parameters)

            detail "Match Method Name: #{method_name.inspect}"
            detail "Match Parameters: #{parameters.inspect}"
            detail "Recorded Invocations: #{recorder.records.inspect}"
            detail "Detected Invocations: #{detected_invocations.inspect}"

            test "Not retrieved" do
              assert(detected_invocations.empty?)
            end
          end
        end
      end
    end
  end
end
