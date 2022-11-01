require_relative 'automated_init'

context "Optional Implementation" do
  subject_class = Controls::Subject.example

  random_method_name = "method_#{SecureRandom.hex.downcase}"
  random_result = SecureRandom.hex

  mimic = Mimic.(subject_class) do
    define_method(random_method_name) do
      random_result
    end
  end

  result = mimic.send(random_method_name)

  context "Optional Methods" do
    test "Added to mimic's implementation" do
      assert(result == random_result)
    end
  end
end
