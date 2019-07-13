require_relative 'automated_init'

context "Void Result" do
  mimic = Controls::Mimic.example

  context "From mimicked methods" do
    [:some_method, :some_other_method].each do |m|
      test "#{m}" do
        assert(mimic.send(m).is_a?(Mimic::Void))
      end
    end
  end
end
