require_relative '../../automated_init'

context "Recorder" do
  context "Predicate" do
    context "Method Name and Parameter Block" do
      invocation = Controls::Invocation.example

      context "Recorded" do
        recorder = Controls::Recorder.example

        recorder.record(invocation)

        detected = recorder.invoked?(invocation.method_name) do |parameter_name, parameter_value|
          parameter_name == :some_parameter &&
            parameter_value == 1
        end

        test "Detected" do
          assert(detected)
        end
      end

      context "Not Recorded (Method Name)" do
        recorder = Controls::Recorder.example

        recorder.record(invocation)

        detected = recorder.invoked?(SecureRandom.hex) do |parameter_name, parameter_value|
          parameter_name == :some_parameter &&
            parameter_value == 1
        end

        test "Not detected" do
          refute(detected)
        end
      end

      context "Not Recorded (Parameter)" do
        recorder = Controls::Recorder.example

        recorder.record(invocation)

        detected = recorder.invoked?(invocation.method_name) do |parameter_name, parameter_value|
          parameter_name == :some_parameter &&
            parameter_value == SecureRandom.hex
        end

        test "Not detected" do
          refute(detected)
        end
      end
    end
  end
end
