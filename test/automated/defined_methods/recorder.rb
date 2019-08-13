require_relative '../automated_init'

context "Define Methods" do
  context "Recorder" do
    subject_class = Controls::Subject.example

    DefineMethods.(subject_class, record: true)

    implemented_methods = Controls::Subject.implemented_methods

    context "Implemented Methods" do
      subject = subject_class.new
      subject.extend Mimic::Recorder

      implemented_methods.each do |m|
        context "#{m}" do
          result = subject.__send__(m)

          test "Voided" do
            assert(result.instance_of?(Void))
          end

          test "Recorded interactions" do
            assert(subject.invoked?(m))
          end
        end
      end
    end
  end
end
