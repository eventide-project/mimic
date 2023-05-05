require_relative '../../../automated_init'

context "Recorder" do
  context "Query" do
    context "One Invocation" do
      context "Method Name and Parameter Block" do
        invocation = Controls::Invocation.example

        context "Recorded" do
          recorder = Controls::Recorder.example

          recorder.record(invocation)

          detected_invocation = recorder.invocation(invocation.method_name) do |parameter_name, parameter_value|
            parameter_name == :some_parameter &&
              parameter_value == 1
          end

          context "Retrieved" do
            assert(detected_invocation == invocation)
          end
        end

        context "Not Recorded (Method Name)" do
          recorder = Controls::Recorder.example

          recorder.record(invocation)

          detected_invocation = recorder.invocation(SecureRandom.hex) do |parameter_name, parameter_value|
            parameter_name == :some_parameter &&
              parameter_value == 1
          end

          test "Not retrieved" do
            assert(detected_invocation.nil?)
          end
        end

        context "Not Recorded (Parameter)" do
          recorder = Controls::Recorder.example

          recorder.record(invocation)

          detected_invocation = recorder.invocation(invocation.method_name) do |parameter_name, parameter_value|
            parameter_name == :some_parameter &&
              parameter_value == SecureRandom.hex
          end

          test "Not retrieved" do
            assert(detected_invocation.nil?)
          end
        end
      end
    end
  end
end
