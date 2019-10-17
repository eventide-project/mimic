require_relative 'automated_init'

context "Void Type" do
  context "Invocation" do
    test "Is an error" do
      assert_raises(Mimic::Void::Error) do
        Mimic::Void.new.any_method
      end
    end
  end
end
