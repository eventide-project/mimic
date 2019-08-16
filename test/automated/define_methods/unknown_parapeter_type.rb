require_relative '../automated_init'

context "Define Methods" do
  context "Unknown Parameter Type" do
    parameter_name = :"a#{SecureRandom.hex}"
    parameter_type = :"a#{SecureRandom.hex}"
    parameter = [parameter_type, parameter_name]

    test "Is an error" do
      assert proc { DefineMethods.parameter_signature(parameter) } do
        raises_error? DefineMethods::Error
      end
    end
  end
end
