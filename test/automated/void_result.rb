require_relative 'automated_init'

context "Void Result" do
  mimic = Controls::Mimic.example

  context "From mimicked methods" do
    [:a_method, :another_method].each do |m|
      result = mimic.__send__(m)

      test "#{m}" do
        assert(result == Mimic::Void)
      end
    end
  end
end
