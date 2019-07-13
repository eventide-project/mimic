require_relative 'automated_init'

context "Build" do
  subject_class = Controls::Subject::Class.example

  mimic_class = Build.(subject_class)

  replaced_methods = Controls::Subject::Class.implemented_methods

  context "Mimicked Class's Methods" do
    replaced_methods.each do |m|
      test "Replaced #{m}" do
        assert(mimic_class.instance_methods.include?(m))
      end
    end
  end

  context "Object's Instance Methods" do
    context "Preserved" do
      RemoveMethods.preserved.each do |m|
        assert_proc = proc { assert(subject_class.instance_methods.include?(m)) }

        if ENV['VERBOSE'] == 'on'
          test "#{m}" do
            assert_proc.()
          end
        else
          assert_proc.()
        end
      end

      if ENV['VERBOSE'] != 'on'
        test "(Object class's instance methods)" do; end
      end
    end
  end
end
