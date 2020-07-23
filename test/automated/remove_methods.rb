require_relative 'automated_init'

context "Remove Methods" do
  subject_class = Controls::Subject::Anonymous.example

  RemoveMethods.(subject_class)

  context "Removed" do
    implemented_methods = Controls::Subject.implemented_methods

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
      detail "#{m}"

      test do
        assert(subject_class.instance_methods.include?(m))
      end
    end
  end

  detail "Remaining Instance Methods"
  subject_class.instance_methods.sort.each do |m|
    detail "#{m}"
  end
end
