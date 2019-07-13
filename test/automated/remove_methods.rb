require_relative 'automated_init'

context "Remove Methods" do
  subject_class = Controls::Subject::Class::Anonymous.example

  RemoveMethods.(subject_class)

  context "Removed" do
    removed_methods = [:a_method, :another_method]

    removed_methods.each do |m|
      test "#{m}" do
        refute(subject_class.instance_methods.include?(m))
      end
    end
  end

  context "Preserved" do
    removed_methods = [:a_method, :another_method]

    RemoveMethods.preserved.each do |m|
      test "#{m}" do
        assert(subject_class.instance_methods.include?(m))
      end
    end
  end

  context "Remaining Instance Methods" do
    subject_class.instance_methods.sort.each do |m|
      test "#{m}" do; end
    end
  end
end
