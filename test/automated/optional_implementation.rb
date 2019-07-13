require_relative 'automated_init'

context "Optional Implementation" do
  subject_class = Controls::Subject::Class::Anonymous.example

  random_method_name = "method_#{SecureRandom.hex.downcase}"

  mimic = Mimic.(subject_class) do
    define_method(random_method_name) do
    end
  end

  context "Optional Methods" do
    test "Added to mimic's implementation" do
      assert(mimic.respond_to?(random_method_name))
    end
  end
end
