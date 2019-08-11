require_relative '../../automated_init'

context "Recorder" do
  context "Invocation" do
    context "Method Name and Parameter Block" do
      invocation = Controls::Invocation.example

      context "Recorded" do
        recorder = Controls::Recorder.example

        recorder.record(invocation)

        detected_invocation = recorder.invocation(invocation.method_name) do |parameter_name, parameter_value|
          parameter_name == :some_parameter &&
            parameter_value == 1
        end

        test "Retrieved" do
          refute(detected_invocation.nil?)
        end
      end

      context "Not Recorded (Method Name)" do
        recorder = Controls::Recorder.example

        recorder.record(invocation)

        detected_invocation = recorder.invocation(SecureRandom.hex) do |parameter_name, parameter_value|
          parameter_name == :some_parameter &&
            parameter_value == 1
        end

        test "Not Retrieved" do
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

        test "Not Retrieved" do
          assert(detected_invocation.nil?)
        end
      end
    end
  end
end
