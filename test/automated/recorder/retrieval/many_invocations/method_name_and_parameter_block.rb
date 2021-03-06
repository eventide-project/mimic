require_relative '../../../automated_init'

context "Recorder" do
  context "Retrieval" do
    context "Many Invocations" do
      context "Method Name and Parameter Block" do
        invocation = Controls::Invocation.example

        context "Recorded" do
          recorder = Controls::Recorder.example

          recorder.record(invocation)
          recorder.record(invocation)

          detected_invocations = recorder.invocations(invocation.method_name) do |parameter_name, parameter_value|
            parameter_name == :some_parameter &&
              parameter_value == 1
          end

          context "Retrieved" do
            test "First" do
              assert(detected_invocations[0] == invocation)
            end

            test "Second" do
              assert(detected_invocations[1] == invocation)
            end
          end
        end

        context "Not Recorded (Method Name)" do
          recorder = Controls::Recorder.example

          recorder.record(invocation)
          recorder.record(invocation)

          detected_invocations = recorder.invocations(SecureRandom.hex) do |parameter_name, parameter_value|
            parameter_name == :some_parameter &&
              parameter_value == 1
          end

          test "Not retrieved" do
            assert(detected_invocations.empty?)
          end
        end

        context "Not Recorded (Parameter)" do
          recorder = Controls::Recorder.example

          recorder.record(invocation)
          recorder.record(invocation)

          detected_invocations = recorder.invocations(invocation.method_name) do |parameter_name, parameter_value|
            parameter_name == :some_parameter &&
              parameter_value == SecureRandom.hex
          end

          test "Not retrieved" do
            assert(detected_invocations.empty?)
          end
        end
      end
    end
  end
end
