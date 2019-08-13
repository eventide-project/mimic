require_relative '../automated_init'

context "Define Methods" do
  context "No Recorder" do
    subject_class = Controls::Subject.example

    DefineMethods.(subject_class)

    subject = subject_class.new

    implemented_methods = Controls::Subject.implemented_methods

    context "Implemented Methods" do
      implemented_methods.each do |m|
        context "#{m}" do
          result = subject.__send__(m)

          test "Voided" do
            assert(result.instance_of?(Void))
          end
        end
      end
    end
  end
end
