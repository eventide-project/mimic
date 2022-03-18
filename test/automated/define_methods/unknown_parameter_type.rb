require_relative '../automated_init'

context "Define Methods" do
  context "Unknown Parameter Type" do
    parameter_name = :"a#{SecureRandom.hex}"
    parameter_type = :"a#{SecureRandom.hex}"
    parameter = [parameter_type, parameter_name]

    test "Is an error" do
      assert_raises(DefineMethods::Error) do
        DefineMethods.parameter_signature(parameter)
      end
    end
  end
end
