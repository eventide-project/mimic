require_relative 'automated_init'

context "Void Methods" do
  subject_class = Controls::Subject::Class::Anonymous.example

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
    test "Subject class's implemented methods" do
      void_methods = Mimic.subject_methods(subject_class)
      assert(void_methods == implemented_methods)
    end
  end
end
