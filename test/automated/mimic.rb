require_relative 'automated_init'

context "Mimic" do
  subject_class = Controls::Subject::Class.example
  mimic = Mimic.(subject_class)

  test "Constructs the mimicked class" do
    assert(mimic.is_a?(subject_class))
  end

  context "Implemented Methods are Voided" do
    implemented_methods = Controls::Subject::Class.implemented_methods

    implemented_methods.each do |m|
      result = mimic.__send__(m)

      test "#{m}" do
        assert(result.instance_of?(Void))
      end
    end
  end
end
