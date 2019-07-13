require_relative 'automated_init'

context "Instance Methods" do
  mimic = Controls::Mimic.example

  context "Implemented" do
    test "some_method" do
      assert(mimic.respond_to?(:a_method))
    end

    test "some_other_method" do
      assert(mimic.respond_to?(:another_method))
    end
  end
end
