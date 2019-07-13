require_relative 'automated_init'

context "Void Methods" do
  subject_class = Controls::Subject::Class::Anonymous.example

  VoidMethods.(subject_class)

  subject = subject_class.new

  context "Implemented Methods are Voided" do
    void_methods = Controls::Subject::Class.implemented_methods

    void_methods.each do |m|
      result = subject.__send__(m)

      test "#{m}" do
        assert(result.instance_of?(Void))
      end
    end
  end
end
