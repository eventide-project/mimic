require_relative 'automated_init'

context "Mimic" do
  subject_class = Controls::Subject::Anonymous.example

  mimic = Mimic.(subject_class)

  test "Constructs the mimicked class" do
    assert(mimic.is_a?(subject_class))
  end

  test "Is not a recorder" do
    refute(mimic.is_a?(Mimic::Recorder))
  end
end
