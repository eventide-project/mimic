require_relative 'automated_init'

context "Void Methods" do
  subject_class = Controls::Subject::Class.example

  VoidMethods.(subject_class)

  subject = subject_class.new

  implemented_methods = Controls::Subject::Class.implemented_methods

  context "Implemented Methods are Voided" do
    implemented_methods.each do |m|
      result = subject.__send__(m)

      test "#{m}" do
        assert(result.instance_of?(Void))
      end
    end
  end

  context "Subject Methods" do
    void_methods = Mimic.subject_methods(subject_class)

    test "Subject class's implemented methods" do
      assert(void_methods.sort == implemented_methods.sort)
    end
  end
end
