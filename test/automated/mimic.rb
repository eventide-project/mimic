require_relative 'automated_init'

context "Mimic" do
  subject = Controls::Subject::Class.example
  mimic = Mimic.(subject)

  test "Constructs the mimicked class" do
    assert(mimic.is_a?(subject))
  end
end
