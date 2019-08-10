require_relative '../automated_init'

context "Recorder" do
  context "Invoked" do
    recorder = Controls::Recorder.example

    invocation = Controls::Invocation.example

    recorder.record(invocation)

    test "Detected" do
      assert(recorder.invoked?(invocation.method_name))
    end
  end
end
