require_relative 'automated_init'

context "Mimic" do
  subject_class = Controls::Subject::Anonymous.example

  mimic = Mimic.(subject_class)

  test "Constructs the mimicked class" do
    assert(mimic.is_a?(subject_class))
  end

## TODO obsolete as of the recorder implementation
## This is only one case (of two) now
  context "Implemented Methods" do
    implemented_methods = Controls::Subject.implemented_methods

    implemented_methods.each do |m|
      context "#{m}" do
        result = mimic.__send__(m)

        test "Voided" do
          assert(result.instance_of?(Void))
        end
      end
    end
  end
end
