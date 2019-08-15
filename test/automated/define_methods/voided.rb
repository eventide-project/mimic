require_relative '../automated_init'

context "Define Methods" do
  subject_class = Controls::Subject.example

  subject = Mimic.(subject_class)

  implemented_methods = Controls::Subject.implemented_methods

  context "Voided" do
    implemented_methods.each do |m|
      result = subject.__send__(m)

      test "#{m}" do
        assert(result.instance_of?(Void))
      end
    end
  end
end
