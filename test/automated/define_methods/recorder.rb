require_relative '../automated_init'

context "Define Methods" do
  context "Recorder" do
    subject_class = Controls::Subject.example

    subject = Mimic.(subject_class, record: true)

    implemented_methods = Controls::Subject.implemented_methods

    test "Interactions are recorded" do
      implemented_methods.each do |m|
        subject.__send__(m)

        test "#{m}" do
          assert(subject.invoked?(m))
        end
      end
    end
  end
end
