require_relative '../automated_init'

context "Define Methods" do
  context "No Recorder" do
    subject_class = Controls::Subject.example

    DefineMethods.(subject_class)

    subject = subject_class.new

    implemented_methods = Controls::Subject.implemented_methods

    context "Implemented Methods" do
      implemented_methods.each do |m|
        result = subject.__send__(m)

        test "Voided #{m}" do
          assert(result.instance_of?(Void))
        end
      end
    end

## TODO What's this do?
    context "Subject Methods" do
      void_methods = Mimic.subject_methods(subject_class)

      test "Subject class's implemented methods" do
        assert(void_methods.sort == implemented_methods.sort)
      end
    end
  end
end
