require_relative '../automated_init'

context "Recorder" do
  context "Record" do
    recorder = Controls::Recorder.example

    invocation = Controls::Invocation.example

    recorder.record(invocation)

    context "Invocation" do
      test "Included in list of recorded invocations" do
        assert(recorder.records.include?(invocation))
      end
    end
  end
end
