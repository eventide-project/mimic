require_relative 'automated_init'

context "Remove Methods" do
  subject_class = Controls::Subject::Anonymous.example

  RemoveMethods.(subject_class)

  context "Removed" do
    implemented_methods = Controls::Subject::Class.implemented_methods

    implemented_methods.each do |m|
      test "#{m}" do
        refute(subject_class.instance_methods.include?(m))
      end
    end
  end

  context "Preserved Methods" do
    preserved_methods = Mimic.preserved_methods
    preserved_methods.delete(:method_missing)

    preserved_methods.each do |m|
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

  if ENV['VERBOSE'] == 'on'
    context "Remaining Instance Methods" do
      subject_class.instance_methods.sort.each do |m|
        comment "#{m}"
      end
    end
  end
end
