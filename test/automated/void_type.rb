require_relative 'automated_init'

context "Void Type" do
  context "Invocation" do
    test "Is an error" do
      assert proc { Mimic::Void.anything } do
        raises_error? Mimic::Void::Error
      end
    end

    test "Can't be initialized (new raises error)"
  end
end
